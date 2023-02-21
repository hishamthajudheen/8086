.model small
.stack 100h
.data
	msg1 db 10,13,"Enter String 1:$"
	msg2 db 10,13,"Enter String 2:$"
	msg3 db 10,13,"Concatenated String:$"
	string1 db 10 dup('$')
	string2 db 10 dup('$')
.code
main PROC
	mov ax,@data
	mov ds,ax
	lea dx,msg1
	mov ah,09h
	int 21h
	
	mov si,offset string1	
READ1:	mov ah,01h
	int 21h
	cmp al,13
	je READ2 
	mov [si],al
	inc si
	jmp READ1
	
READ2:	lea dx,msg2
	mov ah,09h
	int 21h
	mov di,offset string2	
READ3:	mov ah,01h
	int 21h
	cmp al,13
	je EXIT 
	mov [di],al
	inc di
	jmp READ3
	
EXIT:	lea dx,msg3
	mov ah,09h
	int 21h
	
	mov dx,offset string1
	mov ah,09h
	int 21h
	mov dx,offset string2
	mov ah,09h
	int 21h	
	mov ah,4ch
	int 21h
main ENDP
END main
