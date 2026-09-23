boot.bin:
	nasm -fbin boot.asm -o boot.bin

.PHONY: qemu clean
qemu: boot.bin
	qemu-system-i386 boot.bin

clean:
	rm boot.bin
