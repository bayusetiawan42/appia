[bits 16]
[org 0x7c00]

	mov bp, 0x9000
	mov sp, bp

	call switch_to_32

	jmp $

[bits 32]

START_32:

	mov ebx, message
	call vga_print

	jmp $

%include "gdt.asm"
%include "switch32.asm"
%include "vga_print.asm"

message: db "Hello from protected mode! terry davis is happy", 0

times 510 - ($-$$) db 0
dw 0xaa55
