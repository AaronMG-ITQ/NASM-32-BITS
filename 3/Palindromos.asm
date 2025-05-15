section .data
	palindromo db "reconocer", 0
	len equ $-palindromo
	
	msg_si db "si", 10, 0
	msg_no db "no", 10, 0
	
section .text
	global _start
	
_start:

	mov esi, palindromo
	xor ecx, ecx
	
.contador:
	cmp byte [esi + ecx], 0
	je .got_len
	inc ecx
	jmp .contador
	
.got_len:
	mov edi, esi
	add edi, ecx
	dec edi
	
.check_loop:
	cmp esi, edi
	jge .palindrome
	
	mov al, [esi]
	mov bl, [edi]
	cmp al, bl
	jne .no_palindrome
	
	inc esi
	dec edi
	jmp .check_loop
	
.palindrome:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg_si
	mov edx, 3
	int 0x80
	jmp .salir
	
.no_palindrome:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg_no
	mov edx, 3
	int 0x80

.salir:
	mov eax, 1
	xor ebx, ebx
	int 0x80
	
	
