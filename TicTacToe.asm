[org 0x0100]

jmp start
oldisr: dd 0
message1: db 'Invalid Input. Again Give Input       '    ;38                             invalid message
message2: db 'Player 1 Turn                         '    ;38                             player1 turn             
message3: db 'Player 2 Turn                         '    ;38                             player2 turn
message4: db 'Box Already Occupied. Again Give Input'    ;38                             invalid input                     
message5: db 'Code Check'                                ;10                             check
message6: db 'Invalid Turn. It is Player 1 Turn     '    ;38                             invalid message 1
message7: db 'Invalid Turn. It is Player 2 Turn     '    ;38                             invalid message 2
message8: db 'Give Input'                                ;10                             give input
message9: db 'Player 1 Wins                         '    ;38                             player 1 win
message10: db 'Player 2 Wins                         '   ;38                             player 2 win
message11: db 'Game Draw                             '   ;38                             draw
original_string: db 000000000b
testing_string:  db 000000000b
player1_string:  db 000000000b
player2_string:  db 000000000b

buffer:
push ds
push es
mov ax,40h
mov es,ax
mov ds,ax
mov di,1ah
mov si,1ch
movsw
pop es
pop ds
ret

check:
push ax
push es
push si
push di
push cx

mov si,message5
mov ax,0xb800
mov es,ax
mov ah,01010000b
mov al,[si]
mov cx,10
mov di,0

l6:
mov word [es:di],ax
add di,2
add si,1
mov al,[si]
loop l6

pop cx
pop di
pop si
pop es
pop ax
ret

give_input:
push ax
push es
push si
push di
push cx

mov si,message8
mov ax,0xb800
mov es,ax
mov ah,01010000b
mov al,[si]
mov cx,10
mov di,3048

l9:
mov word [es:di],ax
add di,2
add si,1
mov al,[si]
loop l9

pop cx
pop di
pop si
pop es
pop ax
ret

player1_win:
push ax
push es
push si
push di
push cx

mov si,message9
mov ax,0xb800
mov es,ax
mov ah,01010000b
mov al,[si]
mov cx,38
mov di,3048

l17:
mov word [es:di],ax
add di,2
add si,1
mov al,[si]
loop l17

pop cx
pop di
pop si
pop es
pop ax
ret

player2_win:
push ax
push es
push si
push di
push cx

mov si,message10
mov ax,0xb800
mov es,ax
mov ah,01010000b
mov al,[si]
mov cx,38
mov di,3048

l18:
mov word [es:di],ax
add di,2
add si,1
mov al,[si]
loop l18

pop cx
pop di
pop si
pop es
pop ax
ret

draw:
push ax
push es
push si
push di
push cx

mov si,message11
mov ax,0xb800
mov es,ax
mov ah,01010000b
mov al,[si]
mov cx,38
mov di,3048

l19:
mov word [es:di],ax
add di,2
add si,1
mov al,[si]
loop l19

pop cx
pop di
pop si
pop es
pop ax
ret

invalid_message:
push ax
push es
push si
push di
push cx

mov si,message1
mov ax,0xb800
mov es,ax
mov ah,01010000b
mov al,[si]
mov cx,38
mov di,3048

l1:
mov word [es:di],ax
add di,2
add si,1
mov al,[si]
loop l1

pop cx
pop di
pop si
pop es
pop ax
ret

invalid_message1:
push ax
push es
push si
push di
push cx

mov si,message6
mov ax,0xb800
mov es,ax
mov ah,01010000b
mov al,[si]
mov cx,38
mov di,3048

l7:
mov word [es:di],ax
add di,2
add si,1
mov al,[si]
loop l7

pop cx
pop di
pop si
pop es
pop ax
ret

invalid_message2:
push ax
push es
push si
push di
push cx

mov si,message7
mov ax,0xb800
mov es,ax
mov ah,01010000b
mov al,[si]
mov cx,38
mov di,3048

l8:
mov word [es:di],ax
add di,2
add si,1
mov al,[si]
loop l8

pop cx
pop di
pop si
pop es
pop ax
ret

invalid_input:
push ax
push es
push si
push di
push cx

mov si,message4
mov ax,0xb800
mov es,ax
mov ah,01010000b
mov al,[si]
mov cx,38
mov di,3048

l4:
mov word [es:di],ax
add di,2
add si,1
mov al,[si]
loop l4


pop cx
pop di
pop si
pop es
pop ax
ret

player1_turn:
push ax
push es
push si
push di
push cx

mov si,message2
mov ax,0xb800
mov es,ax
mov ah,01010000b
mov al,[si]
mov cx,38
mov di,3048

l2:
mov word [es:di],ax
add di,2
add si,1
mov al,[si]
loop l2

pop cx
pop di
pop si
pop es
pop ax
ret

player2_turn:
push ax
push es
push si
push di
push cx

mov si,message3
mov ax,0xb800
mov es,ax
mov ah,01010000b
mov al,[si]
mov cx,38
mov di,3048

l3:
mov word [es:di],ax
add di,2
add si,1
mov al,[si]
loop l3

pop cx
pop di
pop si
pop es
pop ax
ret

check_pattern_1:
push ax

p1_1:
mov ax,[player1_string]
and ax,7
cmp ax,7
jne p1_2
call pattern_1
mov dx,1
call player1_win
jmp end4

p1_2:
mov ax,[player1_string]
and ax,56
cmp ax,56
jne p1_3
call pattern_2
mov dx,1
call player1_win
jmp end4

p1_3:
mov ax,[player1_string]
and ax,448
cmp ax,448
jne p1_4
call pattern_3
mov dx,1
call player1_win
jmp end4

p1_4:
mov ax,[player1_string]
and ax,73
cmp ax,73
jne p1_5
call pattern_4
mov dx,1
call player1_win
jmp end4

p1_5:
mov ax,[player1_string]
and ax,146
cmp ax,146
jne p1_6
call pattern_5
mov dx,1
call player1_win
jmp end4

p1_6:
mov ax,[player1_string]
and ax,292
cmp ax,292
jne p1_7
call pattern_6
mov dx,1
call player1_win
jmp end4

p1_7:
mov ax,[player1_string]
and ax,273
cmp ax,273
jne end4
call pattern_7
mov dx,1
call player1_win

end4:
pop ax
ret

check_pattern_2:
push ax

p2_1:
mov ax,[player2_string]
and ax,7
cmp ax,7
jne p2_2
call pattern_1
mov dx,2
call player2_win
jmp end5

p2_2:
mov ax,[player2_string]
and ax,56
cmp ax,56
jne p2_3
call pattern_2
mov dx,2
call player2_win
jmp end5

p2_3:
mov ax,[player2_string]
and ax,448
cmp ax,448
jne p2_4
call pattern_3
mov dx,2
call player2_win
jmp end5

p2_4:
mov ax,[player2_string]
and ax,73
cmp ax,73
jne p2_5
call pattern_4
mov dx,2
call player2_win
jmp end5

p2_5:
mov ax,[player2_string]
and ax,146
cmp ax,146
jne p2_6
call pattern_5
mov dx,2
call player2_win
jmp end5

p2_6:
mov ax,[player2_string]
and ax,292
cmp ax,292
jne p2_7
call pattern_6
mov dx,2
call player2_win
jmp end5

p2_7:
mov ax,[player2_string]
and ax,273
cmp ax,273
jne end5
call pattern_7
mov dx,2
call player2_win

end5:
pop ax
ret

player1:
push bp
mov bp,sp
push ax
push es
push bx

mov ax,0xb800
mov es,ax
mov bh,01110110b
mov bl,0x4F

mov ax,[bp+4]
mov cx,[bp+6]

c1_1:
cmp al,0x31
jne c1_2
jmp box1_1
c1_2:
cmp al,0x32
jne c1_3
jmp box1_2
c1_3:
cmp al,0x33
jne c1_4
jmp box1_3
c1_4:
cmp al,0x34
jne c1_5
jmp box1_4
c1_5:
cmp al,0x35
jne c1_6
jmp box1_5
c1_6:
cmp al,0x36
jne c1_7
jmp box1_6
c1_7:
cmp al,0x37
jne c1_8
jmp box1_7
c1_8:
cmp al,0x38
jne c1_9
jmp box1_8
c1_9:
cmp al,0x39
jne im1
jmp box1_9

im1:
call invalid_message
mov cl,0
jmp end1

box1_1:
mov ax,[original_string]
and ax,1
jnz invalid_input_1
mov word [es:840],bx
or word [original_string],1
or word [player1_string],1
call check_pattern_1
cmp dx,1
jne box1_1_1
jmp end3
box1_1_1:
jmp end1
invalid_input_1:
jmp invalid_input_1_1

box1_2:
mov ax,[original_string]
and ax,2
jnz invalid_input_2
mov word [es:880],bx
or word [original_string],2
or word [player1_string],2
call check_pattern_1
cmp dx,1
jne box1_2_1
jmp end3
box1_2_1:
jmp end1
invalid_input_2:
jmp invalid_input_1_1

box1_3:
mov ax,[original_string]
and ax,4
jnz invalid_input_3
mov word [es:920],bx
or word [original_string],4
or word [player1_string],4
call check_pattern_1
cmp dx,1
jne box1_3_1
jmp end3
box1_3_1:
jmp end1
invalid_input_3:
jmp invalid_input_1_1

box1_4:
mov ax,[original_string]
and ax,8
jnz invalid_input_4
mov word [es:1480],bx
or word [original_string],8
or word [player1_string],8
call check_pattern_1
cmp dx,1
jne box1_4_1
jmp end3
box1_4_1:
jmp end1
invalid_input_4:
jmp invalid_input_1_1

box1_5:
mov ax,[original_string]
and ax,16
jnz invalid_input_5
mov word [es:1520],bx
or word [original_string],16
or word [player1_string],16
call check_pattern_1
cmp dx,1
jne box1_5_1
jmp end3
box1_5_1:
jmp end1
invalid_input_5:
jmp invalid_input_1_1


box1_6:
mov ax,[original_string]
and ax,32
jnz invalid_input_6
mov word [es:1560],bx
or word [original_string],32
or word [player1_string],32
call check_pattern_1
cmp dx,1
jne box1_6_1
jmp end3
box1_6_1:
jmp end1
invalid_input_6:
jmp invalid_input_1_1

box1_7:
mov ax,[original_string]
and ax,64
jnz invalid_input_7
mov word [es:2120],bx
or word [original_string],64
or word [player1_string],64
call check_pattern_1
cmp dx,1
jne box1_7_1
jmp end3
box1_7_1:
jmp end1
invalid_input_7:
jmp invalid_input_1_1

box1_8:
mov ax,[original_string]
and ax,128
jnz invalid_input_8
mov word [es:2160],bx
or word [original_string],128
or word [player1_string],128
call check_pattern_1
cmp dx,1
jne box1_8_1
jmp end3
box1_8_1:
jmp end1
invalid_input_8:
jmp invalid_input_1_1

box1_9:
mov ax,[original_string]
and ax,256
jnz invalid_input_9
mov word [es:2200],bx
or word [original_string],256
or word [player1_string],256
call check_pattern_1
cmp dx,1
jne box1_9_1
jmp end3
box1_9_1:
jmp end1
invalid_input_9:

invalid_input_1_1:
call invalid_input
mov cl,0

end1:
pop bx
pop es
pop ax
pop bp
ret 4

player2:
push bp
mov bp,sp
push ax
push es
push bx

mov ax,0xb800
mov es,ax
mov bh,01110001b
mov bl,0x58

mov ax,[bp+4]
mov cx,[bp+6]

c2_1:
cmp al,0x31
jne c2_2
jmp box2_1
c2_2:
cmp al,0x32
jne c2_3
jmp box2_2
c2_3:
cmp al,0x33
jne c2_4
jmp box2_3
c2_4:
cmp al,0x34
jne c2_5
jmp box2_4
c2_5:
cmp al,0x35
jne c2_6
jmp box2_5
c2_6:
cmp al,0x36
jne c2_7
jmp box2_6
c2_7:
cmp al,0x37
jne c2_8
jmp box2_7
c2_8:
cmp al,0x38
jne c2_9
jmp box2_8
c2_9:
cmp al,0x39
jne im2
jmp box2_9

im2:
call invalid_message
mov cl,0
jmp end2

box2_1:
mov ax,[original_string]
and ax,1
jnz invalid_input_10
mov word [es:840],bx
or word [original_string],1
or word [player2_string],1
call check_pattern_2
cmp dx,2
jne box2_1_1
jmp end3
box2_1_1:
jmp end2
invalid_input_10:
jmp invalid_input_2_2

box2_2:
mov ax,[original_string]
and ax,2
jnz invalid_input_11
mov word [es:880],bx
or word [original_string],2
or word [player2_string],2
call check_pattern_2
cmp dx,2
jne box2_2_1
jmp end3
box2_2_1:
jmp end2
invalid_input_11:
jmp invalid_input_2_2

box2_3:
mov ax,[original_string]
and ax,4
jnz invalid_input_12
mov word [es:920],bx
or word [original_string],4
or word [player2_string],4
call check_pattern_2
cmp dx,2
jne box2_3_1
jmp end3
box2_3_1:
jmp end2
invalid_input_12:
jmp invalid_input_2_2

box2_4:
mov ax,[original_string]
and ax,8
jnz invalid_input_13
mov word [es:1480],bx
or word [original_string],8
or word [player2_string],8
call check_pattern_2
cmp dx,2
jne box2_4_1
jmp end3
box2_4_1:
jmp end2
invalid_input_13:
jmp invalid_input_2_2

box2_5:
mov ax,[original_string]
and ax,16
jnz invalid_input_14
mov word [es:1520],bx
or word [original_string],16
or word [player2_string],16
call check_pattern_2
cmp dx,2
jne box2_5_1
jmp end3
box2_5_1:
jmp end2
invalid_input_14:
jmp invalid_input_2_2

box2_6:
mov ax,[original_string]
and ax,32
jnz invalid_input_15
mov word [es:1560],bx
or word [original_string],32
or word [player2_string],32
call check_pattern_2
cmp dx,2
jne box2_6_1
jmp end3
box2_6_1:
jmp end2
invalid_input_15:
jmp invalid_input_2_2

box2_7:
mov ax,[original_string]
and ax,64
jnz invalid_input_16
mov word [es:2120],bx
or word [original_string],64
or word [player2_string],64
call check_pattern_2
cmp dx,2
jne box2_7_1
jmp end3
box2_7_1:
jmp end2
invalid_input_16:
jmp invalid_input_2_2

box2_8:
mov ax,[original_string]
and ax,128
jnz invalid_input_17
mov word [es:2160],bx
or word [original_string],128
or word [player2_string],128
call check_pattern_2
cmp dx,2
jne box2_8_1
jmp end3
box2_8_1:
jmp end2
invalid_input_17:
jmp invalid_input_2_2

box2_9:
mov ax,[original_string]
and ax,256
jnz invalid_input_18
mov word [es:2200],bx
or word [original_string],256
or word [player2_string],256
call check_pattern_2
cmp dx,2
jne box2_9_1
jmp end3
box2_9_1:
jmp end2
invalid_input_18:

invalid_input_2_2:
mov cl,0
call invalid_input

end2:
pop bx
pop es
pop ax
pop bp
ret 4

clrscr:
push ax
push di
push es
push cx

mov ax,0xb800
mov es,ax
mov di,0
mov ax,0x0720
mov cx,2000

rep stosw

pop cx
pop es
pop di
pop ax
ret

background:
push ax
push di
push es
push cx

mov ax,0xb800
mov es,ax
mov di,0
mov ax,0x3020
mov cx,2000

rep stosw

pop cx
pop es
pop di
pop ax
ret

outerbox_lines:
push ax
push di
push es
push cx

mov ax,0xb800
mov es,ax
mov ax,0x4020

mov di,162
mov cx,23
line1:
mov word [es:di],ax
add di,160
loop line1

mov di,162
mov cx,78
line2:
mov word [es:di],ax
add di,2
loop line2

mov di,316
mov cx,23
line3:
mov word [es:di],ax
add di,160
loop line3

mov di,3682
mov cx,78
line4:
mov word [es:di],ax
add di,2
loop line4

pop cx
pop es
pop di
pop ax
ret

innerbox_lines:
push ax
push di
push es
push cx

mov ax,0xb800
mov es,ax
mov ax,0x0020

mov di,2886
mov cx,3
innerbox_line1:
mov word [es:di],ax
add di,160
loop innerbox_line1

mov di,2886
mov cx,74
innerbox_line2:
mov word [es:di],ax
add di,2
loop innerbox_line2

mov di,3032
mov cx,3
innerbox_line3:
mov word [es:di],ax
add di,160
loop innerbox_line3

mov di,3366
mov cx,74
innerbox_line4:
mov word [es:di],ax
add di,2
loop innerbox_line4

pop cx
pop es
pop di
pop ax
ret

innerbox_background:
push ax
push es
push di
push cx

mov ax,0xb800
mov es,ax
mov ah,01010000b
mov al,0x20
mov di,3048
mov ch,2
mov cl,72

innerbox_background_1:
mov word [es:di],ax
add di,2
dec cl
cmp cl,0
jnz innerbox_background_1
mov cl,72
add di,16
dec ch
jnz innerbox_background_1

pop cx
pop di
pop es
pop ax
ret

gamebox_background:
push ax
push es
push di
push cx

mov ax,0xb800
mov es,ax
mov ch,11
mov cl,59
mov di,662
mov ah,01110000b
mov al,0x20

gamebox_background1:
mov word [es:di],ax
add di,2
dec cl
cmp cl,0
jnz gamebox_background1
mov cl,59
add di,42
dec ch
cmp ch,0
jnz gamebox_background1

pop cx
pop di
pop es
pop ax
ret

gamebox_lines:
push ax
push es
push di
push cx

mov ax,0xb800
mov es,ax
mov ah,00100000b
mov al,0x20

mov di,500
mov cx,61
gamebox_line1:
mov word [es:di],ax
add di,2
loop gamebox_line1

mov di,1140
mov cx,61
gamebox_line2:
mov word [es:di],ax
add di,2
loop gamebox_line2

mov di,1780
mov cx,61
gamebox_line3:
mov word [es:di],ax
add di,2
loop gamebox_line3

mov di,2420
mov cx,61
gamebox_line4:
mov word [es:di],ax
add di,2
loop gamebox_line4

mov di,500
mov cx,12
gamebox_line5:
mov word [es:di],ax
add di,160
loop gamebox_line5

mov di,540
mov cx,12
gamebox_line6:
mov word [es:di],ax
add di,160
loop gamebox_line6

mov di,580
mov cx,12
gamebox_line7:
mov word [es:di],ax
add di,160
loop gamebox_line7

mov di,620
mov cx,12
gamebox_line8:
mov word [es:di],ax
add di,160
loop gamebox_line8

pop cx
pop di
pop es
pop ax
ret

pattern_1:
push ax
push cx
push di
push es

mov ax,0xb800
mov es,ax
mov ah,01000000b
mov al,0x20
mov di,840
mov cx,41

l10:
mov word [es:di],ax
add di,2
loop l10

pop es
pop di
pop cx
pop ax
ret

pattern_2:
push ax
push cx
push di
push es

mov ax,0xb800
mov es,ax
mov ah,01000000b
mov al,0x20
mov di,1480
mov cx,41

l11:
mov word [es:di],ax
add di,2
loop l11

pop es
pop di
pop cx
pop ax
ret

pattern_3:
push ax
push cx
push di
push es

mov ax,0xb800
mov es,ax
mov ah,01000000b
mov al,0x20
mov di,2120
mov cx,41

l12:
mov word [es:di],ax
add di,2
loop l12

pop es
pop di
pop cx
pop ax
ret

pattern_4:
push ax
push cx
push di
push es

mov ax,0xb800
mov es,ax
mov ah,01000000b
mov al,0x20
mov di,840
mov cx,9

l13:
mov word [es:di],ax
add di,160
loop l13

pop es
pop di
pop cx
pop ax
ret

pattern_5:
push ax
push cx
push di
push es

mov ax,0xb800
mov es,ax
mov ah,01000000b
mov al,0x20
mov di,880
mov cx,9

l14:
mov word [es:di],ax
add di,160
loop l14

pop es
pop di
pop cx
pop ax
ret

pattern_6:
push ax
push cx
push di
push es

mov ax,0xb800
mov es,ax
mov ah,01000000b
mov al,0x20
mov di,920
mov cx,9

l15:
mov word [es:di],ax
add di,160
loop l15

pop es
pop di
pop cx
pop ax
ret

pattern_7:
push ax
push es
push di
push cx

mov ax,0xb800
mov es,ax
mov ah,01000000b
mov al,0x20
mov cx,9
mov di,840
l16:
mov word [es:di],ax
add di,170
loop l16

pop cx
pop di
pop es
pop ax 
ret

start:
call clrscr
call background

call outerbox_lines
call innerbox_lines
call innerbox_background

call gamebox_background
call gamebox_lines

;call pattern_1
;call pattern_2
;call pattern_3
;call pattern_4
;call pattern_5
;call pattern_6
;call pattern_7

mov dx,0
mov ch,0
mov cl,0
call give_input
;___________________________________________________________________                     Movements Part          turn1
turn1:
mov ah,01h
int 16h
mov ah,0h
int 16h

cmp al,0x61
je player1_turn1
cmp al,0x62
je player2_turn1
call invalid_message
jmp turn1

player1_turn1:
call player1_turn
m1_1:
mov cl,1
;call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player1
cmp cl,0
je m1_1
jmp turn2_0

player2_turn1:
call player2_turn
m2_1:
mov cl,2
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player2
cmp cl,0
je m2_1
jmp turn2_0

;_____________________________________________________________________          turn 2
turn2_2:
call invalid_message1
call buffer 
jmp turn2
turn2_1:
call invalid_message2
call buffer
jmp turn2
turn2_0:
cmp cl,1
je player2_call_2
call player1_turn
jmp turn2
player2_call_2:
call player2_turn
turn2:
;call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h

cmp al,0x61
je player1_turn2
cmp al,0x62
je player2_turn2
call invalid_message
jmp turn2

player1_turn2:
cmp cl,1
je turn2_1
call player1_turn
m1_2:
mov cl,1
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player1
cmp cl,0
je m1_2
jmp turn3_0

player2_turn2:
cmp cl,2
je turn2_2
call player2_turn
m2_2:
mov cl,2
;call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player2
cmp cl,0
je m2_2
jmp turn3_0
 
;___________________________________________________________________              turn 3
turn3_2:
call invalid_message1
call buffer 
jmp turn3
turn3_1:
call invalid_message2
call buffer
jmp turn3
turn3_0:
cmp cl,1
je player2_call_3
call player1_turn
jmp turn3
player2_call_3:
call player2_turn
turn3:
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h

cmp al,0x61
je player1_turn3
cmp al,0x62
je player2_turn3
call invalid_message
jmp turn3

player1_turn3:
cmp cl,1
je turn3_1
call player1_turn
m1_3:
mov cl,1
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player1
cmp cl,0
je m1_3
jmp turn4_0

player2_turn3:
cmp cl,2
je turn3_2
call player2_turn
m2_3:
mov cl,2
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player2
cmp cl,0
je m2_3
jmp turn4_0

;___________________________________________________________________                turn 4
turn4_2:
call invalid_message1
call buffer 
jmp turn4
turn4_1:
call invalid_message2
call buffer
jmp turn4
turn4_0:
cmp cl,1
je player2_call_4
call player1_turn
jmp turn4
player2_call_4:
call player2_turn
turn4:
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h

cmp al,0x61
je player1_turn4
cmp al,0x62
je player2_turn4
call invalid_message
jmp turn4

player1_turn4:
cmp cl,1
je turn4_1
call player1_turn
m1_4:
mov cl,1
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player1
cmp cl,0
je m1_4
jmp turn5_0

player2_turn4:
cmp cl,2
je turn4_2
call player2_turn
m2_4:
mov cl,2
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player2
cmp cl,0
je m2_4
jmp turn5_0

;___________________________________________________________________         turn 5
turn5_2:
call invalid_message1
call buffer 
jmp turn5
turn5_1:
call invalid_message2
call buffer
jmp turn5
turn5_0:
cmp cl,1
je player2_call_5
call player1_turn
jmp turn5
player2_call_5:
call player2_turn
turn5:
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h

cmp al,0x61
je player1_turn5
cmp al,0x62
je player2_turn5
call invalid_message
jmp turn5

player1_turn5:
cmp cl,1
je turn5_1
call player1_turn
m1_5:
mov cl,1
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player1
cmp cl,0
je m1_5
jmp turn6_0

player2_turn5:
cmp cl,2
je turn5_2
call player2_turn
m2_5:
mov cl,2
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player2
cmp cl,0
je m2_5
jmp turn6_0

;___________________________________________________________________          turn 6
turn6_2:
call invalid_message1
call buffer 
jmp turn6
turn6_1:
call invalid_message2
call buffer
jmp turn6
turn6_0:
cmp cl,1
je player2_call_6
call player1_turn
jmp turn6
player2_call_6:
call player2_turn
turn6:
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h

cmp al,0x61
je player1_turn6
cmp al,0x62
je player2_turn6
call invalid_message
jmp turn6

player1_turn6:
cmp cl,1
je turn6_1
call player1_turn
m1_6:
mov cl,1
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player1
cmp cl,0
je m1_6
jmp turn7_0

player2_turn6:
cmp cl,2
je turn6_2
call player2_turn
m2_6:
mov cl,2
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player2
cmp cl,0
je m2_6
jmp turn7_0

;___________________________________________________________________        turn 7
turn7_2:
call invalid_message1
call buffer 
jmp turn7
turn7_1:
call invalid_message2
call buffer
jmp turn7
turn7_0:
cmp cl,1
je player2_call_7
call player1_turn
jmp turn7
player2_call_7:
call player2_turn
turn7:
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h

cmp al,0x61
je player1_turn7
cmp al,0x62
je player2_turn7
call invalid_message
jmp turn7

player1_turn7:
cmp cl,1
je turn7_1
call player1_turn
m1_7:
mov cl,1
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player1
cmp cl,0
je m1_7
jmp turn8_0

player2_turn7:
cmp cl,2
je turn7_2
call player2_turn
m2_7:
mov cl,2
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player2
cmp cl,0
je m2_7
jmp turn8_0

;___________________________________________________________________    turn 8
turn8_2:
call invalid_message1
call buffer 
jmp turn8
turn8_1:
call invalid_message2
call buffer
jmp turn8
turn8_0:
cmp cl,1
je player2_call_8
call player1_turn
jmp turn8
player2_call_8:
call player2_turn
turn8:
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h

cmp al,0x61
je player1_turn8
cmp al,0x62
je player2_turn8
call invalid_message
jmp turn8

player1_turn8:
cmp cl,1
je turn8_1
call player1_turn
m1_8:
mov cl,1
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player1
cmp cl,0
je m1_8
jmp turn9_0

player2_turn8:
cmp cl,2
je turn8_2
call player2_turn
m2_8:
mov cl,2
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player2
cmp cl,0
je m2_8
jmp turn9_0

;___________________________________________________________________        turn 9
turn9_2:
call invalid_message1
call buffer 
jmp turn9
turn9_1:
call invalid_message2
call buffer
jmp turn9
turn9_0:
cmp cl,1
je player2_call_9
call player1_turn
jmp turn9
player2_call_9:
call player2_turn
turn9:
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h

cmp al,0x61
je player1_turn9
cmp al,0x62
je player2_turn9
call invalid_message
jmp turn9

player1_turn9:
cmp cl,1
je turn9_1
call player1_turn
m1_9:
mov cl,1
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player1
cmp cl,0
je m1_9
call draw
jmp end3

player2_turn9:
cmp cl,2
je turn9_2
call player2_turn
m2_9:
mov cl,2
call buffer
mov ah,01h
int 16h
mov ah,0h
int 16h
push cx
push ax
call player2
cmp cl,0
je m2_9

call draw

end3:
mov ax,0x4c00
int 0x21





