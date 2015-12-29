#define F_CPU 1000000UL

#include <stdint.h>

#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/sleep.h>
#include <avr/wdt.h>
#include <util/delay.h>


int main()
{
    for(;;) {
        PORTD ^= (1 << PD4);
        _delay_ms(500);
    }
    return 0;
}

// vim: ts=4:sw=4:sts=4:expandtab
