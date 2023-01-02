[org 0x00]
[bits 16]

section code

.main:
	mov eax, 0xb800
	mov es, eax

	mov byte [es:0x00], 'H' ; 0xb800 + 0x00 = 0xb800
	mov byte [es:0x01], 0x30

jmp $

times 510 - ($ - $$) db 0x00 ; Pads file with 0s, making it the right size

db 0x55
db 0xaa