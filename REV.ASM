.model small
.stack 100h
.data
	msg1 db 10,13,"Enter string:$"
	msg2 db 10,13,"Reversed string:$"
	string db 20 dup('$')
	string_rev db 20 dup('$')
.code
main PROC
	mov ax,@data
	mov ds,ax
	
	lea dx,msg1
	mov ah,09h
	int 21h
	
	mov si,offset string
	mov bl,00h
REPEAT:	mov ah,01h
	int 21h
	cmp al,13
	je LOO
	mov [si],al
	inc si
	inc bl
	jmp REPEAT
	
LOO:	mov di,offset string_rev
	dec si
REV:	mov dl,[si]
	mov [di],dl	
	dec si
	inc di
	dec bl
	jnz REV
	
DISPLAY:lea dx,msg2
	mov ah,09h
	int 21h
	mov dx,offset string_rev
	mov ah,09h
	int 21h
	
	mov ah,4ch
	int 21h
main ENDP
END main
