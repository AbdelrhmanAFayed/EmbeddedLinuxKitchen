ENTRY(_start)

SECTIONS
{
    . = 0x8000;
    _start = .;
    
    .text ALIGN(4) : {
        KEEP(*(.init))
        *(.text)
        *(.rodata)
    }

    .data ALIGN(4) : {
        *(.data)
    }

    .bss ALIGN(4) : {
        *(.bss)
        *(COMMON)
    }

    

    _end = .;
}
