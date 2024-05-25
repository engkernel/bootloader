; boot.asm
ORG 0x7c00
BITS 16

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start

_start:
	call enable_A20
	cli
	lgdt [gdt_descriptor] ; load gdt
	mov eax, cr0
	or  eax, 0x1 ; set 32-bit mode in cr0
	mov cr0, eax
	jmp CODE_SEG:load32 ; long jump code segment

enable_A20:
	; Fast gate enable A20 line
	in al, 0x92
	or al, 2
	out 0x92, al
	ret

gdt_start:
	; 8 null bytes 
	dd 0x0 ; 4 bytes
	dd 0x0 ; 4 bytes
	; we code just simply write
	; dq 0x0 

; GDT descriptor code segment
gdt_code:
	dw 0xffff 	; segment length 
	dw 0x0	  	; base address (bits 0-15)
	db 0x0		; base address (bits 16-23)
	db 10011010b	; 1st flags, type flags
	db 11001111b	; 2nd flags, limit - (bits 16-19)
	db 0x0		; base address (bits 24-31)

gdt_data:
	dw 0xffff
	dw 0x0
	db 0x0
	db 10010010b 	; 1st flags, type flags
	db 11001111b
	db 0x0

gdt_end:

gdt_descriptor:
	dw gdt_end - gdt_start - 1
	dd gdt_start

bits 32
load32:
	mov ax, DATA_SEG
	mov ds, ax
	mov es, ax
	mov fs, ax
	mov gs, ax
	mov ss, ax

	mov esi, hello
	mov ebx, 0xb8000

.loop:
	lodsb
	or al, al
	or eax, 0x0100
	mov word [ebx], ax
	add ebx, 2
	jmp .loop
halt:
	cli
	hlt

hello: db "Hello World!", 0

times 510-($-$$) db 0 ; fill to 510 bytes with zero
dw 0xAA55 ; last two byte, depened on little-endian or big-endian, now we have 512 bytes filled.
