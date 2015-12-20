#define F_CPU 4000000UL

#include <stdint.h>

#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/sleep.h>
#include <avr/wdt.h>
#include <util/delay.h>

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
        /*
        //PORTD ^= (1<<PORTD4); _delay_ms(200); 
        DDRB = 0xFC;
        _delay_ms(2000);
        DDRB = 0xFF;
        _delay_ms(10);
        */
    }

    return 0;
}

// vim: ts=4:sw=4:sts=4:expandtab
