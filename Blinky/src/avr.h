// TODO: Need to standardize types to align with AVR system 
#define byte char

#define OFFSET 0x20
#define REG(addr) *((volatile unsigned byte*)addr + OFFSET)

// Define register addresses
#define DDRB REG(0x17)
#define PORTB REG(0x18)

/* Configurations */ 
/*
 * The Frequency of the CPU in Hz. The default is 1 MHz */ 
int F_CPU = 1000000; 

/**
 * Delays execution of the code for the specified time in milliseconds. 
 *
 * @param ms The amount of time in milliseconds to delay code execution
 * @return 
 */
void delay_ms(byte ms) {
   // Calculate the Cycles per ms rounded down 
   int c_ms = F_CPU / 1000;

   // Calculate the number of Cycles the CPU needs to be delayed to achieve desired ms delay
   int total_cycles = c_ms * ms;

   // The # of instructions in the while loop = ~8 instructions. 
   // Most of the instructions require a single clock cycle, except the last two require 2 clock Cycles
   // This puts us at ~10 cycles / iteration 
   register int iterations = total_cycles / 10;

   // Loop until iterations == 0
   while(iterations--);
}
