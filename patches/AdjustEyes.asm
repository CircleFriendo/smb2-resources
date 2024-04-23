arch nes.cpu

;// Adjust the position of the players eyes

define bankoffset $FFF0

define pixels $04
define CurrentCharacter $8F
define Character_Princess $01


org $03F42A
JSR DrawEyesLeft+{bankoffset}

org $03F45A
JSR DrawEyesRight+{bankoffset}

;// freecode
org $03FB46
DrawEyesRight:
LDA {CurrentCharacter}
CMP #{Character_Princess}
BEQ +
LDA $0227
RTS
+
LDA $0227
SEC
SBC #{pixels}
RTS

DrawEyesLeft:
LDA {CurrentCharacter}
CMP #{Character_Princess}
BEQ +
LDA $0223
RTS
+
LDA $0223
CLC
ADC #{pixels}
RTS
