; Author: Joe Samyn 
; Date: 10/19/2025 
; Summary: A 'Hello, World' program for the ATtiny85 to make an LED blink on and off 
; Hardware: ATtiny85 

; Constants
.equ stackBottom, 0x60
; Define registers 
.equ xl, r26
.equ xh, r27
.equ yl, r28
.equ yh, r29
.equ spl, 0x3D
.equ sph, 0x3E

; stackSize specifies the size requirements for the stack in this program. The
; size is chosen to support 2 recursive function calls and the max number of variables
; required at a single time. 
.equ stackSize, 8 


.section .data



; The .text section is where all of the executable code lives. It is the program isntructions that
; will live in `Flash Memory`
.section .text 
.global main

; Initialize Interupt Vector table 
.org 0x0000             ; RESET interupt - Memory address that is first used when chip is reset. This is set to our main function to run our program on RESET
    rjmp main              


main:
    ; Initialize stack 
    ldi xl, stackBottom
    mov xh, r1
    
    ; Initialize Frame Pointer 
    movw yl, xl
    adiw yl, 1

    ; Initialize Stack Pointer 
    adiw xl, 8   
    
    ; Must use OUT here because SPL and SPH are in IO Space not SRAM 
    out spl, xl 
    out sph, xh

    ; Initialize PORTs 
    
; Main loop of the program 
loop:
    reti 

; Delay procedure that delays CPU for n milliseconds
delay:
    reti
