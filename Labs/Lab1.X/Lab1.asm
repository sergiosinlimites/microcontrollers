; FIRST LAB
; First section
include P18F4550.inc; # registers in page 70 Datasheet
; Second section
; USE ONLY ONE OF THESE!
CONFIG FOSC = INTOSC_EC ; If i'm using internal clock, main value = 1MHz
;CONFIG FOSC = EC_EC ; If i'm using external clock
;CONFIG FOSC = XT_XT ; If i'm using crystal clock, if Freq < 4MHz
;CONFIG FOSC = HS ; If i'm using crystal clock, if 4MHz <= Freq < 48MHz

; Third sec
var1 equ 0h
var2 equ 1h ; DO NOT ASSIGN DIFFERENT NAMES TO SAME DIRECTION
var3 equ 2h
var4 equ 3h
; data memory map in page 68 Datasheet
; GPR = General Purpose Register; SFR = Special Function Register:
; Memory divided in banks, 8 for 4550 (with bank direction and global direction)
; TODO: Review PCR
; Last direction in bank: 05Fh

; Fourth section
START ; TAG 
    ; Chapter 26 datasheet; page 318 Datasheet
    ; FIRST EXERCISE, create constant with value 9 and
    ; assign to variable
    MOVLW .9
    MOVWF var1
    ; assign max value to variable
    MOVLW .255
    MOVWF var1
    
    ; SECOND EXERCISE: Add 3 to the variable
    ; aux1 previously loaded with the value 7.
    MOVLW .7
    MOVWF var1
    
    MOVF var1,w ; Variable to WREG
    ADDLW .3 ; Add to WREG
    MOVWF var2
    
    ; THIRD EXERCISE: Add the variables aux1
    ; and aux2 previously loaded with the
    ; values 8 and 10, respectively.
    MOVLW .8
    MOVWF var1
    
    MOVLW .10
    MOVWF var2
    
    MOVF var1,w ; Variable 1 to WREG
    MOVWF var3 ; Add to var3
    
    MOVF var2,w ; Variable 2 to WREG
    ADDWF var3 ; Add to var3

    ; FOURTH EXERCISE: Subtract the variable aux1,
    ; previously loaded with the value 5, from the
    ; constant 9.
    MOVLW .5
    MOVWF var1
    
    MOVF var1,w
    SUBLW .9
    
    ; FIFTH EXERCISE: Subtract the variable aux1
    ; from the variable aux2, previously loaded
    ; with the values 6 and 4, respectively.
    MOVLW .6
    MOVWF var1
    
    MOVLW .4
    MOVWF var2
    
    MOVF var1,w
    SUBWF var2,var3 ; Here must apply 2's complement
    ; because it's negative
    
    ; SIXTH EXERCISE: Multiply the variable aux1,
    ; previously loaded with the value 5, by the
    ; constant 4.
    MOVLW .5
    MOVWF var1
    
    MOVF var1,w
    MULLW .4
    ; The result is available at variables
    ; PRODH and PRODL
    ; in this case in PRODL
    
    ; SEVENTH EXERCISE: Multiply the variable aux1
    ; by the variable aux2, previously loaded with
    ; the values 12 and 15, respectively.
    MOVLW .12
    MOVWF var1
    
    MOVLW .15
    MOVWF var2
    
    MOVF var1,w
    MULWF var2
    ; The result is available at variables
    ; PRODH and PRODL
    
    ; EIGTH EXERCISE: Perform the 1's complement
    ; on the variable aux1 previously loaded with
    ; the value 12.
    MOVLW .12
    MOVWF var1
    
    COMF var1 ; 1's complement
    
    ; NINTH EXERCISE: Perform the 2's complement
    ; of the variable aux1 previously loaded with
    ; the value 12.
    MOVLW .12
    MOVWF var1
    
    NEGF var1 ; 2's complement

    ; TENTH EXERCISE: Perform the logical OR
    ; bitwise operation between the value 7
    ; and the variable aux1 previously loaded
    ; with the value 35.
    MOVLW .35
    MOVWF var1
    
    MOVF var1,w
    IORLW .7
    MOVWF var1
    
    
    ; ELEVENTH EXERCISE: Perform the logical OR
    ; bitwise operation between the variables aux1
    ; and aux2, previously loaded with the values
    ; 20 and 56, respectively.
    MOVLW .20
    MOVWF var1
    
    MOVLW .56
    MOVWF var2
    
    MOVF var1,w
    IORWF var2
   
    ; TWELFTH EXERCISE: Perform the bitwise logical AND
    ; operation between the value 15 and the variable aux1,
    ; previously loaded with the value 62.
    MOVLW .62
    MOVWF var1
    
    MOVF var1,w
    ANDLW .15
    MOVWF var1
    
    ; THIRTEENTH EXERCISE: Perform the logical AND operation
    ; between the variables aux1 and aux2, previously loaded
    ; with the values 100 and 45, respectively.
    MOVLW .100
    MOVWF var1
    
    MOVLW .45
    MOVWF var2
    
    MOVF var1,w
    ANDWF var2
    
    ; FOURTEENTH EXERCISE: Perform the exclusive OR bitwise
    ; operation between the value 1 and the variable aux1
    ; previously loaded with the value 120.
    
    MOVLW .120
    MOVWF var1
    
    MOVF var1,w
    XORLW .1
    MOVWF var1
    
    ; FIFTEENTH EXERCISE: Perform the exclusive OR bitwise
    ; operation between the variables aux1 and aux2,
    ; previously loaded with the values 17 and 90,
    ; respectively.
    MOVLW .17
    MOVWF var1
    
    MOVLW .90
    MOVWF var2
    
    MOVF var1,w
    XORWF var2
    
    ; SIXTEENTH EXERCISE: The following operation should be
    ; performed next, with aux1, aux2, and aux3 previously
    ; loaded with 25, 40, and 103, respectively:
    ; aux4 <- (aux1 OR aux2) AND (aux3 XOR 0xD0)
    ; Assign
    MOVLW .25
    MOVWF var1
    
    MOVLW .40
    MOVWF var2
    
    MOVLW .103
    MOVWF var3
    
    ; OR between aux1 and aux2
    MOVF var1,w
    IORWF var2
    
    ; XOR between aux3 and 0xD0
    MOVF var3,w
    XORLW 0xD0
    
    ; AND between the last 2 operations
    ANDWF var2
    
    ; Move result to a new variable
    MOVF var2,w
    MOVWF var4
    
    ; SEVENTEENTH EXERCISE: Finally, the following operation
    ; must be performed, with aux1, aux2, and aux3
    ; previously loaded with 18, 60, and 16, respectively:
    ; aux4 <- (aux1 + aux2) - 3*(aux3 - 0b11010)
    ; Assign
    MOVLW .18
    MOVWF var1
    
    MOVLW .60
    MOVWF var2
    
    MOVLW .16
    MOVWF var3
    ; aux1 + aux2
    MOVF var1,w
    ADDWF var2
    
    ; aux3 - 0b11010
    MOVF var3,w
    SUBLW b'11010'
    MOVWF var3
    NEGF var3
    
    ; 3 times
    MOVF var3,w
    MULLW .3
    MOVF PRODL,w
    
    ; Substract the terms
    SUBWF var2,w

    ; Assign to aux4
    MOVWF var4
    
    
    
    GOTO START
end