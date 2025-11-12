/*
* Author: Joe Samyn 
* Description: This is a basic program for an ATtiny85 MCU that blinks an LED on and off. 
*/
#include "avr.h"

int main(void) {
    DDRB = DDRB | 0b00000010;
    return 0;
}
