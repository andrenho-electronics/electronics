#define F_CPU 1000000UL

// 
// DEFINITIONS
//
#define TICKS 0x240

//
// HEADERS
//
#include <stdbool.h>
#include <stdint.h>

#include <avr/interrupt.h>
#include <avr/io.h>
#include <util/delay.h>

// 
// MACROS
//
#define DEBUG(n) { if(n) { PORTD |= (1 << PD6); } else { PORTD &= ~(1 << PD6); } }
#define DEBUG_TOGGLE() { PORTD ^= (1 << PD6); }

//
// PROTOTYPES
//
static void initialize_analog();
static void initialize_led_pwm();

//
// GLOBAL VARIABLES
//
bool verify_enabled = false;
bool detected = false;

// 
// MAIN PROCEDURE
// 
int main()
{
    initialize_analog();
    initialize_led_pwm();
    sei();

    while(1) {
        DEBUG(detected);
    }
}


// 
// INITIALIZATION CODE
//
void initialize_analog()
{
    // each square wave toggle will happen after 0x240 (576) ticks
    OCR1A = TICKS;

    // we'll output PWM (CTC actually) in PB3 (OC1A)
    DDRB |= (1 << PB3);         // set pin as output
    TCCR1A |= (1 << COM1A0);    // toggle pin PB3 on match
    TCCR1B |= (1 << WGM12);     // activate CTC

    // prescaler = 8
    TCCR1B |= (1 << CS11);

    // enable interrupt when PWM toggles
    TIMSK |= (1 << OCIE1A);

    /* Ok, so let's calculate how long each PWM toggle takes.
     * The MCU is running at 1 MHz, but with the prescaler 8 it becomes 125 kHz.
     * This means that each tick takes 0.000008 sec, or 0.008 ms, or 8 us.
     * So every toggle will happen at 4.6 ms.
     *
     * By using a 10k resistor and a 0.1uF capacitor, this means that
     * the voltage in the RC circuit will be at 99% at 4.6 ms. */

    // initialize analog comparator
    ACSR = (1 << ACIE);         // enable interrupt
}

void initialize_led_pwm()
{
    // initialize PWM for LED
    DDRB |= (1 << PB2);                     // PWM output in PD3
    TCCR0A = (1 << COM0A1) | (1 << WGM00);  // phase correct PWM mode
    OCR0A = 0x1;                            // initial PWM pusle width
    TCCR0B = (1 << CS01);                   // clock source = CLK/8, start PWM
}

//
// INTERRUPTS
//


ISR(TIMER1_COMPA_vect) // called when analog PWM toggles
{
    verify_enabled = ((PINB >> PB3) & 1);

    if(verify_enabled) {
        // since we're enabling verification, we haven't detected
        // anything yet
        detected = false;
    }

    if(!verify_enabled && !detected) {
        // the code will enter here if the verification time is
        // over and no analog match was made - this means that
        // it is over 99%
        //OCR0A = 0xFF;
    }
}


ISR(ANA_COMP_vect)  // called when there's a match with the analog comparator
{
    if(verify_enabled) {

        uint16_t v = TCNT1 / 2;  // TODO - atomic read

        if(v < 10) {
            OCR0A = 2;
        } else if(v > (TICKS - 350)) {
            OCR0A = 0xFF;
        } else {
            OCR0A = v;
        }
        detected = true;
    }
}

// vim: ts=4:sw=4:sts=4:expandtab
