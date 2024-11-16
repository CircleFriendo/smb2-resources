;// xkas-plus
;// https://github.com/devinacker/xkas-plus

arch nes.cpu

;// Cap the Max Health a player can get from Mushrooms to 4

define bankoffset $FFF0
define PlayerMaxHealth $04C3

org $0050B1
JSR $9EBD

org $005ECD
MaxHealth:

LDA {PlayerMaxHealth}
CMP #$02 ;// this is four hearts worth (base 2 plus an additional 2)
BPL +
INC {PlayerMaxHealth}
+ 
RTS
