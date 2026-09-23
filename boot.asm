[org 0x7c00]
[bits 16]
	mov bx, message
	call print

	jmp $

%include "print.asm"

message:
	db "hello world", 0xa, 0

times 510 - ($-$$) db 0x00
dw 0xaa55
