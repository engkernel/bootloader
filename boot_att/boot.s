# boot.s

# Set 16-bit mode
.code16 

# make init accessible
.global init 

init:
	mov $msg, %si
	mov $0xe, %ah
print_char:
	lodsb
	cmp $0, %al
	je done
	int $0x10
	jmp print_char
done:
	hlt # Halt execution

msg: .asciz "Hello World"

.fill 510-(.-init), 1, 0 # zeroing to 510 bytes
.word 0xaa55
