/*
 * Copyright (c) 2018 Atmosphère-NX
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms and conditions of the GNU General Public License,
 * version 2, as published by the Free Software Foundation.
 *
 * This program is distributed in the hope it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

.section ".text"
.global _metadata
.global _entrypoint

/* This is the thermosphere binary header. */
_metadata:
    .word 0x30534D54  /* Magic number */
    .word _metadata  /* Physical base */
    .word (_entrypoint - _metadata) /* Entrypoint */
    .word 0xCCCCCCCC  /* Padding */

/* Entrypoint for thermosphere. Should execute at 0x80000000. */
/* Arguments: X0 = EL1 entrypoint, X1 = EL1 argument. */
_entrypoint:
    // Init DAIFSET, get EL
    msr DAIFSET, #0xF
    mrs x2, CURRENTEL
    cmp x2, #8
    invalid_el:
    bne invalid_el
    
    // Setup for EL1 entry
    msr ELR_EL2, x0
    mov x0, x1
    ldr x2, =0x3C5
    msr SPSR_EL2, x2
    isb
    
    // Jump to EL1, TODO: Actually implement thermosphere functionality
    eret
    // Loop forever.
    1: b 1b
