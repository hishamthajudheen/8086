.model small
.stack 100h
.data
	msg1 db 10,13,"Enter string:$"
	msg2 db 10,13,"Enter substring:$"
	msg3 db 10,13,"Substring Found!$"
	msg4 db 10,13,"Substring not found!:$"
	string1 db 20 dup('$')
	string2 db 20 dup('$')
	len1 dw 0
	len2 dw 0
.code
main PROC
	mov ax,@data
	mov ds,ax
	lea dx,msg1
	mov ah,09h
	int 21h
	mov si,offset string1
LOOP1:	mov ah,01h
	int 21h
	cmp al,13
	je EXIT1
	mov [si],al
	inc si
	inc len1
	jmp LOOP1
	
EXIT1:	lea dx,msg2
	mov ah,09h
	int 21h
	mov di,offset string2
LOOP2:	mov ah,01h
	int 21h
	cmp al,13
	je EXIT2
	mov [di],al
	inc di
	inc len2
	jmp LOOP2
	
EXIT2:	mov si,offset string1
	mov di,offset string2
	mov al,[si]
	mov bl,[di]
	cmp al,bl
	je LOOP3
	jmp LOOP4
	
LOOP3:	dec len1
	dec len2
	jz FOUND	
	inc si
	inc di
	mov al,[si]
	mov bl,[di]
	cmp al,bl
	je LOOP3
	jmp LOOP4
	
LOOP4: 	mov di,offset string2
	inc si
	dec len1
	jz NOTFOUND
	mov al,[si]
	mov bl,[di]
	cmp al,bl
	je LOOP3
	jmp LOOP4
	
FOUND:	lea dx,msg3
	mov ah,09h
	int 21h
	JMP EXITF
	
NOTFOUND:lea dx,msg4
	mov ah,09h
	int 21h
	JMP EXITF
		
EXITF:	mov ah,4ch
	int 21h
main ENDP
END main
