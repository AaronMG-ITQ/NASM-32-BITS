section .data

	a dd 10
	b dd 5
	c dd 12
	d dd 3
	
	msg_igual db "Las restas son iguales", 10, 0
	msg_primera db "La primera resta es mayor", 10, 0
	msg_segunda db "La segunda resta es mayor" , 10, 0
	
section .text

	global _start
	
_start:

	mov eax, [a]
	sub eax, [b]
	
	mov ebx, eax
	
	mov eax, [c]
	sub eax, [d]
	
	cmp ebx, eax
	
	je mostrar_igual
	ja mostrar_mayor
	jb mostrar_menor
	
mostrar_igual:
	mov edx, 23
	mov ecx, msg_igual
	jmp imprimir
	
mostrar_mayor:
	mov edx, 27
	mov ecx, msg_primera
	jmp imprimir
	
mostrar_menor:
	mov edx, 27
	mov ecx, msg_segunda
	
imprimir:
	mov ebx, 1
	mov eax, 4
	int 0x80
	
	
	mov eax, 1
	xor ebx, ebx
	int 0x80
