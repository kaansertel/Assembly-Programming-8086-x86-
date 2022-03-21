org 100h

 MOV BX,0200H           ;Siralanacak verinin bellek adresi bolgesi
 MOV BYTE PTR [bx],55h
 MOV BYTE PTR [bx+1],66H
 MOV BYTE PTR [bx+2],54H
 MOV BYTE PTR [bx+3],11H
 MOV BYTE PTR [bx+4],87H
 MOV BYTE PTR [bx+5],33H
 MOV BYTE PTR [bx+6],75H
 MOV BYTE PTR [bx+7],05H
 MOV BYTE PTR [bx+8],5FH
 MOV BYTE PTR [bx+9],23H
 
 
 MOV SI,1  
 MOV DI,0
 
J1:
 MOV DL,[BX+DI] ; en kucuk sayiyi tutan register
 MOV AL,[BX+SI] ; 0700:0200 taban adresindeki (SI ile indekslenmis) ilgili byte alir

 CMP AL,DL
 JAE devam  ;ele alinan sayi daha kucuk degilse
 
 MOV BYTE PTR[BX+DI], AL
 MOV BYTE PTR[BX+SI], DL  

 JMP devam
 
J2:
 INC DI      ;DI arttir     
 MOV SI, DI  ;SI ya DI nin degerini ata
 INC SI      ;Her zaman SI, DI'nin bir fazlasini gostersin
 CMP DI,9
 JZ son      ;DI, 9 oldugu zaman bitir
 JNZ J1      ;9 degilse devam et
 
devam:
 INC SI

 CMP SI,10
 JZ  J2      ;SI 10 oldugu zaman J2 ye git ve bir indis ilerle, ayni islemleri tekrar et
 JNZ J1      ;10 degilse devam et

son:   
    
    ; 0700:0200 bellek bolgesinde islemler yapilacaktir.
    

HLT 

ret




