.model small
.stack 100h
.data 

msg db "Hellow World $"    ;db = define bite 
msg1 db ?   ;for taking the size from user

.code

main proc   

    mov ax,@data    ;initialize of a data
    mov ds,ax
    
    mov ah,2
    add msg,48      ;getting the currect ASKII value 
    mov dl,msg
    int 21h
    
    mov ah,1
    int 21h
    mov msg1,al
    
    mov ah,2        ;this 4 lisnes are for print nect line
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2        ;print a number from a variable
    mov dl,msg1
    int 21h
    
    exit:           ;Ending Section
    mov ah,4ch
    int 21h
    main endp
end main