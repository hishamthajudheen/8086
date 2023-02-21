.model small
.stack 100h

.data
	msg1 db 10,13,"Enter string:$"
	msg2 db 10,13,"Length of String:$"
	string db 20 dup('$')
.code
main proc
	mov ax,@data
	mov ds,ax	
	lea dx,msg1
	mov ah,09h
	int 21h	
	mov si,offset string
REPEAT:	mov ah,01h
	mov bl,00h
	int 21h
	cmp al,13
	je PRGEND
	mov [si],al
	inc si
	inc bl
	jmp REPEAT	
PRGEND:	lea dx,msg2
	mov ah,09h
	int 21h	
	mov dl,bl
	mov ah,02h
	add dl,48h
	int 21h	
	mov ah,4ch
	int 21h
main ENDP
END main 
