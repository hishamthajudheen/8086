.model small
.stack 100h
.data
	msg1 db 10,13,"Enter string:$"
	msg2 db 10,13,"Enter the character:$"
	msg3 db 10,13,"Count:$"
	string1 db 20 dup('$')
	char1 db 5 dup('$')
	len db 0
	count db 0
.code
main PROC
	mov ax,@data
	mov ds,ax
	
	lea dx,msg1
	mov ah,09h
	int 21h
	
	mov si,offset string1
READ1:mov ah,01h	
	int 21h
	cmp al,13
	je EXIT1
	mov [si],al
	inc si
	inc len
	jmp READ1
	
EXIT1:lea dx,msg2
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	mov char1,al

	mov si,offset string1
	mov di,offset char1
	mov bl,[di]
LOOP1:mov al,[si]
	cmp al,bl
	je FND
	dec len
	jz FEXIT
	inc si
	jmp LOOP1

FND:	inc count
	inc si
	dec len
	jnz LOOP1

FEXIT:lea dx,msg3
	mov ah,09h
	int 21h
	mov al,count
	mov dl,al
	mov ah,02h
	add dl,30h
	int 21h
	
	mov ah,4ch
	int 21h
main ENDP
END main