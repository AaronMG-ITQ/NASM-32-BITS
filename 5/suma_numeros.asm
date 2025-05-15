
section .data
	
	msg db 10, "numero1: "
	size equ $-msg
	
	msg_3 db 10,"numero2: "
	size_3 equ $-msg_3
	
	msg_5 db 10, "Resta: "
	size_5 equ $-msg_5
	
section .bss
	num resb 1
	num_2 resb 1
	resultado resb 1
	
section .text
	global _start
	
_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, size
	int 80h
	
	mov eax, 3
	mov ebx, 0
	mov ecx, num
	mov edx, 2
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg_3
	mov edx, size_3
	int 80h
	
	mov eax, 3
	mov ebx, 0
	mov ecx, num_2
	mov edx, 2
	int 80h
	
	mov eax, [num]
	mov ebx, [num_2]
	sub eax, "0"
	sub ebx, "0"
	add eax, ebx
	add eax, "0"
	
	mov [resultado], eax
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg_5
	mov edx, size_5
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, resultado
	mov edx, 1
	int 80h
	

	mov eax, 1
	int 0x80
	
	


