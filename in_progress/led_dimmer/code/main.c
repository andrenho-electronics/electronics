#define F_CPU 4000000UL

#include <stdint.h>
#include <stdbool.h>

#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/sleep.h>
#include <avr/wdt.h>
#include <util/delay.h>

static void initialize();
static int voltage_level();
static void set_led_pwm_level(int n);

bool enable_verify = true;

ISR(TIMER1_COMPA_vect)
{
    enable_verify = !enable_verify;  // TODO - can this fail?
}


ISR(ANA_COMP_vect)
{
    if(enable_verify) {
        PORTD |= (1<<PD6);
        _delay_us(40);
        PORTD &= ~(1<<PD6);
    }
}


int main()
{
    initialize();

    //int v = voltage_level();
    while(1) {
        /*
        for(int v=0; v<8; ++v) {
            set_led_pwm_level(v);
            _delay_ms(1000);
        }
        */
    }
}


void initialize()
{
    // initialize PWM for LED
    DDRB |= (1 << PB2);                     // PWM output in PD3
    TCCR0A = (1 << COM0A1) | (1 << WGM00);  // phase correct PWM mode
    //OCR0A = 0x80;                         // initial PWM pusle width
    TCCR0B = (1 << CS01);                   // clock source = CLK/8, start PWM

    // initialize CTC for activating RC circuit (output in PD5)
    DDRB |= (1 << PB3);         // PWM output in PD3
    OCR1A = 0x400;              // count up to 0x400 (1024)
    TCCR1A |= (1 << COM1A0);    // toggle pin PB3 on match
    TCCR1B |= (1 << CS10);      // no prescaler
    TCCR1B |= (1 << WGM12);     // activate CTC
    TIMSK |= (1 << OCIE1A);     // enable interrupt

    // initialize analog comparator
    ACSR = (1 << ACIE);         // enable interrupt
    // TODO - only when rising

    sei();
}


int voltage_level()
{
    return 1;
}


void set_led_pwm_level(int n)
{
    switch(n) {
        case 0: OCR0A = 0x0; break;
        case 1: OCR0A = 0x1; break;
        case 2: OCR0A = 0x4; break;
        case 3: OCR0A = 0xB; break;
        case 4: OCR0A = 0x1A; break;
        case 5: OCR0A = 0x3C; break;
        case 6: OCR0A = 0x7C; break;
        case 7: OCR0A = 0xFF; break;
    }
}

/*
volatile int done_comparing = 0;
volatile int timer = 0;

SIGNAL (TIMER0_COMPA_vect)
{
    if(!done_comparing) {
        ++timer;
    }
}

ISR(ANA_COMP_vect) {
 
    //with this test, ensure that indeed the interrupt result is 1 = V(AIN0) > V(AIN1)
    //(double check ?)
    if ( (ACSR & (1 << ACO)) != 0 ) {
        //PORTD &= ~(1<<PORTD5);
    } else {
        done_comparing = 1;
        //PORTD |= (1<<PORTD5);
    }
}

int main()
{
    _delay_ms(500);
    // PORTD |= (1<<PORTD5);

    // setup analog comparator
    DDRB = 0xFC;
	ACSR  |=
        (0<<ACD)   |         // Comparator ON
        (0<<ACBG)  |         // Disconnect 1.23V reference from AIN0 (use AIN0 and AIN1 pins)
        (1<<ACIE)  |         // Comparator Interrupt enabled
        (0<<ACIC)  |         // input capture disabled
        (1<<ACIS1) |         // set interrupt bit on rising edge
        (1<<ACIS0);          //    (ACIS1 and ACIS0 == 11)

    // setup timer
    OCR0A  = 0x01;      // number to count up to (0x70 = 112)
    TCCR0A = 0x02;      // Clear Timer on Compare Match (CTC) mode
    TIFR |= 0x01;       // clear interrupt flag
    TIMSK = 0x01;       // TC0 compare match A interrupt enable
    TCCR0B = 0x05;      // clock source CLK/1024, start timer

	sei();

    while(1) { 
        cli();
        DDRB = 0xFF;
        _delay_ms(1);
        DDRB = 0xFC;
        done_comparing = 0;
        timer = 0;
        sei();

        while(!done_comparing) {}
        if(timer < 10) {
            PORTD |= (1<<PORTD5);
        } else {
            PORTD &= ~(1<<PORTD5);
        }
        //PORTD ^= (1<<PORTD4); _delay_ms(200); 
        DDRB = 0xFC;
        _delay_ms(2000);
        DDRB = 0xFF;
        _delay_ms(10);
    }

    return 0;
}
*/

// vim: ts=4:sw=4:sts=4:expandtab
