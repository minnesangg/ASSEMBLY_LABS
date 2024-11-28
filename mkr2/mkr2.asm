.MODEL SMALL
.STACK 100H
.DATA
    firstTwoLetters  DW 041Dh, 0435h   
    lastTwoLetters   DW 043Eh, 0432h   

    resultLow        DW ?            
    resultHigh       DW ?             
    isPositive       DB 0            
.CODE
MAIN PROC

    MOV AX, SEG firstTwoLetters  
    MOV DS, AX

    MOV AX, [firstTwoLetters]      
    MOV BX, [firstTwoLetters+2]    

    MOV CX, [lastTwoLetters]       
    MOV DX, [lastTwoLetters+2]    

    ADD AX, CX
    JC HANDLE_CARRY            
    MOV resultLow, AX           

    ADD BX, DX
    JC NEGATIVE_RESULT             
    MOV resultHigh, BX            

    MOV isPositive, 1             
    JMP EXIT                       
    
HANDLE_CARRY:
    INC BX                         
    MOV resultLow, AX              
    MOV resultHigh, BX            
    JMP POSITIVE_RESULT

NEGATIVE_RESULT:
    MOV isPositive, 0             
    JMP EXIT

POSITIVE_RESULT:
    MOV isPositive, 1              

EXIT:

    MOV AX, 4C00H
    INT 21H                        
MAIN ENDP
END MAIN
