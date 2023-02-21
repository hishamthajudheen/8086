.model small
.stack 100h

.data
	msg1 db 10,13,"Enter number:$"
	msg2 db 10,13,"Entered number is Even$"
	msg3 db 10,13,"Entered number is Odd$"
.code
main PROC
	mov ax,@data
	mov ds,ax
	
	lea dx,msg1
	mov ah,09h
	int 21h
	mov ah,01h
	int 21h
	
	mov bl,al
	and bl,01h
	jz EVENCASE
	lea dx,msg3
	mov ah,09h
	int 21h
	jmp EXIT
	
EVENCASE:lea dx,msg2
	mov ah,09h
	int 21h
	
EXIT:	mov ah,4ch
	int 21h
main ENDP
END main
