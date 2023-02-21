.model small
.stack 100h

.data
	msg1 db 13,10,"Please enter string:$"
	msg2 db 13,10,"Your string:$"
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
	int 21h
	cmp al,13
	je PRGMEND
	mov [si],al
	inc si
	jmp REPEAT
	
PRGMEND:lea dx,msg2
	mov ah,09h
	int 21h
	
	mov dx,offset string
	mov ah,09h
	int 21h
	
	mov ah,4ch
	int 21h
	
main ENDP
END main
