.model small
.stack 100h
data segment
    msg db "Hello World$"
data ends
code segment
    assume ds:data, cs:code
start:   mov ax,@data
         mov ds,ax
        lea dx,msg
        mov ah,09h
        int 21h
        mov ah,4ch
        int 21h
code ends
end start
