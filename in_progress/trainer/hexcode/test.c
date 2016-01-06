#define F_CPU 1000000UL

#include <avr/io.h>
#include <util/delay.h>

#define DEBUG_TOGGLE() { PORTD ^= (1 << PD6); }

#define BAUD 2400
#define BAUDRATE ((F_CPU)/(BAUD*16UL)-1)

int main()
{
    DDRD = 0xff;

    _delay_ms(50);

    // initialize UART
    UBRRH = (BAUDRATE >> 8);               // set baud rate 
    UBRRL = BAUDRATE;                       
    UCSRB |= (1 << TXEN) | (1 << RXEN);    // enable TX and RX ports
    UCSRC |= (1 << UCSZ0) | (1 << UCSZ1);  // 8 bit data format

    // transmit
    _delay_ms(500);
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'A';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'n';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'd';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'r';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'e';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 13;

    _delay_ms(500);
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'W';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'a';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'g';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'n';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'e';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'r';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 13;

    _delay_ms(500);
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'A';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'n';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'd';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'r';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'e';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = ' ';

    _delay_ms(500);
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'W';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'a';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'g';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'n';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'e';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = 'r';
    while(!(UCSRA & (1 << UDRE)));      // wait until register is free
    UDR = ' ';

    // blink debug
    for(;;) {
        DEBUG_TOGGLE();
        _delay_ms(10);
        DEBUG_TOGGLE();
        _delay_ms(500);
    }
}

// vim: ts=4:sw=4:sts=4:expandtab
