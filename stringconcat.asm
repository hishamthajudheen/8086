.model small
.stack 100h

data segment
    msg1 db "enter string 1",10,13,"$"
    msg2 db "enter string 2",10,13,"$"

    str1 db 8,?,8 dup("$")

data ends

code segment
    assume ds:data,cs:code
    start:
        mov ax,data
        mov ds,ax
        ;enter string 1
        mov dx,offset msg1
        mov ah,09h
        int 21h

        ;input string
        mov si,0
        input1:
            call read
            cmp al,13
            je exit_input1
            mov str1[si],al
            inc si
            jmp input1
        exit_input1:
            mov dx,offset msg2
            mov ah,09h
            int 21h
            input2:
                call read
                cmp al,13
                je exit_input2
                mov str1[si],al
                inc si
                jmp input2
                exit_input2:
                    mov str1[si],"$"
                    mov dx,offset str1
                    mov ah,9h
                    int 21h

        exit:
            mov ah,4ch
            int 21h

        read:
            mov ah, 01h
            int 21h
            ret


code ends
end start
