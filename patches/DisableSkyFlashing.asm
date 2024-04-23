arch nes.cpu

;// Disables screen flashing when bombs detonate.

org $7E1B
LDA #$00
NOP
