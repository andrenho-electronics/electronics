#define F_CPU 4000000UL

#include <stdint.h>

#include <avr/interrupt.h>
#include <avr/io.h>
#include <avr/sleep.h>
#include <avr/wdt.h>
#include <util/delay.h>


#define PIEZO PORTD5

#define DIGITS PORTD
#define DIGIT_0 PORTD5
#define DIGIT_1 PORTD4
#define DIGIT_2 PORTD3
#define DIGIT_3 PORTD2

#define LEDS PORTB
#define LED_A PORTB2
#define LED_B PORTB0
#define LED_C PORTB4
#define LED_D PORTB5
#define LED_E PORTB6
#define LED_F PORTB1
#define LED_G PORTB3

void set_digit_output(uint8_t digit, uint8_t value)
{
    LEDS = 0;

    switch(value) {
    case 0x0:
        LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C)|(1<<LED_D)|(1<<LED_E)|(1<<LED_F);
        break;
    case 0x1:
        LEDS |= (1<<LED_B)|(1<<LED_C);
        break;
    case 0x2:
        LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_D)|(1<<LED_E)|(1<<LED_G);
        break;
    case 0x3:
        LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C)|(1<<LED_D)|(1<<LED_G);
        break;
    case 0x4:
        LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C)|(1<<LED_F)|(1<<LED_G);
        break;
    case 0x5:
        LEDS |= (1<<LED_A)|(1<<LED_C)|(1<<LED_D)|(1<<LED_F)|(1<<LED_G);
        break;
    case 0x6:
        LEDS |= (1<<LED_A)|(1<<LED_C)|(1<<LED_D)|(1<<LED_E)|(1<<LED_F)|(1<<LED_G);
        break;
    case 0x7:
        LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C);
        break;
    case 0x8:
        LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C)|(1<<LED_D)|(1<<LED_E)|(1<<LED_F)|(1<<LED_G);
        break;
    case 0x9:
        LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C)|(1<<LED_D)|(1<<LED_F)|(1<<LED_G);
        break;
    case 0xA:
        LEDS |= (1<<LED_A)|(1<<LED_B)|(1<<LED_C)|(1<<LED_E)|(1<<LED_F)|(1<<LED_G);
        break;
    case 0xB:
        LEDS |= (1<<LED_C)|(1<<LED_D)|(1<<LED_E)|(1<<LED_F)|(1<<LED_G);
        break;
    case 0xC:
        LEDS |= (1<<LED_A)|(1<<LED_D)|(1<<LED_E)|(1<<LED_F);
        break;
    case 0xD:
        LEDS |= (1<<LED_B)|(1<<LED_C)|(1<<LED_D)|(1<<LED_E)|(1<<LED_G);
        break;
    case 0xE:
        LEDS |= (1<<LED_A)|(1<<LED_D)|(1<<LED_E)|(1<<LED_F)|(1<<LED_G);
        break;
    case 0xF:
        LEDS |= (1<<LED_A)|(1<<LED_E)|(1<<LED_F)|(1<<LED_G);
        break;
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

int main()
{
    _delay_ms(500);

    for(;;) {
        for(uint8_t d=0; d<=3; ++d) {
            for(uint8_t i=0; i<=0xf; ++i) {
                set_digit_output(d, i);
                _delay_ms(200);
            }
        }
    }

    return 0;
}

// vim: ts=4:sw=4:sts=4:expandtab
