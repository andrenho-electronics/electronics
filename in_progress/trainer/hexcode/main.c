#define F_CPU 1000000UL

//
// HEADERS
//

#include <stdbool.h>
#include <stdint.h>

#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/sleep.h>
#include <avr/wdt.h>
#include <util/delay.h>


//
// DEFINITIONS
//

#define DIGITS PORTB
#define DIGIT_0 PB4
#define DIGIT_1 PB5
#define DIGIT_2 PB6
#define DIGIT_3 PB7

#define LEDS PORTA
#define LED_A PA2
#define LED_B PA7
#define LED_C PA5
#define LED_D PA1
#define LED_E PA0
#define LED_F PA4
#define LED_G PA6

//
// MACROS
//

#define DEBUG(n) { if(n) { PORTD |= (1 << PD4); } else { PORTD &= ~(1 << PD4); } }
#define DEBUG_TOGGLE() { PORTD ^= (1 << PD4); }

#define HEX_DEC() (PINB & (1 << PB3))

// ps. the following ports are inverted!
#define set_S0(n) { if(!(n)) { PORTD |= (1 << PD3); } else { PORTD &= ~(1 << PD3); } }
#define set_S1(n) { if(!(n)) { PORTD |= (1 << PD2); } else { PORTD &= ~(1 << PD2); } }
#define set_S2(n) { if(!(n)) { PORTD |= (1 << PD0); } else { PORTD &= ~(1 << PD0); } }
#define set_S3(n) { if(!(n)) { PORTD |= (1 << PD1); } else { PORTD &= ~(1 << PD1); } }
#define Z() (((PINB & (1 << PB2)) == 0) ? 1 : 0)

// 
// GLOBAL VARIABLES
//

int current_digit = 0;
uint16_t number = 0x0000;


//
// 7 SEGMENT DISPLAY MANIPULATION
//

static void initialize_7seg()
{
    // setup a timer with a frequency of 300 Hz
    // (using a prescaler of 256, we call the interrupt at each 12 ticks)
    // this interrupt will multiplex the digits

    TCCR0 = (1 << CS02);    // prescaler 256
    TCCR0 |= (1 << WGM01);  // CTC mode
    OCR0 = 12;              // number of ticks
    TIMSK = (1 << OCIE0);   // fire interrupts
}


uint8_t digit_value(uint8_t digit, uint16_t n, bool decimal, bool* error)
{
    *error = false;

    uint16_t v = number;
    if(!decimal) {
        v >>= (4 * (3-digit));
        v &= 0xF;
    } else {
        if(v > 9999) {
            *error = true;
            return 0;
        }
        for(int i=0; i<(3-digit); ++i) { v /= 10; }
        v %= 10;
    }       
    return (uint8_t)v;
}

void set_digit_output(uint8_t digit, uint8_t value)
{
    LEDS = 0;  // clear leds

    switch(value) {
    case 0x0: LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C)|(1<<LED_D)|(1<<LED_E)|(1<<LED_F); break;
    case 0x1: LEDS |= (1<<LED_B)|(1<<LED_C); break;
    case 0x2: LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_D)|(1<<LED_E)|(1<<LED_G); break;
    case 0x3: LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C)|(1<<LED_D)|(1<<LED_G); break;
    case 0x4: LEDS |= (1<<LED_B)|(1<<LED_C)|(1<<LED_F)|(1<<LED_G); break;
    case 0x5: LEDS |= (1<<LED_A)|(1<<LED_C)|(1<<LED_D)|(1<<LED_F)|(1<<LED_G); break;
    case 0x6: LEDS |= (1<<LED_A)|(1<<LED_C)|(1<<LED_D)|(1<<LED_E)|(1<<LED_F)|(1<<LED_G); break;
    case 0x7: LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C); break;
    case 0x8: LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C)|(1<<LED_D)|(1<<LED_E)|(1<<LED_F)|(1<<LED_G); break;
    case 0x9: LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C)|(1<<LED_D)|(1<<LED_F)|(1<<LED_G); break;
    case 0xA: LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C)|(1<<LED_E)|(1<<LED_F)|(1<<LED_G); break;
    case 0xB: LEDS |= (1<<LED_C)|(1<<LED_D)|(1<<LED_E)|(1<<LED_F)|(1<<LED_G); break;
    case 0xC: LEDS |= (1<<LED_A)|(1<<LED_D)|(1<<LED_E)|(1<<LED_F); break;
    case 0xD: LEDS |= (1<<LED_B)|(1<<LED_C)|(1<<LED_D)|(1<<LED_E)|(1<<LED_G); break;
    case 0xE: LEDS |= (1<<LED_A)|(1<<LED_D)|(1<<LED_E)|(1<<LED_F)|(1<<LED_G); break;
    case 0xF: LEDS |= (1<<LED_A)|(1<<LED_E)|(1<<LED_F)|(1<<LED_G); break;
    case '-': LEDS |= (1<<LED_G); break;
    }

    switch(digit) {
    case 0:
        DIGITS &= ~((1<<DIGIT_1) | (1<<DIGIT_2) | (1<<DIGIT_3));
        DIGITS |= (1<<DIGIT_0);
        break;
    case 1:
        DIGITS &= ~((1<<DIGIT_0) | (1<<DIGIT_2) | (1<<DIGIT_3));
        DIGITS |= (1<<DIGIT_1);
        break;
    case 2:
        DIGITS &= ~((1<<DIGIT_0) | (1<<DIGIT_1) | (1<<DIGIT_3));
        DIGITS |= (1<<DIGIT_2);
        break;
    case 3:
        DIGITS &= ~((1<<DIGIT_0) | (1<<DIGIT_1) | (1<<DIGIT_2));
        DIGITS |= (1<<DIGIT_3);
        break;
    }
}

ISR(TIMER0_COMP_vect)
{
    bool error = false;
    uint8_t v = digit_value(current_digit, number, HEX_DEC(), &error);
    if(error) {
        set_digit_output(current_digit, '-');
    } else {
        set_digit_output(current_digit, v);
    }

    ++current_digit;
    if(current_digit > 3) {
        current_digit = 0;
    }
}


//
// 16-BIT USER INPUT (CD4067)
//

uint16_t user_input()
{
    uint16_t n = 0;
    for(int8_t i=15; i>=0; --i) {

        n <<= 1;

        // read from CD4067
        set_S0(i & 0x1);
        set_S1((i >> 1) & 0x1);
        set_S2((i >> 2) & 0x1);
        set_S3((i >> 3) & 0x1);
        _delay_ms(10); // wait for reply

        n |= Z();
        // n = (n << 1) | Z();
        _delay_ms(10);
    }

    return n;
}

//
// MAIN PROCEDURE
//

int main()
{
    _delay_ms(500);

    // initialize
    DDRA = 0b11111111;
    DDRB = 0b11110000;    // PB0..3 = inputs
    DDRC = 0b11111111;
    DDRD = 0b11111111;
    PORTB |= (1 << PB2);  // enable internal pull-up in PB2

    initialize_7seg();
    sei();

    number = user_input();

    for(;;) {
        number = user_input();
        /*
        _delay_ms(10);
        //DEBUG_TOGGLE();
        DEBUG(1);
        _delay_ms(10);
        DEBUG(0);
        */
    }
}


// vim: ts=4:sw=4:sts=4:expandtab
