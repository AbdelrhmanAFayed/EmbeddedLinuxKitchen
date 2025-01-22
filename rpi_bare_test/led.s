.section .init
.global _start

.equ BASE,  0x3f200000        // GPIO Base Address
.equ GPFSEL2, 0x08            // GPIO Function Select Register
.equ GPSET0,  0x1c            // GPIO Pin Output Set Register
.equ GPCLR0,  0x28            // GPIO Pin Output Clear Register
.equ SET_BIT3,   0x08         // Set GPIO Pin 3
.equ SET_BIT21,  0x200000     // Set GPIO Pin 21

_start:
    

    // Set up GPIO
    ldr x0, =BASE              // Load the base address into x0
    ldr x1, =SET_BIT3          // Load the value for setting GPIO mode into x1
    str x1, [x0, #GPFSEL2]     // Write to the GPFSEL2 register
    ldr x0, =BASE              // Load the base address into x0
    ldr x1, =SET_BIT21         // Load the value to set GPIO pin 21
    str x1, [x0, #GPSET0]      // Write to the GPSET0 register

    // Loop forever
loop:
    wfi                        // Wait for interrupt (low-power state)
    b loop                     // Infinite loop

