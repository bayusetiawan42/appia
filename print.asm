;takes the argument 'bx':
print:
	pusha
	mov ah, 0x0e
.putchar:
	cmp [bx], 0
	jz print.end

	cmp [bx], 0xa
	je print.newline

	mov al, [bx]
	int 0x10

	inc bx
	jmp print.putchar
.newline:
	inc bx

	mov al, 0xa
	int 0x10
	mov al, 0xd
	int 0x10

	jmp print.putchar
.end:
	popa
	ret
