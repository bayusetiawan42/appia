; bootsector 1
[org 0x7c00]
[bits 16]
	; setup base & stack pointer
	mov bp, 0x8000   ; safe area from 0x7c00
	mov sp, bp

	mov bx, message
	call print

	;address of message
	;mov dx, message
	;call print_word
	;call print_nl

	mov dh, 0x02
	mov bx, 0x9000   ; safe area from 0x8000
	                 ; Memory address buffer for disk
	call disk_load

	; print buffer
	mov dx, [0x9000]
	call print_word
	call print_nl

	mov dx, [0x9000 + 512]
	call print_word
	call print_nl


	jmp $


%include "print.asm"
%include "disk.asm"

message: db "hello world", 0xa, 0

times 510 - ($-$$) db 0x00
dw 0xaa55

times 256 dw 0x0bad  ; drive sector 2
times 256 dw 0x0dab  ; drive sector 3
