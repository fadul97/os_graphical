all: bootloader

bootloader:
	nasm boot/boot.asm -o boot/boot.img

clear:
	rm -f boot/boot.img

run:
	qemu-system-x86_64 -L "/usr/share/doc/qemu-system-x86" -m 64 -fda ./boot/boot.img