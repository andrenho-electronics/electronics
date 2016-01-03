#define F_CPU 1000000UL

#include <avr/io.h>
#include <util/delay.h>

#define DEBUG_TOGGLE() { PORTD ^= (1 << PD6); }

int main()
{
    DDRD = 0xff;

    _delay_ms(50);

    for(;;) {
        DEBUG_TOGGLE();
        _delay_ms(10);
        DEBUG_TOGGLE();
        _delay_ms(500);
    }
}

// vim: ts=4:sw=4:sts=4:expandtab
