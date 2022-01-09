print macro p1       ;logic for printing strings
mov dx,offset p1
mov ah,09h
int 21h
endm  

clr macro     ;logic for clr screen 
mov  ah, 0
mov  al, 3
int  10h
endm 

delay macro       ;logic for 2 second delay
mov cx, 0Fh
mov dx, 4240h
mov ah, 86h
int 15h
mov ah, 86h
int 15h
endm

.model small
.stack 100h
.data
menu db  '****************************MENU**********************************$'
menu1 db '                    PRESS 1 FOR CAR (RS 300)$                      '
menu2 db '                    PRESS 2 FOR BIKE (RS 50)$                      '
menu3 db '                    Press 3 TO SHOW THE RECORDS$                   '
menu4 db '                    Press 4 TO DELETE ALL THE RECORDS$             '
menu5 db '                    Press 5 TO EXIT$                               '
msg1 db  '                         Parking Is Full$                           '
msg2 db  '                         Wrong input$                               '
msg7 db 'the total amount is=$'
msg8 db 'the total numbers of vehicles parked=$'
msg9 db 'the total number of rikshaws parked=$'
msg10 db 'the total number of cars parked=$'
msg11 db 'the total number of bikes parked=$'
msg12 db '***Record deleted successfully***$'
amount dw 0
count dw  '0'
r dw '0'
c db '0'
b db '0'
newline db 0ah,0dh,"$"
.code
main proc
mov ax,@data
mov ds,ax

;mov cx,count

;mov cx,0

while_:   
             ;Menu
print newline
print menu
print newline
print menu1
print newline
print menu2
print newline
print menu3
print newline
print menu4   
print newline
print menu5
print newline


  ;Taking user input

mov ah,1
int 21h
mov bl,al
print newline

  ;now compare
mov al,bl

cmp al,'1'
je car
cmp al,'2'
je bike
cmp al,'3'
je rec
cmp al,'4'
je del
cmp al,'5'
je end_
print msg2       ;else invalid input will jump to While_ again
print newline 
delay
clr
jmp while_

car:
call caar


rec:
call recrd


del:
call delt


bike:
call bikes



end_:
mov ah,4ch
int 21h

main endp


caar proc
cmp count,'8'
jle car1
mov dx,offset msg1
mov ah,9
int 21h
jmp while_
jmp end_

car1:
mov ax,300
add amount, ax
mov dx,0
mov bx,10
mov cx,0
l22:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l22
   
l33:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l33

;mov am2,amount

inc count
inc c
clr
jmp while_
jmp end_




bikes proc
cmp count,'8'
jle bike1
print msg1
jmp while_
jmp end_

bike1:
mov ax,50
add amount, ax
mov dx,0
mov bx,10
mov cx,0
l222:
        div bx
        push dx
        mov dx,0
        mov ah,0
        inc cx
        cmp ax,0
       jne l222
   
l333:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop l333
;mov am3,amount

inc count
inc b
clr
jmp while_
jmp end_


recrd proc
print msg7


; print here the whole amount
mov ax, amount

mov dx,0
mov bx,10
mov cx,0
totalpush:
        div bx
        push dx
        mov dx,0
      ;  mov ah,0
        inc cx
        cmp ax,0
       jne totalpush
   
totalprint:
        pop dx
        add dx,48
        mov ah,2
        int 21h
loop totalprint




print newline






print msg8

mov dx,count
mov ah,2
int 21h

print newline


print msg9

mov dx,r
mov ah,2
int 21h

print newline


print msg10

mov dl,c
mov ah,2
int 21h

print newline



print msg11

mov dl,b
mov ah,2
int 21h

jmp while_
jmp end_


delt proc
mov r,'0'
mov c,'0'
mov b,'0'
mov amount,0
;sub amount,48
mov count,'0'
print msg12

print newline



jmp while_
jmp end_










end main
