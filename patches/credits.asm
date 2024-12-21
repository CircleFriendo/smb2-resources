;// xkas-plus
;// https://github.com/devinacker/xkas-plus

// Scrolling Credits

arch nes.cpu

// To customize these credits, edit the data under Credits_Line_#.

// Total number of lines. This is the line that will be at the bottom
// of the screen when scrolling stops.

define Lines 60


///////////
// These two lines skip the Cork Scene and Contributor Scene.
// Delete them if you want the credits to appear after those scenes.

org $00244B
JMP $E984

///////////



define PRGBank_C_D $06
define Song_EndCredits $04
define Horizontal $01
define Stack100_Gameplay %11000000
define MarioSleepingUpdateBuffer_Palettes $09


define ScreenUpdateIndex $11
define LoopCounter $14
define ScrollYHi $C8
define NMIWaitFlag $EB
define IsHorizontalLevel $EC
define RAM_PPUDataBufferPointer $F0
define ScrollY $FC
define StackArea $0100
define RAM_Music2 $0603
define BackgroundCHR1 $06F7
define BackgroundCHR2 $06F8


define WaitForNMI_MarioSleeping_TurnOffPPU $8014 
define WaitForNMI_MarioSleepingTurnOnPPU $8018
define WaitForNMI_MarioSleeping $801C
define EnableNMI_BankC $8033

define DisableNMI $E99E
define EnableNMI $EA2B
define WaitForNMI_TurnOffPPU $EAA3
define WaitForNMI $EAAB
define ClearNametablesAndSprites $EC8A
define ChangeMappedPRGBank $FF85
define ChangeNametableMirroring $FFA0


define JmpScrollLoop ScrollLoop-$010010
define JmpCreditsScene CreditsScene-$010010
define JmpWaitForNMI_Credits WaitForNMI_Credits-$010010
define JmpCreditsEnd CreditsEnd-$010010
define AddrCreditsPPU_Pointers CreditsPPU_Pointers-$010010





org $03E994

LDA #{PRGBank_C_D}
JSR {ChangeMappedPRGBank}
JMP {JmpCreditsScene}


org $01944F

CreditsScene:
LDY #{Song_EndCredits}
STY {RAM_Music2}

JSR {WaitForNMI_TurnOffPPU}
JSR {DisableNMI}

LDA #$50  //; CHRBank
STA {BackgroundCHR1}
LDA #$52  //; 
STA {BackgroundCHR2}

JSR {EnableNMI}
JSR {WaitForNMI}

JSR {WaitForNMI_MarioSleeping_TurnOffPPU}

LDA #{Horizontal}
JSR {ChangeNametableMirroring}
JSR {ClearNametablesAndSprites}

LDA #{Stack100_Gameplay}
STA {StackArea}
JSR {EnableNMI_BankC}
JSR {WaitForNMI_MarioSleeping}

LDA #{MarioSleepingUpdateBuffer_Palettes}
STA {ScreenUpdateIndex}
JSR {WaitForNMI_MarioSleeping}

LDA #$01  // MarioSleepingUpdateBuffer
STA {ScreenUpdateIndex}
JSR {WaitForNMI_MarioSleeping}

LDA #$03  // MarioSleepingUpdateBuffer
STA {ScreenUpdateIndex}
JSR {WaitForNMI_MarioSleeping}

JSR {WaitForNMI_MarioSleepingTurnOnPPU}

LDA #$00
STA {IsHorizontalLevel}
STA {LoopCounter}

ScrollLoop:
INC {ScrollY}
LDA {ScrollY}
CMP #$F0
BNE +
    LDA #$00
    STA {ScrollY}
    LDA {ScrollYHi}
    EOR #$02
    STA {ScrollYHi}
+

LDA {ScrollY}
AND #$07
BNE +
    INC {LoopCounter}
    LDA {LoopCounter}
    CMP #{Lines}+1
    BEQ CreditsEnd
    STA {ScreenUpdateIndex}
+

JSR {JmpWaitForNMI_Credits}
JMP {JmpScrollLoop}

CreditsEnd:
JSR {JmpWaitForNMI_Credits}
JMP {JmpCreditsEnd}

WaitForNMI_Credits:
LDA {ScreenUpdateIndex}
ASL
TAX
LDA {AddrCreditsPPU_Pointers},x
STA {RAM_PPUDataBufferPointer}
LDA {AddrCreditsPPU_Pointers}+1,x
STA {RAM_PPUDataBufferPointer}+1

LDA #$00
STA {NMIWaitFlag}

- 
LDA {NMIWaitFlag}
BPL -

RTS



define space $FB
define zero $D0
define one $D1
define two $D2
define three $D3
define four $D4
define five $D5
define six $D6
define seven $D7
define eight $D8
define nine $D9
define A $DA
define B $DB
define C $DC
define D $DD
define E $DE
define F $DF
define G $E0
define H $E1
define I $E2
define J $E3
define K $E4
define L $E5
define M $E6
define N $E7
define O $E8
define P $E9
define Q $EA
define R $EB
define S $EC
define T $ED
define U $EE
define V $EF
define W $F0
define X $F1
define Y $F2
define Z $F3

// Add or remove lines from this list as needed.
// The last line number should be one less than LoopEnd.

CreditsPPU_Pointers:
dw Credits_Nothing-$010010
dw Credits_Line_1-$010010
dw Credits_Line_2-$010010
dw Credits_Line_3-$010010
dw Credits_Line_4-$010010
dw Credits_Line_5-$010010
dw Credits_Line_6-$010010
dw Credits_Line_7-$010010
dw Credits_Line_8-$010010
dw Credits_Line_9-$010010
dw Credits_Line_10-$010010
dw Credits_Line_11-$010010
dw Credits_Line_12-$010010
dw Credits_Line_13-$010010
dw Credits_Line_14-$010010
dw Credits_Line_15-$010010
dw Credits_Line_16-$010010
dw Credits_Line_17-$010010
dw Credits_Line_18-$010010
dw Credits_Line_19-$010010
dw Credits_Line_20-$010010
dw Credits_Line_21-$010010
dw Credits_Line_22-$010010
dw Credits_Line_23-$010010
dw Credits_Line_24-$010010
dw Credits_Line_25-$010010
dw Credits_Line_26-$010010
dw Credits_Line_27-$010010
dw Credits_Line_28-$010010
dw Credits_Line_29-$010010
dw Credits_Line_30-$010010
dw Credits_Line_31-$010010
dw Credits_Line_32-$010010
dw Credits_Line_33-$010010
dw Credits_Line_34-$010010
dw Credits_Line_35-$010010
dw Credits_Line_36-$010010
dw Credits_Line_37-$010010
dw Credits_Line_38-$010010
dw Credits_Line_39-$010010
dw Credits_Line_40-$010010
dw Credits_Line_41-$010010
dw Credits_Line_42-$010010
dw Credits_Line_43-$010010
dw Credits_Line_44-$010010
dw Credits_Line_45-$010010
dw Credits_Line_46-$010010
dw Credits_Line_47-$010010
dw Credits_Line_48-$010010
dw Credits_Line_49-$010010
dw Credits_Line_50-$010010
dw Credits_Line_51-$010010
dw Credits_Line_52-$010010
dw Credits_Line_53-$010010
dw Credits_Line_54-$010010
dw Credits_Line_55-$010010
dw Credits_Line_56-$010010
dw Credits_Line_57-$010010
dw Credits_Line_58-$010010
dw Credits_Line_59-$010010
dw Credits_Line_60-$010010


Credits_Nothing:
db $00

// Data Format:
// For each line in the credits, the first two values are the XY position
// to begin the text, given as a video memory address. $2800 is the starting
// address of the second screen of video memory. $2000 is the starting address
// of the first screen of video memory. The very left side of the screen will
// be addresses where the second number is one of:
//      $00, $20, $40, $60, $80, $A0, $C0, $E0
//
// Thus, the "$28, $0A" in the first credits line here represents address $280A,
// which is the 11th tile on the first row of the second screen, right below the
// first screen which loads. You can adjust the text left or right by decreasing
// or increasing the second number.
//
// The third number is the length of the line to write, in tiles/characters.
// The data following that are the tile numbers to write.
//
// Each line should have a "db $00" following it to indicate the end of the write.
//
// If you need more than 60 lines, you can add more to the end. The video addresses
// will start over from the beginning. So, line 61 starts at $2800 just like line 1.
// Lines past 60 will need to overwrite the lines 60 before them. Simply write
// spaces (tile $FB) to overwrite them.
//
// Technically, blank lines only require the "db $00". The single space characters
// are only included here so you can reference the correct video memory address for
// each line. Feel free to delete those to save space.

// Edit the credits text here:

Credits_Line_1:
db $28, $0A, 12, {L}, {E}, {V}, {E}, {L}, {space}, {E}, {D}, {I}, {T}, {O}, {R}
db $00
Credits_Line_2:
db $28, $2C, 1, {space}
db $00
Credits_Line_3:
db $28, $4A, 12, {D},{T},{O},{T},{H},{E},{F},{O},{U},{R},{T},{H}
db $00
Credits_Line_4:
db $28, $6C, 1, {space}
db $00
Credits_Line_5:
db $28, $8C, 1, {space}
db $00
Credits_Line_6:
db $28, $AC, 1, {space}
db $00
Credits_Line_7:
db $28, $CC, 1, {space}
db $00
Credits_Line_8:
db $28, $EC, 1, {space}
db $00
Credits_Line_9:
db $29, $0C, 1, {space}
db $00
Credits_Line_10:
db $29, $2C, 1, {space}
db $00
Credits_Line_11:
db $29, $4C, 1, {space}
db $00
Credits_Line_12:
db $29, $6C, 1, {space}
db $00
Credits_Line_13:
db $29, $8C, 1, {space}
db $00
Credits_Line_14:
db $29, $AC, 1, {space}
db $00
Credits_Line_15:
db $29, $CC, 1, {space}
db $00
Credits_Line_16:
db $29, $EC, 1, {space}
db $00
Credits_Line_17:
db $2A, $0C, 1, {space}
db $00
Credits_Line_18:
db $2A, $2C, 1, {space}
db $00
Credits_Line_19:
db $2A, $4C, 1, {space}
db $00
Credits_Line_20:
db $2A, $6C, 1, {space}
db $00
Credits_Line_21:
db $2A, $8C, 1, {space}
db $00
Credits_Line_22:
db $2A, $AC, 1, {space}
db $00
Credits_Line_23:
db $2A, $CC, 1, {space}
db $00
Credits_Line_24:
db $2A, $EC, 1, {space}
db $00
Credits_Line_25:
db $2B, $0C, 1, {space}
db $00
Credits_Line_26:
db $2B, $2C, 1, {space}
db $00
Credits_Line_27:
db $2B, $4C, 1, {space}
db $00
Credits_Line_28:
db $2B, $6C, 1, {space}
db $00
Credits_Line_29:
db $2B, $8C, 1, {space}
db $00
Credits_Line_30:
db $2B, $AC, 1, {space}
db $00
Credits_Line_31:
db $20, $0C, 1, {space}
db $00
Credits_Line_32:
db $20, $2C, 1, {space}
db $00
Credits_Line_33:
db $20, $4C, 1, {space}
db $00
Credits_Line_34:
db $20, $6C, 1, {space}
db $00
Credits_Line_35:
db $20, $8C, 1, {space}
db $00
Credits_Line_36:
db $20, $AC, 1, {space}
db $00
Credits_Line_37:
db $20, $CC, 1, {space}
db $00
Credits_Line_38:
db $20, $EC, 1, {space}
db $00
Credits_Line_39:
db $21, $0C, 1, {space}
db $00
Credits_Line_40:
db $21, $2C, 1, {space}
db $00
Credits_Line_41:
db $21, $4C, 1, {space}
db $00
Credits_Line_42:
db $21, $6C, 1, {space}
db $00
Credits_Line_43:
db $21, $8C, 1, {space}
db $00
Credits_Line_44:
db $21, $AC, 6, {T},{H},{A},{N},{K},{S}
db $00
Credits_Line_45:
db $21, $CC, 7, $FB,$FB,$FB,$FB,$FB,$FB,$FB  // Overwrite "CREDITS" with blank tiles.
db $00
Credits_Line_46:
db $21, $EA, 11, {F},{O},{R},$FB,{P},{L},{A},{Y},{I},{N},{G}
db $00
Credits_Line_47:
db $22, $0C, 1, {space}
db $00
Credits_Line_48:
db $22, $2C, 1, {space}
db $00
Credits_Line_49:
db $22, $4C, 1, {space}
db $00
Credits_Line_50:
db $22, $6C, 1, {space}
db $00
Credits_Line_51:
db $22, $8C, 1, {space}
db $00
Credits_Line_52:
db $22, $AC, 1, {space}
db $00
Credits_Line_53:
db $22, $CC, 1, {space}
db $00
Credits_Line_54:
db $22, $EC, 1, {space}
db $00
Credits_Line_55:
db $23, $0C, 1, {space}
db $00
Credits_Line_56:
db $23, $2C, 1, {space}
db $00
Credits_Line_57:
db $23, $4C, 1, {space}
db $00
Credits_Line_58:
db $23, $6C, 1, {space}
db $00
Credits_Line_59:
db $23, $8C, 1, {space}
db $00
Credits_Line_60:
db $23, $AC, 1, {space}
db $00




org $018053

MarioDreamPalettes:
db $3F, $00, $20    // palette at $3F00, 32 bytes
db $3F, $30, $30, $3F
db $3F, $30, $10, $00
db $3F, $30, $10, $00
db $3F, $30, $10, $00
db $3F, $30, $10, $00
db $3F, $30, $10, $00
db $3F, $30, $10, $00
db $3F, $30, $10, $00
db $00

MarioDreamBed:
db $21, $CC, $07, $DC, $EB, $DE, $DD, $E2, $ED, $EC
db $00

org $054010
incbin credits.bin