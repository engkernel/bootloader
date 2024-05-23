# bootloader
basic bootloader to improve my understanding and skills on low level.

- At the beginning we require to build a raw binary for simplest form of bootloader
```
nasm -f bin boot.asm -o boot.bin
```
- the sign for qemu or legacy systems to detect boot signature, consider the sign would be 0x55AA but it depends you are using big endian or little endian
```
0xAA55 
```
