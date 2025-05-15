section .data
	palabra db "salsaTomate", 0xA, 0xD
	len equ $-palabra
	
section .text
	global _start
	
_start:
	mov esi, palabra
	mov edi, palabra
	add edi, len
	dec edi
	
.reverse_loop:
	cmp esi, edi
	jge .done_reverse
	
	mov al, [esi]
	mov bl, [edi]
	mov [esi], bl
	mov [edi], al
	
	inc esi
	dec edi
	
	jmp .reverse_loop
	
.done_reverse:

	mov eax, 4
	mov ebx, 1
	mov ecx, palabra
	mov edx, len
	int 0x80
	
	mov eax, 1
	xor ebx, ebx
	int 0x80
	
