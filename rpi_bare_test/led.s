.section .init
.global _start

.equ BASE,  0x3f200000        // GPIO Base Address
.equ GPFSEL2, 0x08            // GPIO Function Select Register
.equ GPSET0,  0x1c            // GPIO Pin Output Set Register
.equ GPCLR0,  0x28            // GPIO Pin Output Clear Register
.equ SET_BIT3,   0x08         // Set GPIO Pin 3
.equ SET_BIT21,  0x200000     // Set GPIO Pin 21

_start:
    b main                     // Branch to main

    // Loop forever
loop:
    wfi                        // Wait for interrupt (low-power state)
    b loop                     // Infinite loop

