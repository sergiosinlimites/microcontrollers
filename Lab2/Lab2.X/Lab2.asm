; First section
include P18F4550.inc; # registers in page 70 Datasheet
; Second section
; USE ONLY ONE OF THESE!
CONFIG FOSC = INTOSC_EC ; If i'm using internal clock, main value = 1MHz
;CONFIG FOSC = EC_EC ; If i'm using external clock
;CONFIG FOSC = XT_XT ; If i'm using crystal clock, if Freq < 4MHz
;CONFIG FOSC = HS ; If i'm using crystal clock, if 4MHz <= Freq < 48MHz

; Third section
aux1 equ 0h
aux2 equ 0h ; DO NOT ASSIGN DIFFERENT NAMES TO SAME DIRECTION
aux3 equ 1h
aux4 equ 0xa ; OTHER WAY
    
; Fourth section
Start 
    ;bcf TRISD,0; RD0 TO OUTPUT
    ;Datasheet page 128
    ;BCF = BIT CLEAR FILE = OUTPUT
    ;BSF = BIT SET FILE = INPUT
    ;bcf TRISB,5; RB5 TO OUTPUT
 
    ;movlw b'00000100' ; Configure many pins at the same time, only RD3 as input
    ;movwf TRISD

    ;bsf LATD,0
    ;setf LATD
    
    ;movlw b'11001100' ; Configure exit pins value,
    ; RD2 is not going to take the value.
    ;movwf LATD ; Only for EXITS
    
    bcf TRISD,0
Menu
    bsf LATD,0 ; ON
    bcf LATD,0 ; OFF
    goto Menu; Loop
end