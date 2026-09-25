[org 0x7c00]
[bits 32]
	mov ebx, message
	call vga_print

	jmp $

VIDEO_MEMORY equ 0xb8000
WHITE_COLOR equ 0x0f


;Takes the 'ebx' as a string pointer
vga_print:
	pusha
	mov edx, VIDEO_MEMORY  ; Character Index

.loop:
	cmp [ebx], 0
	jz .end

	mov al, [ebx]
	mov ah, WHITE_COLOR

	mov [edx], ax
	inc ebx
	add edx, 2
	jmp .loop
.end:
	popa
	ret

message: db "Hello from protected mode", 0

times 510 - ($-$$) db 0
dw 0xaa55
