[bits 32]

VIDEO_MEMORY     equ    0xb8000
WHITE_ON_BLACK   equ    0x0f

;Takes the 'ebx' as a string pointer
vga_print:
	pusha
	mov edx, VIDEO_MEMORY

.loop:
	cmp [ebx], 0
	jz .end

	mov al, [ebx]
	mov ah, WHITE_ON_BLACK

	mov [edx], ax

	inc ebx
	add edx, 2

	jmp .loop

.end:
	popa
	ret
