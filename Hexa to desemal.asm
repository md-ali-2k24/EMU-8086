.model small
.stack 100h
.data 
num db 'Enter a number: $'
msg db 'Invaid Input $' 
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,num
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    cmp bl,'0'
    jge level1
    jmp level5
    
    level1:
    cmp bl,'9'
    jle level2
    cmp bl,'A'
    jge level3
    jmp level5
    
    level2:
    mov ah,2
    mov dl,bl
    int 21h
    jmp exit
    
    level3:
    cmp bl,'F'
    jle l4
    jmp l5
    
    level4:
    sub bl,17
    mov ah,2
    mov dl,49
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    jmp exit
    
    level5:
    mov ah,9
    lea dx,msg
    int 21h
    jmp exit
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main