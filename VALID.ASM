.model small
.stack 100h
.data
    msg1 db 10,13,"Enter string:$"
    msg3 db 10,13,"Valid!$"
    msg4 db 10,13,"Invalid!$"
    string1 db 20 dup('$')
    string2 db 20 dup("CUSAT")
    len1 db 0
.code
main PROC
    mov ax,@data
    mov ds,ax

    lea dx,msg1
    mov ah,09h
    int 21h

    mov si,offset string1
READ1:  mov ah,01h
        int 21h
        cmp al,13
        je EXIT1
        mov [si],al
        inc si
        inc len1
        jmp READ1

EXIT1:  mov si,offset string1
        mov di,offset string2
        mov al,[si]
        mov bl,[di]
        cmp al,bl
        jne EXIT3
        inc si
        inc di
        dec len1
        jnz EXIT1
        lea dx,msg3
        mov ah,09h
        int 21h
        jmp FEXIT
EXIT3:  lea dx,msg4
        mov ah,09h
        int 21h
        jmp FEXIT

FEXIT:  mov ah,4ch
        int 21h
main ENDP
END main