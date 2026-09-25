gdt_start:

gdt_null:
	dw 0x0000
	dw 0x0000

gdt_code:
	dw 0xffff
	dw 0x0000
	dw 0x0000
	db 10011010b
	db 11001111b
	db 0x00

gdt_data:
	dw 0xffff
	dw 0x0000
	dw 0x0000
	db 10010010b
	db 11001111b
	db 0x00

gdt_end:

gdt_descriptor:
	dw gdt_end - gdt_start - 1   ; 16 bits GDT size (idk why always - 1)
	dd gdt_start                 ; gdt address

CODE_SEGMENT equ gdt_code - gdt_start
DATA_SEGMENT equ gdt_data - gdt_start
