OUTPUT_FORMAT("elf64-littleaarch64")
OUTPUT_ARCH(aarch64)
ENTRY(_entrypoint)

SECTIONS
{
    . = 0x80000000;

    . = ALIGN(4);
    .text : {
    PROVIDE(lds_thermo_start = .);
        start.o (.text*)
        *(.text*)
    }

    . = ALIGN(8);
    .rodata : {
        *(SORT_BY_ALIGNMENT(SORT_BY_NAME(.rodata*)))
    }

    . = ALIGN(8);
    .data : {
        *(.data*)
    }

    /* Uninitialised data */
    . = ALIGN(8);
    PROVIDE(lds_bss_start = .);
    .bss (NOLOAD) : {
        *(.bss*) . = ALIGN(8);
    }
    PROVIDE(lds_bss_end = .);
    
    ASSERT(lds_bss_end <= 0x8000E000, "Thermosphere is too big!")

    /* Exception vectors + stack */
    . = 0x8000E000;
    PROVIDE(lthermo_evt_start = .);
    . = 0x8000E800;
    PROVIDE(lthermo_evt_end = .);
    PROVIDE(lthermo_el2_stacks_start = .);
    . = 0x8000F000;
    PROVIDE(lthermo_el2_stacks_end = .);

    lds_thermo_end = .;

    /DISCARD/ : { *(.dynstr*) }
    /DISCARD/ : { *(.dynamic*) }
    /DISCARD/ : { *(.plt*) }
    /DISCARD/ : { *(.interp*) }
    /DISCARD/ : { *(.gnu*) }
}
