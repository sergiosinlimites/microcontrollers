; First section
include P18F4550.inc; # registers in page 70 Datasheet
; Second section
; USE ONLY ONE OF THESE!
CONFIG FOSC = INTOSC_EC ; If i'm using internal clock, main value = 1MHz
;CONFIG FOSC = EC_EC ; If i'm using external clock
;CONFIG FOSC = XT_XT ; If i'm using crystal clock, if Freq < 4MHz
;CONFIG FOSC = HS ; If i'm using crystal clock, if 4MHz <= Freq < 48MHz

; Third section
; Enteras de 8 bits sin signo y globales
aux1 equ 0h
aux2 equ 0h ; DO NOT ASSIGN DIFFERENT NAMES TO SAME DIRECTION
aux3 equ 1h
aux4 equ 0xa ; OTHER WAY
; data memory map in page 68 Datasheet
; GPR = General Purpose Register; SFR = Special Function Register:
; Memory divided in banks, 8 for 4550 (with bank direction and global direction)
; TODO: Review PCR
; Last direction in bank: 05Fh

; Fourth section
START ; TAG 
; Chapter 26 datasheet; page 318 Datasheet
    MOVLW .5 ; MOVE LITERAL TO WREG W <- 5, point for decimal
    MOVWF aux1 ; MOVE WREG TO f
    
    MOVLW 0x3F ; The same
    MOVWF aux2
    
    MOVLW b'11001101'
    MOVWF aux3
    
    GOTO START
end