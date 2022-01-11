;COAL LAB PROJECT
;MUHAMMAD FASEEH SHAHID 2012390
;ALI ZAFAR QURESHI 2012374

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

delay1 macro       ;logic for 5 second delay
mov cx, 0Fh
mov dx, 4240h
mov ah, 86h
int 15h
mov ah, 86h
int 15h
mov ah, 86h
int 15h
mov ah, 86h
int 15h
mov ah, 86h
int 15h
endm

.model small
.stack 100h
.data
menu db  '****************************MENU**********************************$'
menu1 db '                    PRESS 1 FOR CAR  (RS 100)$                     '
menu2 db '                    PRESS 2 FOR BIKE (RS 50)$                      '
menu3 db '                    Press 3 TO SHOW THE RECORDS$                   '
menu4 db '                    Press 4 TO DELETE ALL THE RECORDS$             '
menu5 db '                    Press 5 TO EXIT$                               '
msg1 db  '                    ***PARKING IS FULL***$                         '
msg2 db  '                    WRONG INPUT$                                   '
msg3 db  '                    TOTAL AMOUNT =$                                '
msg4 db  '                    TOTAL NUMBERS OF VEHICLES PARKED =$            '
msg5 db  '                    TOTAL CARS PARKED  =$                          '
msg6 db  '                    TOTAL BIKES PARKED =$                          '
msg7 db  '                    ***RECORD SUCCESSFULLY DELETED***$             ' 
msg8 db  '                    YOUR AMOUNT IS = $                              ' 
msg9 db  '                    ENTER = $                                       ' 

amount dw 0
count dw  '0'

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
print newline
print msg9

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
print msg8
call caar

rec:
clr
call recrd

del:
clr
call delt

bike:
print msg8
call bikes

end_:          ; for returning the control of program
mov ah,4ch
int 21h
main endp
caar proc      ;procedure for cars
cmp count,'8'
jle car1 
clr
print msg1
delay
clr
jmp while_
jmp end_

car1:
mov ax,100
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

delay

inc count
inc c
clr
jmp while_
jmp end_
bikes proc    ;procrdure for bikes
cmp count,'8'
jle bike1
clr
print msg1 
delay
clr
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

      delay
inc count
inc b
clr
jmp while_
jmp end_

recrd proc     ;procedure for printing all the records
print msg3
mov ax, amount  ; print here the whole amount
mov dx,0
mov bx,10
mov cx,0
totalpush:
div bx
push dx
mov dx,0
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
print msg4
mov dx,count
mov ah,2
int 21h

print newline
print msg5
mov dl,c
mov ah,2
int 21h
print newline
print msg6
mov dl,b
mov ah,2
int 21h
delay1
clr
jmp while_
jmp end_

delt proc    ;procedure for deleting
mov c,'0'
mov b,'0'
mov amount,0
;sub amount,48
mov count,'0'
clr
print msg7
delay 
clr
jmp while_
jmp end_
end main