
ORG 0
start:
 MOV AX, 0200h ;Bellek bolgesi secme
 MOV DS, AX
 MOV AX,1234h ;Carpan alt 16 biti
 MOV [DI], AX
 MOV BX,1234h ;Carpan ust 16 biti
 MOV [DI + 2], BX
 
  
  
 MOV AX, 0300h
 MOV DS, AX
 
 MOV DX,1111h ;Carpilan alt 16 biti
 MOV [DI], DX
 MOV CX,1111h ;Carpilan ust 16 biti
 MOV [DI+2], CX
 

 MOV SI,20h ;dongu degiskeni (32 kez donmesi icin)
 
 tekrar:
 MOV AX, 0200h
 MOV DS, AX
 MOV BX, [DI]
 MOV CX,[DI+2]
 MOV AX, 0400h
 MOV DS, AX
 MOV [DI],BX
 AND [DI], 01h  ;LSB biti haricindeki bitlerini sifirla
 XOR [DI], 01h  ;Carpan'in en anlams?z biti lojik 1 mi?
 JZ topla_kaydir;Evet ise Carpim sonucunu Carpilan ile topla
                ; ve bir bit saga kaydir
 CLC
 
 devam:

 MOV AX, 0500h
 MOV DS, AX
 RCR [DI+7],1    ;Carpim sonucunu bir bit saga kaydir
 RCR [DI+6],1 
 RCR [DI+5],1
 RCR [DI+4],1
 RCR [DI+3],1
 RCR [DI+2],1
 RCR [DI+1],1                    
 RCR [DI],1
   
 
 MOV AX, 0200h
 MOV DS, AX
 
 SHR [DI+3],1    ;Carpan'i bir bit saga kaydir
 RCR [DI+2],1
 RCR [DI+1],1
 RCR [DI],1
 
 DEC SI          ;dongu degiskenini bir azalt
 CMP SI,0        ;dongu degiskeni sifir mi?

 JNZ tekrar      ;Eger sifir degil ise ayni islemleri tekrarla
 JMP son         ;carpim sonucunu goster

 topla_kaydir:
 
 MOV AX, 0300h
 MOV DS, AX
 
 MOV DX,[DI]
 MOV CX, [DI +2]
 
 MOV AX,0500h
 MOV DS,AX
                  ;Carpilan ile carpim sonucunu toplar
 ADC [DI+4], DX 
 ADC [DI+6], CX
 
 JMP devam
 
 son:

ret


