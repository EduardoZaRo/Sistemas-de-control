section .data    ; Datos inicializados 
	msg1:     db "Ingresa A: ",10 
	msg1_L:   equ $-msg1 

	msg2:     db "N = " 
	msg2_L:   equ $-msg2 

	NL:     db  13, 10
	NL_L:   equ $-NL

section .bss     ; Datos no inicializados 
	A resb 64
	N resb 1   
    
section .text 
	global _start: 
    
_start:    
	mov eax, 4 ;Escribe
	mov ebx, 1 
	mov ecx, msg1 
	mov edx, msg1_L 
	int 80h 

	mov eax, 3 ;Lee
	mov ebx, 0 
	mov ecx, A 
	mov edx, 64 
	int 80h    

	mov al,[A]     ;INCISO C) GUARDAR PRIMER DIGITO DE A EN N DIR BASE
	mov [N], al
	mov eax, 4 ;Escribe
	mov ebx, 1 
	mov ecx, msg2 
	mov edx, msg2_L 

	int 80h
	mov eax, 4 ;Escribe
	mov ebx, 1 
	mov ecx, N 
	mov edx, 1 
	int 80h 

	mov eax, 4 ;Salto
	mov ebx, 1
	mov ecx, NL
	mov edx, NL_L
	int 80h

	mov al, "-"   ;INCISO D) CAMBIAR TERCER CARACTER DE A POR GUION, DIR B + I
	mov [A+ebx+1], al

	
	mov eax, 4 ;Escribe
	mov ebx, 1 
	mov ecx, A
	mov edx, 64
	int 80h 
	
	mov eax, 4 ;Salto
	mov ebx, 1
	mov ecx, NL
	mov edx, NL_L
	int 80h	


	mov ebx, 7;INCISO E) CAMBIAR OCTAVO CARACTER DE A POR X, DIR B + I
	mov byte [A+ebx],"X"

	
	mov eax, 4 ;Escribe
	mov ebx, 1 
	mov ecx, A
	mov edx, 64
	int 80h 

	mov eax, 4 ;Salto
	mov ebx, 1
	mov ecx, NL
	mov edx, NL_L
	int 80h
	
	mov ah, [A+1] ;INCISO F) COPIAR 2DO CARACTER DE A Y ALMACENARLO EN BITS 15-8 DE ACUMULADOR
	mov [A+ebx*4+4], ah ;INCISO G) COPIAR EN EL 9NO CARACTER DE A LO DE AH

	mov eax, 4 ;Escribe
	mov ebx, 1 
	mov ecx, A
	mov edx, 64
	int 80h 
	
	mov eax, 4 ;Salto
	mov ebx, 1
	mov ecx, NL
	mov edx, NL_L
	int 80h	
	
	
	mov eax, 1
	mov ebx, 0
	int 80h
