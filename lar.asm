DATA SEGMENT
MSG DB 0AH,0DH,"N1 GREATER$"
MSG1 DB 0AH,0DH,"N2 GREATER$"
MSG2 DB 0AH,0DH,"N3 GREATER$"
MSG3 DB 0AH,0DH,"INPUT NO 1$"
MSG4 DB 0AH,0DH,"INPUT NO 2$"
MSG5 DB 0AH,0DH,"INPUT NO 3$"
DATA ENDS

ASSUME CS:CODE,DS:DATA
CODE SEGMENT
START: MOV AX,DATA
MOV DS,AX
MOV AH,09H
LEA DX,MSG3
INT 21H
MOV AH,01H
INT 21H
MOV BH,AL
MOV AH,09H
LEA DX,MSG4
INT 21H
MOV AH,01H
INT 21H
MOV BL,AL
MOV AH,09H
LEA DX,MSG5
INT 21H
MOV AH,01H
INT 21H
MOV CH,AL
CMP BH,BL
JL N2
CMP BH,CH
JL N3
LEA DX,MSG
MOV AH,09H
INT 21H
JMP END1
N2:
CMP BL,CH
JL N3
LEA DX,MSG1
MOV AH,09H
INT 21H
JMP END1
N3:
LEA DX,MSG2
MOV AH,09H
INT 21H
END1:
MOV AH,4CH
INT 21H
CODE ENDS
END START

;FOR FINDING SMALLEST AMONG THREE NUMBERS REPLACE JL WITH JG AND CHANGE MESSAGE

