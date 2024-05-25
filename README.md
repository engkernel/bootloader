# bootloader
basic bootloader to improve my understanding and skills on low level.

- At the beginning we require to build a raw binary for simplest form of bootloader
```
nasm -f bin boot.asm -o boot.bin
```
or simply you can use build.sh in linux
```
./build.sh
```

- the sign for qemu or legacy systems to detect boot signature, consider the sign would be 0x55AA but it depends you are using big endian or little endian
for my platform
```
0xAA55 
```

# GDT Descriptor
- to enter protected mode you require enable A20 line and then initialize GDT descriptor and then do a far jump to reach the 32 bit procedures
basically for the beginning its better to initialize it in assembly and then we will go toward implement it in C
- check gdt_descripotr in boot_intel.asm

### Note: personally I like AT&T assembly syntax over intel as its more straight forward and logical to me compare to intel syntax eihter difference could not be eye catching.
