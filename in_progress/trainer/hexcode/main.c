#define F_CPU 4000000UL

#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/sleep.h>
#include <avr/wdt.h>
#include <util/delay.h>


#define PIEZO PORTD5


int main()
{
	_delay_ms(500);

	// set port as output
	DDRD |= (1<<PORTD6);
	
	for(;;) {
		PORTD |= (1<<PORTD6);
		_delay_ms(400);
		//PORTD &= ~(1<<PORTD6);
		_delay_ms(300);
	}

	return 0;
}
