; boot.asm
ORG 0x7c00
BITS 16

_start:
	mov si, msg
	call print
	jmp $

print:
	mov bx, 0
.loop:
	lodsb	
	or al, al
	jz .done
	call putchar
	jmp .loop
.done:
	ret

putchar:
	mov ah, 0eh
	int 0x10
	ret

msg	db 'Hello World', 0
times 510-($-$$) db 0 ; fill to 510 bytes with zero
dw 0xAA55 ; last two byte, depened on little-endian or big-endian, now we have 512 bytes filled.
