.model small
.stack 100h
.data
	msg1 db 10,13,"Enter String 1:$"
	msg2 db 10,13,"Number of Vowels:$"
	string1 db 10 dup('$')
	len1 db 0
	count db 0
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
	je EXIT 
	mov [si],al
	inc si
	inc len1
	jmp READ1
	
EXIT:	mov si,offset string1
EXIT2:	mov al,[si]
	cmp al,'A'
	je COUNTER
	mov al,[si]
	cmp al,'E'
	je COUNTER
	mov al,[si]
	cmp al,'I'
	je COUNTER
	mov al,[si]
	cmp al,'O'
	je COUNTER
	mov al,[si]
	cmp al,'U'
	je COUNTER
	inc si
	dec len1
	jz DISPLAY
	JMP EXIT2
	
	
COUNTER:inc si
	inc count
	dec len1
	jz DISPLAY
	jmp EXIT2
	
DISPLAY:lea dx,msg2
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
