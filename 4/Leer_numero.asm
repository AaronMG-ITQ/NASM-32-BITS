
section .data
	
	msg db "Escribe un numero", 0xA, 0xD
	size equ $-msg
	
	msg_2 db "El numero fue leido y es", 0xA, 0xD
	size_2 equ $-msg_2
	
section .bss
	num resb 5
	
section .text
	global _start
	
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, size
	int 80h
	
	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg_2
	mov edx, size_2
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 80h
	
	mov eax, 1
	int 80
