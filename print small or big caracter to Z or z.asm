.model small
.stack 100h
.data 
msg db 'Enter a Alphabet: $'
error db 'Invalid input! $'
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg
    int 21h
    mov ah,1
    int 21h
    mov bl,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    cmp bl,'A'
    jge level1
    jl  level_I
    
    level1:
    cmp bl,'Z'
    jle level_A
    
    cmp bl,'a'
    jge level2
    jl  level_I
    
    level2:
    cmp bl,'z'
    jle level_alo
    jg  level_I
    
    level_A:
    mov cl,91
    sub cl,bl
    mov ch,0
    mov ah,2
    mov dl,bl
    
    level_Aloop:
    int 21h
    inc dl
    loop level_Aloop
    jmp exit
    
    level_alo: 
    mov cl,123
    sub cl,bl
    mov ch,0
    mov ah,2
    mov dl,bl
     
    level_aloloop:
    int 21h
    inc dl
    loop level_aloloop
    jmp exit
    
    level_I:
    mov ah,9
    lea dx,error
    int 21h
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main