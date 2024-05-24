#!/bin/bash

rm ./bin/boot.bin
nasm -f bin boot.asm -o ./bin/boot.bin
