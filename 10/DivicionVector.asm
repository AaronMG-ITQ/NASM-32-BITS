section .data

	num_1 dd 14, 20, 30, 56, 90
	num_2 dd 2, 4, 5, 8, 10
	len equ 5
	
	salto db 10, 0
	resultado db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	
section .text:
	global _start
	
_start:
	mov ecx, 0
	
vectores:
	cmp ecx, len
	jge fin_programas
	
	mov eax, [num_1 + ecx*4]
	cdq
	idiv dword [num_2 + ecx*4]
	
	push ecx
	push eax
	call int_to_ascii
	call print_newline
	pop eax
	pop ecx
	
	inc ecx
	jmp vectores
	
	
fin_programas:
	mov eax, 1
	xor ebx, ebx
	int 0x80
	
int_to_ascii:
	mov edi, resultado + 9
	mov byte [edi], 0
	dec edi
	
.convert_loop:
	xor edx, edx
	mov ebx, 10
	div ebx
	add dl, '0'
	mov [edi], dl
	dec edi
	test eax, eax
	jnz .convert_loop
	
	inc edi
	mov eax, 4
	mov ebx, 1
	mov ecx, edi
	mov edx, resultado + 9
	sub edx, edi
	int 0x80
	ret
	
print_newline:
	mov eax, 4
	mov ebx, 1
	mov ecx, salto
	mov edx, 1
	int 0x80
	ret
