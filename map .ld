MEMORY
{
    MEM : ORIGIN = 0x0, LENGTH = 0x4000
    RAM : ORIGIN = 0X20000000, LENGTH = 0X800
}

SECTIONS
{
    .text : {
        *(.vectors*)
        *(.text*)
    } > MEM

    .data : {
        *(.data*)
    } > RAM
}


