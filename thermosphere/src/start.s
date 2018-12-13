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
    .word _entrypoint /* Entrypoint */
    .word 0xCCCCCCCC  /* Padding */
    .word 0xCCCCCCCC  /* Padding */

/* Entrypoint for thermosphere. Should execute at 0x80000000. */
_entrypoint:
    // For now, just loop forever.
    1: b 1b
