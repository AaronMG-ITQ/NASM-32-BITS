section .data
	espacio dd 3, 7, 2, 8, 9, 5, 1
	len equ 7
	target dd 5
	
	msg_no db "No encontrado", 10, 0
	salto db 10, 0
	buff db 0,0,0,0,0,0,0,0,0,0
	
section .text
	global _start
	
_start:
	xor ecx, ecx
	
buscar:
	cmp ecx, len
	jge no_encontrado
	
	mov eax, [espacio + ecx*4]
	cmp eax, [target]
	je encontrado
	
	inc ecx
	jmp buscar
	
encontrado:
	mov eax, ecx
	call int_to_ascii
	call print_newline
	jmp fin_programa
	
no_encontrado:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg_no
	mov edx, 13
	int 0x80
	
fin_programa:
	mov eax, 1
	xor ebx, ebx
	int 0x80
	
int_to_ascii:
	mov edi, buff + 9
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
	mov edx, buff + 9
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
