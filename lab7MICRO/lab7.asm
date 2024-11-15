.MODEL SMALL       
.STACK 100h         

.DATA               
    A DW 5       
    B DW 10      
    Y DW ?          

.CODE               
START:              
    MOV AX, B       ; AX = B
    SUB AX, A       ; AX = B - A
    ADD AX, 15      ; AX = (B - A) + 15
    CMP AX, 0     
    MOV BX, AX     

    ; ????????? ?????:
    JZ EQUAL_ZERO        ; ???????, ???? (B - A) + 15 = 0
    JL LESS_THAN_ZERO    ; ???????, ???? (B - A) + 15 < 0
    JG GREATER_THAN_ZERO ; ???????, ???? (B - A) + 15 > 0

LESS_THAN_ZERO:
    MOV AX, 7
    SUB AX, B
    MOV Y, AX
    JMP END_PROGRAM

EQUAL_ZERO:
    MOV AX, 5
    MOV DX, 0      
    MOV BX, B
    DIV BX           ; AX = 5 / B
    SUB AX, A
    MOV Y, AX
    JMP END_PROGRAM

GREATER_THAN_ZERO:
    MOV AX, A
    SHL AX, 3        ; AX = A * 8
    ADD AX, B        ; AX = A * 8 + B
    MOV Y, AX
    JMP END_PROGRAM

END_PROGRAM:
    MOV AX, 4C00h   
    INT 21h

END START
