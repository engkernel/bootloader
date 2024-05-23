; boot.asm
hang:
	jmp hang
times 510-($-$$) db 0 ; fill up to 510 byte
dw 0xAA55
