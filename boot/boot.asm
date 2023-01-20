[org 0x00]
[bits 16]

section code

.init:
	mov eax, 0x07c0
	mov ds, eax
	mov eax, 0xb800
	mov es, eax
	mov eax, 0 ; Set eax to 0 -> i = 0
	mov ebx, 0 ; Index of character in the string we are printing
	mov ecx, 0 ; Actual address of the character on the screen
	mov dl, 0 ; Store actual value that we are printing to the screen

.clear:
	mov byte [es:eax], 0 ; Move black character to current text address
	inc eax;
	mov byte [es:eax], 0x30 ; Move background color and character color to the next address
	inc eax;

	cmp eax, 2 * 25 * 80

	jl .clear

mov eax, text1
push .print

.print:
	mov dl, byte [eax + ebx]

	cmp dl, 0
	je .print_end

	mov byte [es:ecx], dl

	inc ebx
	inc ecx
	inc ecx

	jmp .print

.print_end:
	ret

.end:
	jmp $

text: db 'Hello, World!', 0
text1: db 'This is another text!', 0

times 510 - ($ - $$) db 0x00 ; Pads file with 0s, making it the right size

db 0x55
db 0xaa