// xkas-plus
// https://github.com/devinacker/xkas-plus

// author: CircleFriendo

// Replace the Overworld music with "Green Greens" from Kirby's Dream Land

arch nes.cpu


define C3 $18
define D3 $1C
define E3 $20
define F3 $22
define G3 $26
define A3 $2A
define B3 $2E
define C4 $30
define D4 $34
define E4 $38
define F4 $3A
define G4 $3E
define A4 $42
define B4 $46
define C5 $48
define D5 $4C
define E5 $50
define F5 $52
define G5 $56
define A5 $5A
define B5 $5E
define C6 $60
define D6 $64
define E6 $68
define F6 $6A
define G6 $6E
define A6 $72
define B6 $76
define C7 $78

define R $7E

define timbre $10

define sixteenth       $80+{timbre}
define sixteenthS      $81+{timbre}
define eighthtriplet   $82+{timbre}
define eighthtripletS  $83+{timbre}
define eighth          $84+{timbre}
define eighthdotted    $85+{timbre}
define quartertriplet  $86+{timbre}
define quartertripletS $87+{timbre}
define quarter         $88+{timbre}
define quarterdotted   $89+{timbre}
define half            $8A+{timbre}
define halfdotted      $8B+{timbre}
define whole           $8C+{timbre}




org $009010

MusicTable:
Parts:
db $99  // Mushroom Bonus Chance
db $8E  // Boss Defeated
db $84  // Crystal (Unused)
db $A4  // Death
db $89  // GameOver
db $84  // Crystal
db $99  // Bonus Chance
db $2A  // Character Select
db $30
db $36
db $30
db $3C
db $42
db $A9
db $9E
db $93
db $48  // Overworld
db $4E
db $54
db $5A
db $60
db $66
db $66
db $72  // Boss
db $78  // Star
db $7E  // Wart
db $B5  // Title
db $AF
db $BB
db $C1
db $C7  // Subspace
db $CD
db $D3
db $CD
db $D9
db $DF  // Ending
db $EB
db $E5
db $F7
db $F1
db $FD
db $6C  // Underground

Headers:
db $00, $AD, $98, $6B, $36, $A0  // Character Select 1
db $00, $5C, $99, $8E, $48, $B0  // Character Select 2
db $00, $9A, $99, $6F, $48, $76  // Character Select 3
db $00, $9E, $99, $6B, $47, $72  // Character Select 4
db $00, $26, $9A, $8A, $46, $AC  // Character Select 5

define offset $10  // bank 4 starts at $008010 and banks are loaded at $8000

db $37 ; dw S1-{offset} ; db S1_T-S1, S1_SQ-S1, S1_N-S1  // Overworld 1   Green Greens
db $37 ; dw S2-{offset} ; db S2_T-S2, S2_SQ-S2, S2_N-S2  // Overworld 2
db $37 ; dw S3-{offset} ; db S3_T-S3, S3_SQ-S3, S3_N-S3  // Overworld 3
db $37 ; dw S4-{offset} ; db S4_T-S4, S4_SQ-S4, S4_N-S4  // Overworld 4
db $37 ; dw S5-{offset} ; db S5_T-S5, S5_SQ-S5, S5_N-S5  // Overworld 5
db $37 ; dw S6-{offset} ; db S6_T-S6, S6_SQ-S6, S6_N-S6  // Overworld 6


db $6E, $BD, $94, $53, $2A, $84  // Underground
db $28, $1C, $9F, $83, $42, $00  // Boss
db $00, $69, $94, $37, $1A, $49  // Star
db $28, $C7, $9F, $96, $4B, $00  // Wart
db $00, $48, $A1, $1B, $0D       // Crystal
db $00, $CE, $A0, $1B, $0E       // Game Over
db $00, $F2, $A0, $41, $27       // Boss Defeated
db $00, $93, $9B, $2F, $21, $38  // Character Select 8
db $52, $BB, $A0, $00, $0A       // Bonus
db $00, $DF, $9A, $97, $61, $B0  // Character Select 7
db $28, $6F, $A1, $17, $0C       // Death
db $00, $5D, $9A, $6C, $45, $79  // Character Select 6
db $1B, $A7, $96, $BC, $64, $59  // Title 2
db $1B, $3E, $96, $43, $22, $57  // Title 1
db $1B, $94, $97, $8D, $47, $BA  // Title 3
db $1B, $78, $98, $24, $12, $29  // Title 4
db $28, $50, $95, $38, $1C, $83  // Subspace 1
db $28, $A3, $95, $24, $12, $30  // Subspace 2
db $28, $E0, $95, $22, $10, $51  // Subspace 3
db $28, $0F, $96, $17, $0A, $22  // Subspace 4
db $6E, $1E, $91, $3D, $1F, $6D  // Ending 1
db $6E, $9C, $91, $41, $21, $8C  // Ending 3
db $6E, $80, $92, $2A, $5A, $19  // Ending 2
db $6E, $F2, $92, $4C, $14, $68  // Ending 5
db $6E, $0D, $92, $43, $29, $1B  // Ending 4
db $6E, $76, $93, $00, $72, $00  // Ending 6


Pointers:

// Start
db $10  // Overworld
db $07  // Character Select
db $29  // Underground
db $17  // Boss
db $18  // Star
db $1E  // Subspace
db $19  // Wart
db $1A  // Title
db $23  // Ending

// End
db $15  // Overworld
db $0F  // Character Select
db $29  // Underground
db $17  // Boss
db $18  // Star
db $22  // Subspace
db $19  // Wart
db $1D  // Title
db $28  // Ending

// Loop
db $11  // Overworld
db $08  // Character Select
db $29  // Underground
db $17  // Boss
db $18  // Star
db $1E  // Subspace
db $19  // Wart
db $00  // Title
db $28  // Ending


// music
org $00A410

S1:
db $90, {G3}, {G3}, $7E, {G3}, {G3}, $7E, {G3}, $7E, {G3}, $7E, {F5}, {F5}, {F5}, $7E, $94, $7E
db $7E, {E4}, {E4}, {E4}, {E4}, {E4}, {E4}, {E4} 
db $7E, {E4}, {E4}, {E4}, {E4}, {E4}, {E4}, {E4} 
db $7E, {F4}, {F4}, {F4}, {F4}, {F4}, {F4}, {F4} 
db $7E, {F5}, {F5}, {G5}, {G5}, $7E

db $00   // 48 bytes

S1_SQ:
db {half}, $7E, {eighth}, $7E
db {sixteenth}, {D5}, {D5}, {D5}, $7E, $94, $7E

db $7E, {G3}, {G3}, {G3}, {G3}, {G3}, {G3}, {G3}
db $7E, {G3}, {G3}, {G3}, {G3}, {G3}, {G3}, {G3}
db $7E, {A3}, {A3}, {A3}, {A3}, {A3}, {A3}, {A3}
db $7E, {A4}, {A4}, {A4}, {B4}, $7E

S1_T:
db $80, {G3}, {G3}, $7E, {G3}, {G3}, $7E, {G3}, $7E, {G3}, $7E, {F5}, {F5}, {F5}, $7E, {A3}, {B3} 
db $8C, {C4}, {C4}, {D4}
db $84, $7E, {G4}, {G4}, {G4}, {G4}, $7E

S1_N:
db $BC, $01, $01, $01, $01, $B4, $01, $10, $10, $10, $10, $01



S2:
db {eighthdotted}, {G5}, {sixteenth}, {G5}
db {halfdotted}, {C6}, {eighthdotted}, {C6}, {sixteenth}, {E6}
db {eighth}, {G6}, {C7}, {B6}, {A6}, {quarter}, {G6}, {eighthdotted}, {E6}, {sixteenth}, {G6}
db {quarter}, {F6}, {eighthdotted}, {D6}, {sixteenth}, {E6}, {quarter}, {D6}, {eighthdotted}, {E6}, {sixteenth}, {D6}
db {halfdotted}, {C6}, {eighthdotted}, {G5}, {sixteenth}, {G5}
db $00

S2_SQ:
db {eighth}, {R}, {R}
db {C4}, {G4}, {G4}, {G4}, {G4}, {G4}, {G4}, {G4}
db {C4}, {G4}, {G4}, {G4}, {G4}, {G4}, {G4}, {G4}
db {D4}, {A4}, {A4}, {A4}, {D4}, {G4}, {G4}, {G4}
db {C4}, {G4}, {G4}, {G4}, {G4}, {G4}, {G4}, {G4}

S2_T:
db $84, {R}, {R}
db {G4}, {E5}, {E5}, {E5}, {E5}, {E5}, {E5}, {E5}
db {G4}, {E5}, {E5}, {E5}, {E5}, {E5}, {E5}, {E5}
db {A4}, {C5}, {C5}, {C5}, {G4}, {B4}, {B4}, {B4}
db {G4}, {E5}, {E5}, {E5}, {E5}, {E5}, {E5}, {E5}

S2_N:
db $B0, $10, $01, $02, $02
db $10, $01, $02, $02, $10, $01, $02, $02
db $10, $02, $02, $02, $10, $01, $02, $02
db $10, $01, $02, $02, $10, $01, $02, $02
db $10, $02, $02, $02, $10, $01, $02, $02
db $10, $01, $02, $02, $10, $01, $02, $02
db $10, $02, $02, $02, $10, $01, $02, $02
db $10, $01, $02, $02, $10, $01, $02, $02
db $10, $02, $02, $02, $10, $01, $02, $02



S3:
db {halfdotted}, {C6}, {eighthdotted}, {C6}, {sixteenth}, {E6}
db {eighth}, {G6}, {C7}, {B6}, {A6}, {quarter}, {G6}
db {eighthdotted}, {E6}, {sixteenth}, {G6}, {quarter}, {F6}
db {eighthdotted}, {D6}, {sixteenth}, {E6}, {quarter}, {D6}
db {eighthdotted}, {E6}, {sixteenth}, {D6}
db {whole}, {C6}
db $00

S3_SQ:
db {eighth}, {C4}, {G4}, {G4}, {G4}, {G4}, {G4}, {G4}, {G4}
db {C4}, {G4}, {G4}, {G4}, {G4}, {G4}, {G4}, {G4}
db {D4}, {A4}, {A4}, {A4}, {C5}, {B5}, {B5}, {B5}
db {sixteenth}, {C5}, {E5}, {C5}, {E5}, {C5}, {E5}, {C5}, {E5}
db {C5}, {E5}, {C5}, {E5}, {C5}, {E5}, {C5}, {E5}

S3_T:
db $84, {G4}, {E5}, {E5}, {E5}, {E5}, {E5}, {E5}, {E5}
db {G4}, {E5}, {E5}, {E5}, {E5}, {E5}, {E5}, {E5}
db {A4}, {C5}, {C5}, {C5}, {G4}+2, {E5}, {E5}, {E5}
db {C5}, {A5}, {A5}, {A5}, {G4}, {G5}, {G5}, {G5}

S3_N:
db $B0
db $10, $01, $02, $02, $10, $01, $02, $02
db $10, $02, $02, $02, $10, $01, $02, $02
db $10, $01, $02, $02, $10, $01, $02, $02
db $10, $02, $02, $02, $10, $01, $02, $02
db $10, $01, $02, $02, $10, $01, $02, $02
db $10, $02, $02, $02, $10, $01, $02, $02
db $10, $01, $02, $02, $10, $01, $02, $02
db $10, $02, $02, $02, $10, $01, $02, $02



S4:
db {eighthdotted}, {C6}, {sixteenth}, {C6}, {eighth}, {D6}, {quarter}, {E6}
db {eighth}, {C6}, {D6}, {C6}
db {R}, {G3}, {G3}, {G3}, {G3}, {G3}, {G3}, {G3}
db {R}, {G3}, {G3}, {G3}, {G3}, {G3}, {G3}, {G3}
db $00

S4_SQ:
db {eighthdotted}, {A5}, {sixteenth}, {A5}, {eighth}, {R}, {R}
db {eighthdotted}, {B5}, {sixteenth}, {B5}, {eighth}, {R}, {R}
db {R}, {E3}, {E3}, {E3}, {E3}, {E3}, {E3}, {E3} 
db {R}, {E3}, {E3}, {E3}, {E3}, {E3}, {E3}, {E3} 

S4_T:
db $8C, {R}, {C4}, {C4}

S4_N:
db $B0, $10, $01, $02, $02, $10, $01, $02, $02
db $B8, $10, $01
db $B0, $10, $01, $02, $02, $10, $01, $02, $02
db $10, $02, $02, $02, $10, $01, $02, $02
db $10, $01, $02, $02, $10, $01, $02, $02
db $10, $02, $02, $02, $10, $01, $02, $02



S5:
db {quarter}, {E5}-2, {eighthdotted}, {D5}, {sixteenth}, {E5}-2
db {quarter}, {F5}, {eighthdotted}, {E5}-2, {sixteenth}, {F5}
db {quarter}, {G5}, {eighthdotted}, {F5}, {sixteenth}, {G5}
db {quarter}, {C5}, {eighthdotted}, {C5}, {sixteenth}, {D5}
db {quarter}, {E5}-2, {eighthdotted}, {D5}, {sixteenth}, {E5}-2
db {quarter}, {F5}, {eighthdotted}, {E5}-2, {sixteenth}, {F5}
db {quarter}, {G5}, {R}, {C6}, {eighthdotted}, {C6}, {sixteenth}, {D6}
db $00

S5_SQ:
db {quarter}, {A4}-2, {eighthdotted}, {A4}-2, {sixteenth}, {A4}-2
db {quarter}, {D5}, {eighthdotted}, {C5}, {sixteenth}, {D5}
db {quarter}, {E5}-2, {eighthdotted}, {D5}, {sixteenth}, {E5}-2
db {quarter}, {A4}-2, {eighthdotted}, {A4}-2, {sixteenth}, {B4}-2
db {quarter}, {A4}-2, {eighthdotted}, {A4}-2, {sixteenth}, {A4}-2
db {quarter}, {D5}, {eighthdotted}, {C5}, {sixteenth}, {D5}
db {quarter}, {E5}-2, {R}, {A5}-2, {eighthdotted}, {A5}-2, {sixteenth}, {B5}-2

S5_T:
db $80, {F3}, {F4}, {A4}-2, {F4}, {A4}-2, {F4}, {A4}-2, {F4}
db {B3}-2, {F4}, {B4}-2, {F4}, {B4}-2, {F4}, {B4}-2, {F4}
db {E3}-2, {E4}-2, {G4}, {E4}-2, {G4}, {E4}-2, {G4}, {E4}-2
db {A3}-2, {E4}-2, {A4}-2, {E4}-2, {A4}-2, {E4}-2, {A4}-2, {E4}-2
db {F3}, {F4}, {A4}-2, {F4}, {A4}-2, {F4}, {A4}-2, {F4}
db {B3}-2, {F4}, {B4}-2, {F4}, {B4}-2, {F4}, {B4}-2, {F4}
db {E3}-2, {E4}-2, {G4}, {E4}-2, {G4}, {E4}-2, {G4}, {E4}-2
db {A3}-2, {E4}-2, {A4}-2, {E4}-2, {A4}-2, {E4}-2, {A4}-2, {E4}-2

S5_N:
db $B0, $10, $01, $02, $02, $10, $01, $02, $02
db $10, $02, $02, $02, $10, $01, $02, $02, $00



S6:
db {quarter}, {E6}-2, {eighthdotted}, {D6}, {sixteenth}, {E6}-2
db {quarter}, {F6}, {eighthdotted}, {E6}-2, {sixteenth}, {F6}
db {quarter}, {G6}, {eighthdotted}, {F6}, {sixteenth}, {G6}
db {quarter}, {C6}, {eighthdotted}, {C6}, {sixteenth}, {D6}
db {quarter}, {E6}-2, {eighthdotted}, {D6}, {sixteenth}, {E6}-2
db {quarter}, {F6}, {eighthdotted}, {E6}-2, {sixteenth}, {F6}
db {quarter}, {D6}, {R}, {G6}
db $00

S6_SQ:
db {quarter}, {A4}-2, {eighthdotted}, {A4}-2, {sixteenth}, {A4}-2
db {quarter}, {D5}, {eighthdotted}, {C5}, {sixteenth}, {D5}
db {quarter}, {E5}-2, {eighthdotted}, {D5}, {sixteenth}, {E5}-2
db {quarter}, {A4}-2, {eighthdotted}, {A4}-2, {sixteenth}, {B4}-2
db {quarter}, {A4}-2, {eighthdotted}, {A4}-2, {sixteenth}, {A4}-2
db {quarter}, {D5}, {eighthdotted}, {C5}, {sixteenth}, {D5}
db {quarter}, {B5}, {R}, {B5}

S6_T:
db $80, {F4}, {F5}, {A5}-2, {F5}, {A5}-2, {F5}, {A5}-2, {F5}
db {B4}-2, {F5}, {B5}-2, {F5}, {B5}-2, {F5}, {B5}-2, {F5}
db {E4}-2, {E5}-2, {G5}, {E5}-2, {G5}, {E5}-2, {G5}, {E5}-2
db {A4}-2, {E5}-2, {A5}-2, {E5}-2, {A5}-2, {E5}-2, {A5}-2, {E5}-2
db {F4}, {F5}, {E5}-2, {F5}, {E5}-2, {F5}, {E5}-2, {F5}
db {B4}-2, {F5}, {B5}-2, {F5}, {B5}-2, {F5}, {B5}-2, {F5}
db $84, {G3}, $80, {G3}, {D4}, $84, {G3}, $80, {G3}, {D4}
db $88, {G4}


S6_N:
db $B0, $10, $01, $02, $02, $10, $01, $02, $02
db $10, $02, $02, $02, $10, $01, $02, $02
db $10, $01, $02, $02, $10, $01, $02, $02
db $10, $02, $02, $02, $10, $01, $02, $02
db $10, $01, $02, $02, $10, $01, $02, $02
db $10, $02, $02, $02, $10, $01, $02, $02
db $10, $01, $02, $02, $10, $01, $02, $02
db $10, $01, $01, $01