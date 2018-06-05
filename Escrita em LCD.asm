;-------------------------------------------

;			PROGRAMA FONTE: ESCRITA EM LCD

;------------------------------------------

		#INCLUDE<P16F877A.INC>
		org	0x00
		
;----------------------------------------

;		DECLARA��ES DE CONSTANTES

;------------------------------------------

		RS	EQU 0X02
		E	EQU	0X03
		
;-----------------------------------------

;		DECLARA��O DE VARIAVEIS

;------------------------------------------

		cont0 equ 0x30
		cont1 equ 0x31
		cont2 equ 0x32		
		
		DADO	EQU	0X20
		PDEL0	EQU 0X21
		PDEL1	EQU 0X22
		
;----------------------------------------

;		CONFIGURA��ES INICIAIS

;----------------------------------------

;	CONFIGURA��O DOS PINOS DO PIC NO LCD
;	RD2: SAIDA, LIGADO AO PINO N�4(RS) DO LCD
;	RD3: SAIDA, LIGADO AO PINO N�6(E) DO LCD
;	RD4: SAIDA, LIGADO AO PINO N�11(D4)DO LCD
;	RD5: SAIDA, LIGADO AO PINO N�12(D5)DO LCD
;	RD6: SAIDA, LIGADO AO PINO N�13(D6)DO LCD
;	RD7: SAIDA, LIGADO AO PINO N�14(D7)DO LCD

INICIO:	BCF	STATUS,7
		BCF	STATUS,6
		BSF	STATUS,5
		CLRF	TRISD
		BSF TRISA,0
    	MOVLW B'01001110'
		MOVWF ADCON1
		BCF	STATUS,7
		BCF	STATUS,6
		BCF	STATUS,5
		MOVLW B'10000001'
		MOVWF ADCON0
		MOVLW	0x28	;INICIO
		CALL	EE		;CONFIGURA PARA DUAS LINHAS
		MOVLW	0x28	;5X7 PONTOS
		CALL	EE		;16X2 CARACTERES
		MOVLW	0x06	
		CALL	EE		;4BITS
		MOVLW	0x0C
		CALL	EE
		MOVLW	0x01
		CALL	EE		;FIM
		
;-------------------------------------------

;			PROGRAMA PRINCIPAL

;-------------------------------------------
	
		CLRF 	ADRESH
MAIN:	BSF		ADCON0,2
CONT:	BTFSC	ADCON0,2	
		GOTO	CONT
	    MOVF	ADRESH,0
		MOVWF	0x25
		BTFSC	0x25,7
		GOTO	OITO
		BTFSC	0x25,6
		GOTO	QUATRO
		BTFSC	0x25,5
		GOTO	DOIS
		BTFSC	0x25,4
		GOTO	UM
		MOVLW	0x80
		CALL	EE
		MOVLW	'0'
		CALL	ED
		CALL	DELAY
		GOTO	MAIN
UM:		MOVLW	0x80
		CALL	EE
		MOVLW	'0'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'4'
		CALL	ED
		MOVLW	'3'
		CALL	ED
		CALL	DELAY
		GOTO	MAIN
DOIS:	BTFSC	0x25,4
		GOTO	TRES
		MOVLW	0x80
		CALL	EE
		MOVLW	'0'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'6'
		CALL	ED
		MOVLW	'5'
		CALL	ED
		CALL	DELAY
		GOTO	MAIN
TRES:	MOVLW 	0X80
		CALL	EE
		MOVLW	'1'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'0'
		CALL	ED
		MOVLW	'6'
		CALL	ED
		CALL	DELAY
		GOTO	MAIN
QUATRO:	BTFSC	0x25,5
		GOTO	SEIS
		BTFSC	0X25,4
		GOTO	CINCO
		MOVLW 	0X80
		CALL	EE
		MOVLW	'1'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'5'
		CALL	ED
		MOVLW	'1'
		CALL	ED
		CALL	DELAY
		GOTO    MAIN
CINCO: 	MOVLW 	0X80
		CALL	EE
		MOVLW	'1'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'6'
		CALL	ED
		MOVLW	'4'
		CALL	ED
		CALL	DELAY
		GOTO    MAIN
SEIS:   BTFSC	0X25,4
		GOTO	SETE
		MOVLW 	0X80
		CALL	EE
		MOVLW	'1'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'9'
		CALL	ED
		MOVLW	'4'
		CALL	ED
		CALL	DELAY
		GOTO    MAIN
SETE:  	MOVLW 	0X80
		CALL	EE
		MOVLW	'2'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'3'
		CALL	ED
		MOVLW	'1'
		CALL	ED
		CALL	DELAY
		GOTO    MAIN
OITO:   BTFSC	0X25,6
		GOTO	DOZE
		BTFSC   0X25,5
		GOTO	DEZ
		BTFSC   0X25,4
		GOTO    NOVE
		MOVLW 	0X80
		CALL	EE
		MOVLW	'2'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'5'
		CALL	ED
		MOVLW	'6'
		CALL	ED
		CALL	DELAY
		GOTO    MAIN
NOVE:   MOVLW 	0X80
		CALL	EE
		MOVLW	'2'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'9'
		CALL	ED
		MOVLW	'5'
		CALL	ED
		CALL	DELAY
		GOTO    MAIN
DEZ:	BTFSC	0X25,4
		GOTO 	ONZE
		MOVLW 	0X80
		CALL	EE
		MOVLW	'3'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'1'
		CALL	ED
		MOVLW	'9'
		CALL	ED
		CALL	DELAY
		GOTO    MAIN
ONZE:	MOVLW 	0X80
		CALL	EE
		MOVLW	'3'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'6'
		CALL	ED
		MOVLW	'4'
		CALL	ED
		CALL	DELAY
		GOTO    MAIN
DOZE:	BTFSC	0X25,5
		GOTO	KTORZE
		BTFSC	0X25,4
		GOTO 	TREZE
		MOVLW 	0X80
		CALL	EE
		MOVLW	'3'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'8'
		CALL	ED
		MOVLW	'3'
		CALL	ED
		CALL	DELAY
		GOTO    MAIN
TREZE:	MOVLW 	0X80
		CALL	EE
		MOVLW	'4'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'2'
		CALL	ED
		MOVLW	'4'
		CALL	ED
		CALL	DELAY
		GOTO    MAIN
KTORZE:	BTFSC	0X25,4
		GOTO	QUINZE
		MOVLW 	0X80
		CALL	EE
		MOVLW	'4'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'5'
		CALL	ED
		CALL	DELAY
		GOTO    MAIN
QUINZE:	MOVLW 	0X80
		CALL	EE
		MOVLW	'4'
		CALL	ED
		MOVLW	','
		CALL	ED
		MOVLW	'8'
		CALL	ED
		MOVLW	'9'
		CALL	ED
		CALL	DELAY
		GOTO    MAIN
		
ED:		BSF	PORTD,RS	;ESCREVE DADO
		GOTO ENVIABYTE	;QUE ESTA COM W
EE:		BCF	PORTD,RS	;ESCREVE O ENDERE�O OU COMANDO QUE ESTA EM W
		GOTO ENVIABYTE
		
ENVIABYTE:	BSF		PORTD,E
	    	MOVWF	DADO
			MOVLW	0x0F
			ANDWF	PORTD,F
			MOVLW	0xF0
			ANDWF	DADO,W
			IORWF	PORTD,F
			BCF		PORTD,E
			BSF		PORTD,E
			SWAPF	DADO,F
			MOVLW	0x0F
			ANDWF	PORTD,F
			MOVLW	0xF0
			ANDWF	DADO,W
			IORWF	PORTD,F
			BCF		PORTD,E
			CALL	ATRASO_3MS
			RETURN
		

;----------------------------------------------------

;			DELAY

;----------------------------------------------------

ATRASO_3MS:	MOVLW	.6
	    	MOVWF	PDEL0
PLOOP1:	    MOVWF	.249
	     	MOVWF	PDEL1
PLOOP2:  	CLRWDT
		    CLRWDT
			DECFSZ	PDEL1,1
			GOTO	PLOOP2
			DECFSZ	PDEL0,1
			GOTO	PLOOP1
			CLRWDT
			RETURN

;-------------------------------
;SUBROTINA DE ATRASO
;-------------------------------
DELAY:  movlw .2
        movwf cont0
volta0: movlw .200
        movwf cont1
volta1: movlw .407
        movwf cont2
volta2: decfsz cont2
        goto volta2
        decfsz cont1
        goto volta1
        decfsz cont0
        goto volta0
        return
        
        END             

		 
		