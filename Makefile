boot.bin: boot.asm print.asm disk.asm
	nasm -fbin boot.asm -o boot.bin

boot32.bin: boot32.asm
	nasm -fbin boot32.asm -o boot.bin

.PHONY: qemu clean
qemu: boot.bin
	qemu-system-i386 boot.bin

clean:
	rm boot.bin
