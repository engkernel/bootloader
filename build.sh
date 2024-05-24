#!/bin/bash

rm ./bin/boot.bin
rm ./bin/print_nobios.bin

nasm -f bin boot.asm -o ./bin/boot.bin
nasm -f bin print_nobios.asm -o ./bin/print_nobios.bin
