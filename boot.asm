[org 0x7c00]
[bits 16]
	mov bx, message
	call print

	mov bx, message2
	call print
	mov dx, 0xf456
	call print_word
	call print_nl

	jmp $

%include "print.asm"

message:
	db "hello world", 0xa, 0

message2:
	db "the hex is awesome: ", 0

times 510 - ($-$$) db 0x00
dw 0xaa55
