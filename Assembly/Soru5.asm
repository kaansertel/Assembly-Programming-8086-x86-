org 100h
    MOV BX,0200H
    MOV WORD PTR [BX],0111H
    
    ADD BYTE PTR[BX], 0
    JP alt8bit_cift_sayida_lojik1
    JNP alt8bit_tek_sayida_lojik1

alt8bit_tek_sayida_lojik1:
    
    ADD BYTE PTR[BX+1], 0
    JP  tek_sayida_lojik1
    JNP cift_sayida_lojik1 
     
alt8bit_cift_sayida_lojik1:
    
    ADD BYTE PTR[BX+1], 0
    JP  cift_sayida_lojik1
    JNP tek_sayida_lojik1  
    
tek_sayida_lojik1:
    
    MOV AX, 00000h
    JMP son


cift_sayida_lojik1:
    
    MOV AX, 00001h
    JMP son


    
son:

ret