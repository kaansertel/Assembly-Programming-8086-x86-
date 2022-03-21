org 100h
    MOV BX, 0400H
    MOV CL, 1
    MOV SI, 0
    SUB DX,DX

kare: 
    
    MOV AL, CL
    MUL AL
    MOV WORD PTR [BX+SI],AX
    ADD DX,AX
    INC SI
    INC SI
    INC CL
    CMP CL,24
    JNZ kare
    JMP son

son:
    MOV WORD PTR [BX + SI], DX
ret