#!/bin/bash

rm ./bin/boot_intel.bin
rm ./boot_att/boot.bin
# build intel 
nasm -f bin boot_intel/boot.asm -o ./bin/boot_intel.bin

# build gnu AT&T
as -o boot_att/boot.o boot_att/boot.s
ld -o ./bin/boot_att.bin --oformat binary -e init -Ttext 0x7c00  -o ./bin/boot_att.bin boot_att/boot.o
