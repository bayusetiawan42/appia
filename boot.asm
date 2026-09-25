[bits 32]
; rtfm please
; https://wiki.osdev.org/Global_Descriptor_Table#System_Segment_Descriptor
; Intel IA 64 too

gdt_start:
	dw 0x0000
	dw 0x0000

gdt_code:
	dw 0xffff         ; 0-15
	dw 0x0000         ; 0-15

	dw 0x0000         ; 0-7

	db 10011010b      ; present, ring 00, code segment 11, executed from ring DPL 1, RW-able 1, Accesed (0)
	                  ; 8-15

	db 11001111b      ; granulity set, 32-bit mode, not long mode, AVL (0) or reserved,
	                  ; 0xffff -> 1111 (15) as the limit (4Gig)
	                  ; 16-23

	db 0x00           ; 24-31

gdt_data:
	dw 0xffff
	dw 0x0000
	dw 0x0000
	db 10010010b  ; Data segment, grows up
	db 11001111b
	db 0x00

