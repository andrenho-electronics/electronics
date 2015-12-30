#define F_CPU 1000000UL

//
// HEADERS
//

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
#define DIGIT_0 PORTB4
#define DIGIT_1 PORTB5
#define DIGIT_2 PORTB6
#define DIGIT_3 PORTB7

#define LEDS PORTA
#define LED_A PORTA2
#define LED_B PORTA7
#define LED_C PORTA5
#define LED_D PORTA1
#define LED_E PORTA0
#define LED_F PORTA4
#define LED_G PORTA6


//
// MACROS
//

#define DEBUG(n) { if(n) { PORTD |= (1 << PD4); } else { PORTD &= ~(1 << PD4); } }
#define DEBUG_TOGGLE() { PORTD ^= (1 << PD4); }


// 
// GLOBAL VARIABLES
//

int current_digit = 0;


//
// INITIALIZATION
//

static void initialize_ports()
{
    DDRA = 0b11111111;
    DDRB = 0b00001111;
}

static void initialize_7seg()
{
    // setup a timer with a frequency of 300 Hz
    // (using a prescaler of 256, we call the interrupt at each 12 ticks)

    TCCR0 = (1 << CS02);    // prescaler 256
    TCCR0 |= (1 << WGM01);  // CTC mode
    OCR0 = 12;              // number of ticks
    TIMSK = (1 << OCIE0);   // fire interrupts
}

//
// 7 SEGMENT DISPLAY MANIPULATION
//

void set_digit_output(uint8_t digit, uint8_t value)
{
    LEDS = 0;  // clear leds

    switch(value) {
    case 0x0: LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C)|(1<<LED_D)|(1<<LED_E)|(1<<LED_F); break;
    case 0x1: LEDS |= (1<<LED_B)|(1<<LED_C); break;
    case 0x2: LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_D)|(1<<LED_E)|(1<<LED_G); break;
    case 0x3: LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C)|(1<<LED_D)|(1<<LED_G); break;
    case 0x4: LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C)|(1<<LED_F)|(1<<LED_G); break;
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


//
// MAIN PROCEDURE
//

int main()
{
    initialize_ports();
    initialize_7seg();
    sei();

    for(;;) {
        DEBUG_TOGGLE();
        _delay_ms(500);
    }
}


//
// INTERRUPTS
//
ISR(TIMER0_COMP_vect)
{
    set_digit_output(current_digit++, 0);
    if(current_digit > 3) {
        current_digit = 0;
    }
}


// vim: ts=4:sw=4:sts=4:expandtab
