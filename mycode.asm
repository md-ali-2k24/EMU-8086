.model small
.stack 300h
.data

var1 db ? 
var2 db ?

msg1 db 'Enter The first Number: $'
msg2 db 'Enter The second Number: $'
msg3 db 'Result is: $'

.code

main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,9
    lea dx,msg1
    int 21h
    
    mov ah,1
    int 21h
    mov var1,al
    
    sub var1,48
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,9
    lea dx,msg2
    int 21h
    
    mov ah,1
    int 21h
    mov var2,al 
    
    sub var2,48
    
    mov bl,var1
    add bl,var2
    
    add bl,48
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    
    mov ah,9
    lea dx,msg3
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h
    
    mov ah,4ch ;termination mode
    int 21h
    main endp
end main
    



.model small
.stack 100h
.data 

var1 db 5
var2  db ?
msg db "Enter a number : $"
result db ?
resultMsg db 10,13,"The sumation is : $"

.code 
main proc 
    mov ax,@data 
    mov ds,ax
    
    mov bl,var1
    mov ah,9
    lea dx,msg
    int 21h
    
    mov ah,1 
    int 21h
    mov bl,al
    sub bl,48
    
    mov ah,9
    lea dx,resultMsg
    mov ah,2
    mov dl,bl
    int 21h
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main