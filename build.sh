#!/bin/bash

rm ./bin/boot_intel.bin

nasm -f bin boot_inte/boot.asm -o ./bin/boot_intel.bin
