[bits 16]

switch_to_32:

	cli

	; enter 32-bit protected mode
	lgdt [gdt_descriptor]

	; set last bit
	mov eax, cr0
	or eax, 0x0001
	mov cr0, eax

	 ; Make a far jump so it flush CPU pipeline
	jmp CODE_SEGMENT:init_32

[bits 32]

init_32:

	; resetup data segments so it points to 32 bit not 16 bit
	mov ax, DATA_SEGMENT
	mov ds, ax
	mov es, ax
	mov ss, ax
	mov fs, ax	
	mov gs, ax

	; resetup base/stack pointer
	mov ebp, 0x90000
	mov esp, ebp

	; finally enter
	call START_32
