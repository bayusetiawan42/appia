;takes the argument 'bx'
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
	call print_nl

	inc bx
	jmp print.putchar

.end:
	popa
	ret

;takes the argument 'dx'
print_word:
	pusha
	mov cx, 0
.loop:
	cmp cx, 4                    ; while (cx < 4)
	je print_word.end

	; Convert to ASCII
	mov ax, dx
	and ax, 0x000f               ; 0x1234 -> 0x0004
	add al, 0x30                 ; convert to ASCII 1-9
	cmp al, 0x39                 ; if N > 9  add extra 8 to represent 'A' - 'F'
	jle print_word.modif_word
	add al, 7                    ; ASCII A-Z is 0x41-0x46. Added 7 so it became 0x40
.modif_word:
	mov bx, print_word.HEX_OUT + 5
	sub bx, cx
	; replace *bx position with ASCII from al
	mov [bx], al 
	ror dx, 4   ; since we just eliminate 0x000f
	            ; so rotate 4 times 0x1234 -> 0x4123 -> 0x3412 -> 0x2341 -> 0x1234

	inc cx
	jmp print_word.loop

.end:
	; print final modified HEX_OUT
	mov bx, print_word.HEX_OUT
	call print

	popa
	ret

.HEX_OUT:
	db "0x0000",0


print_nl:
	pusha
	mov ah, 0x0e

	mov al, 0xa
	int 0x10
	mov al, 0xd
	int 0x10

	popa
	ret
