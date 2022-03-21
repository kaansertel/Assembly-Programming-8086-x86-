org 100h
    MOV BX,0200H
    MOV CX,14h

    MOV BYTE PTR [bx],01H
    MOV BYTE PTR [bx+1],01H
    MOV BYTE PTR [bx+2],01H
    MOV BYTE PTR [bx+3],01H
    MOV BYTE PTR [bx+4],01H
    MOV BYTE PTR [bx+5],01H
    MOV BYTE PTR [bx+6],01H
    MOV BYTE PTR [bx+7],01H
    MOV BYTE PTR [bx+8],01H
    MOV BYTE PTR [bx+9],01H
    MOV BYTE PTR [bx+10],01H
    MOV BYTE PTR [bx+11],01H
    MOV BYTE PTR [bx+12],01H
    MOV BYTE PTR [bx+13],01H
    MOV BYTE PTR [bx+14],01H
    MOV BYTE PTR [bx+15],01H
    MOV BYTE PTR [bx+16],01H
    MOV BYTE PTR [bx+17],01H
    MOV BYTE PTR [bx+18],01H
    MOV BYTE PTR [bx+19],01H

    MOV DI,0
    
tekrar:
    ADD BX, DI
    MOV AL, BL
 
    AND AL,01h
    XOR AL, 01h
    JP tek
    JNP cift
 
 
    
tek:
    MOV DL,[BX]
    NEG DL
    MOV BX, 0300H  
    SUB BX,DI
    MOV BYTE PTR [BX],DL
    MOV BX, 0200H
    INC DI
    DEC CX
    CMP CX,0
    JNZ tekrar
    JMP son
    

cift:
    MOV DL,[BX]
    NEG DL
    DEC DL
    MOV BX, 0300H
    SUB BX,DI
    MOV BYTE PTR [BX],DL 
    MOV BX, 0200H
    INC DI
    DEC CX
    CMP CX,0
    JNZ tekrar
    JMP son


son:

ret