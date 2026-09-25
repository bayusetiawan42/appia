boot.bin: boot.asm vga_print.asm switch32.asm
	nasm -fbin boot.asm -o boot.bin

.PHONY: qemu clean
qemu: boot.bin
	qemu-system-i386 boot.bin

clean:
	rm boot.bin
