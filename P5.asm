section .data    ; Datos inicializados
	NL:     db  13, 10
	NL_L:   equ $-NL
section .bss     ; Datos no inicializados
	N        resb 4   
	M        resb 4 
	cad      resb 16   
section .text
	global _start:
_start:   
	mov eax, 0C2966271h ;ALMACENO 0C2966271h EN EAX
	mov esi, cad
	call printHex
	
	mov eax, 4 ;Salto
	mov ebx, 1
	mov ecx, NL
	mov edx, NL_L
	int 80h
	
	mov dword[M], 1270771h ;ALMACENO MI MATRICULA EN M EN 32 BITS
	mov eax, [M]
	mov esi, cad
	call printHex

	
	mov eax, 4 ;Salto
	mov ebx, 1
	mov ecx, NL
	mov edx, NL_L
	int 80h
	
	mov ebx, 4F89193Ch ;ALMACENO 4F89193Ch EN EBX
	mov eax, ebx
	mov esi, cad
	call printHex
	
	mov eax, 4 ;Salto
	mov ebx, 1
	mov ecx, NL
	mov edx, NL_L
	int 80h
	
	mov dword[N], 7924B4h ;ALMECENO 7924B4h EN N COMO 32 BITS
	mov eax, [N]
	mov esi, cad
	call printHex
	
	mov eax, 4 ;Salto
	mov ebx, 1
	mov ecx, NL
	mov edx, NL_L
	int 80h
	
	mov ecx, ebx ;COPIAR EBX A ECX, EBX VALE 1
	mov eax, ecx
	mov esi, cad
	call printHex
	
	mov eax, 4 ;Salto
	mov ebx, 1
	mov ecx, NL
	mov edx, NL_L
	int 80h
	
	mov byte[N], cl ;COPIAR CL A N
	mov eax, [N]
	mov esi, cad
	call printHex
	
	mov eax, 4 ;Salto
	mov ebx, 1
	mov ecx, NL
	mov edx, NL_L
	int 80h
	
	mov word[N], 945h ;ALMACENAR 945h en N como 16 BITS
	mov eax, [N]
	mov esi, cad
	call printHex
	
	mov eax, 4 ;Salto
	mov ebx, 1
	mov ecx, NL
	mov edx, NL_L
	int 80h
	
	
	mov esi, N ;COPIAR N A ESI
	mov eax, esi
	mov esi, cad
	call printHex
	
	mov eax, 4 ;Salto
	mov ebx, 1
	mov ecx, NL
	mov edx, NL_L
	int 80h
	
	mov eax, 1
	mov ebx,0
	int 80h
	
printHex:
	pushad 
	mov edx, eax
	mov ebx, 0fh
	mov cl, 28
.nxt:shr eax,cl
.msk:and eax,ebx
	cmp al, 9
	jbe .menor
	add al,7
.menor:add al,'0'
	mov byte [esi],al
	inc esi
	mov eax, edx
	cmp cl, 0
	je .print
	sub cl, 4
	cmp cl, 0
	ja .nxt
	je .msk
.print:mov eax, 4
	mov ebx, 1
	sub esi, 8
	mov ecx, esi
	mov edx, 8
	int 80h
	popad
	ret
