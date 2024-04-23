arch nes.cpu

;// Edit the title card graphics at the beginning of levels

;// The title card data is at the end of the file.

define PPUCTRL   $2000
define PPUMASK   $2001
define PPUSTATUS $2002
define OAMADDR   $2003
define OAMDATA   $2004
define PPUSCROLL $2005
define PPUADDR   $2006
define PPUDATA   $2007

define CurrentWorld $0635
define CurrentLevel $0531

;// our bank starts at $014010 instead of $8000 so we need to add $3FF0
define bankoffset $3FF0

;// we overwrite the title card data at $014010-$01414F
;// as well as the world 7 title card routine at $0143A2

;// BANK A_8327
org $014337
DrawTitleCardWorldImage:

JSR LoadSeparateTitleCard+{bankoffset}

NOP #4

LDA #$25
STA $00
LDA #$C8
STA $01
LDY #$00

StartLine:  ;// 8338
LDX #$0F
LDA {PPUSTATUS}
LDA $00
STA {PPUADDR}
LDA $01
STA {PPUADDR}

-
LDA ($02),y
STA {PPUDATA}
INY 
DEX
BPL -

CPY #$A0
BCS +

LDA $01
ADC #$20
STA $01
LDA $00
ADC #$00
STA $00
JMP StartLine+{bankoffset}  ;// 8338


org $014374
+


org $0143A2
;// used to be DrawTitleCardWorld7Image:
LoadSeparateTitleCard:

LDY {CurrentLevel}

LDA TitleCardLo+{bankoffset},y
STA $02

LDA TitleCardHi+{bankoffset},y
STA $03

RTS


TitleCardHi:
db $80, $94, $94
db $95, $96, $96
db $97, $98, $98
db $99, $99, $9A
db $9B, $9B, $9C
db $9D, $9D, $9E
db $9E, $80

TitleCardLo:
db $00, $40, $E0
db $80, $20, $C0
db $60, $00, $A0
db $40, $E0, $80
db $20, $C0, $60
db $00, $A0, $40
db $E0, $A0

warnpc $0143D9

;// Level 1-1 Title Card Data
org $014010 ;// 8000
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE

;// Level 1-2 Title Card Data
org $015450 ;// 9440
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE

;// Level 1-3 Title Card Data
 ;// 94E0
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE



;// Level 2-1 Title Card Data
;// 9580
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE

;// Level 2-2 Title Card Data
;// 9620
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE

;// Level 2-3 Title Card Data
 ;// 96C0
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE



;// Level 3-1 Title Card Data
 ;// 9760
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE

;// Level 3-2 Title Card Data
;// 9800
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE

;// Level 3-3 Title Card Data
 ;// 98A0
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE



;// Level 4-1 Title Card Data
 ;// 9940
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE

;// Level 4-2 Title Card Data
 ;// 99E0
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE

;// Level 4-3 Title Card Data
;// 9A80
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE



;// Level 5-1 Title Card Data
 ;// 9B20
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE

;// Level 5-2 Title Card Data
 ;// 9BC0
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE

;// Level 5-3 Title Card Data
 ;// 9C60
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE



;// Level 6-1 Title Card Data
 ;// 9D00
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE

;// Level 6-2 Title Card Data
 ;// 9DA0
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE

;// Level 6-3 Title Card Data
 ;// 9E40
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE



;// Level 7-1 Title Card Data
 ;// 9EE0
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE

;// Level 7-2 Title Card Data
org $0140B0 ;// 80A0 
db $FB, $FB, $B0, $B2, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB, $FB
db $FB, $FB, $B1, $B3, $FB, $FB, $FB, $FB, $FB, $FB, $C0, $C1, $FB, $FB, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B6, $B8, $BA, $B8, $BA, $BC, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $FB, $FB, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $FB, $FB, $B4, $B5, $C0, $C1, $FB, $FB, $B7, $B9, $BB, $B9, $BB, $BD, $FB, $FB
db $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC, $CA, $CC
db $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD, $CB, $CD
db $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF
db $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE, $CF, $CE
