ENTRY(_start)

SECTIONS
{
    . = 0x80000;
    
    .text ALIGN(4) : {
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
