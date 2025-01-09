// xkas-plus
// https://github.com/devinacker/xkas-plus

// author: CircleFriendo
// title: Luna Ascension
// source: Tower of Heaven

// Replace the Overworld music with "Luna Ascension" from Tower of Heaven

arch nes.cpu

define tuning -2

define C2 $00+{tuning}
define D2 $04+{tuning}
define E2 $08+{tuning}
define F2 $0A+{tuning}
define G2 $0E+{tuning}
define A2 $12+{tuning}
define B2 $16+{tuning}
define C3 $18+{tuning}
define D3 $1C+{tuning}
define E3 $20+{tuning}
define F3 $22+{tuning}
define G3 $26+{tuning}
define A3 $2A+{tuning}
define B3 $2E+{tuning}
define C4 $30+{tuning}
define D4 $34+{tuning}
define E4 $38+{tuning}
define F4 $3A+{tuning}
define G4 $3E+{tuning}
define A4 $42+{tuning}
define B4 $46+{tuning}
define C5 $48+{tuning}
define D5 $4C+{tuning}
define E5 $50+{tuning}
define F5 $52+{tuning}
define G5 $56+{tuning}
define A5 $5A+{tuning}
define B5 $5E+{tuning}
define C6 $60+{tuning}
define D6 $64+{tuning}
define E6 $68+{tuning}
define F6 $6A+{tuning}
define G6 $6E+{tuning}
define A6 $72+{tuning}
define B6 $76+{tuning}
define C7 $78+{tuning}
define D7 $7C+{tuning}

define R $7E


define timbre $00
define short $10

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

db $6E ; dw S1-{offset} ; db S1_T-S1, S1_SQ-S1, S1_N-S1  // Overworld 1  Luna Ascension
db $6E ; dw S2-{offset} ; db S2_T-S2, S2_SQ-S2, S2_N-S2  // Overworld 2
db $6E ; dw S3-{offset} ; db S3_T-S3, S3_SQ-S3, S3_N-S3  // Overworld 3
db $6E ; dw S4-{offset} ; db S4_T-S4, S4_SQ-S4, S4_N-S4  // Overworld 4
db $6E ; dw S5-{offset} ; db S5_T-S5, S5_SQ-S5, S5_N-S5  // Overworld 5
db $0D ; dw S6-{offset} ; db S6_T-S6, S6_SQ-S6, S6_N-S6  // Overworld 6



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
db $10  // Overworld
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
db {eighth}, {C5}+2, {E5}, {F5}+2, {quarter}, {B5}, {eighth}, {E5}, {quarterdotted}, {F5}+2
db {eighth}, {B4}, {D5}+2, {quarter}, {E5}, {eighth}, {F5}+2, {D5}+2, {B4}
db {quarterdotted}, {D5}+2, {C5}+2, {whole}, {G4}+2, {sixteenth}, {B4}, {D5}+2, {F5}+2, {B5}
db {quarterdotted}, {D6}+2, {C6}+2, {quarter}, {G6}+2
db {F6}+2, {eighth}, {B6}, {quarter}, {D6}+2, {E6}, {eighth}, {F6}+2
db {eighthdotted},  {D6}+2, {E6}, {eighth}, {D6}+2, {eighthdotted},  {B5}, {D6}+2
db {whole}, {C6}+2, {eighth}, {R}

db $00   // 55 bytes

S1_SQ:
db {whole}, {A2}, {G2}+2, {C3}+2, {B2}        // low notes

db {sixteenth}, {A3}, {C4}+2, {E4}, {G4}+2
db {A4}, {C5}+2, {E5}, {G5}+2
db {C4}+2, {E4}, {G4}+2, {A4}
db {C5}+2, {E5}, {G5}+2, {A5}

db {G3}+2, {B3}, {D4}+2, {F4}+2
db {G4}+2, {B4}, {D5}+2, {F5}+2
db {B3}, {D4}+2, {F4}+2, {G4}+2
db {B4}, {D5}+2, {F5}+2, {G5}+2

db {eighthdotted}, {C3}+2, {F2}+2, {eighth}, {G2}+2 
db {eighthdotted}, {C3}+2, {F3}+2, {eighth}, {G3}+2

db {sixteenth}, {C5}+2, {G4}+2, {D4}+2, {C4}+2
db {G4}+2, {D4}+2, {C4}+2, {G3}+2 
db {D4}+2, {C4}+2, {G3}+2, {D3}+2
db {C4}+2, {G3}+2, {D3}+2, {C3}+2

S1_T:
db {whole}, {A2}, {G2}+2, {C3}+2, {B2}       // low notes

db {eighthdotted}, {A3}, {A3}, {A3}, {A3}, {A3}, {sixteenth}, {A3}
db {eighthdotted}, {G3}, {G3}, {G3}, {G3}, {G3}, {sixteenth}, {G3}

db {eighthdotted}, {C3}+2, {F2}+2, {eighth}, {G2}+2 
db {eighthdotted}, {C3}+2, {F3}+2, {eighth}, {G3}+2

db {whole}, {R}

S1_N:
db {sixteenth}
db $08, $08, $08, $08,  $08, $08, $08, $08,  $08, $08, $06, $08,  $08, $08, $08, $08
db $08, $08, $08, $08,  $06, $08, $08, $08,  $08, $08, $06, $08,  $08, $08, $06, $08

db $00


S2:
db {quarterdotted}, {D5}+2, {half}, {C5}+2, {eighth}, {R}
db {quarterdotted}, {E5}, {D5}+2, {quarter}, {F5}+2
db {half}, {B4}, {eighth}, {R}, {quarter}, {F4}+2, {E4}
db {eighth}, {D4}+2, {E4}, {half}, {B4}, {eighth}, {R}

db $00  

S2_SQ:
db {sixteenth}, {G3}+2, {C4}+2, {E4}, {G4}+2
db {A4}, {C5}+2, {E5}, {G5}+2
db {C6}+2, {B5}, {E5}, {C5}+2
db {A4}, {G4}+2, {E4}, {C4}+2

db {B3}, {D4}+2, {F4}+2, {B4}
db {D5}+2, {F5}+2, {B5}, {C6}+2
db {D6}+2, {C6}+2, {B5}, {F5}+2
db {D5}+2, {B4}, {F4}+2, {D4}+2

db {G4}+2, {B4}, {D5}+2, {F5}+2
db {G5}+2, {B5}, {D6}+2, {F6}+2
db {G6}+2, {F6}+2, {D6}+2, {B5}
db {G5}+2, {F5}+2, {D5}+2, {B4}

db {C5}+2, {E5}, {G5}+2, {B5}
db {D6}+2, {F6}+2, {B6}, {D7}+2        //high notes
db {R}, {D5}+2, {F5}+2, {B5}
db {D6}+2, {F6}+2, {B6}, {D7}+2        //high notes

S2_T:
db {eighth}, {A3}, {eighthdotted}, {E4}, {E4}, {E4}, {E4}, {eighth}, {E4}
db {eighth}, {A3}, {eighthdotted}, {E4}, {E4}, {E4}, {E4}, {eighth}, {E4}

db {eighth}, {G3}+2, {eighthdotted}, {D4}+2, {D4}+2, {D4}+2, {D4}+2, {eighth}, {D4}+2
db {eighth}, {C4}+2, {eighthdotted}, {G4}+2, {G4}+2, {F4}+2, {F4}+2, {eighth}, {F4}+2

S2_N:
db {sixteenth}
db $04, $08, $08, $08,  $10, $08, $08, $08,  $08, $10, $08, $08,  $10, $08, $08, $10

db $00

S3:
db {quarterdotted}, {D5}+2, {C5}+2, {eighth}, {F5}+2, {quarterdotted}, {B5}
db {eighth}, {G5}+2, {half}, {D6}+2, {sixteenth}, {C6}+2, {B5}
db {quarterdotted}, {F6}+2, {half}, {D6}+2, {eighth}, {R}
db {quarterdotted}, {B6}, {G6}+2, {quarter}, {B6}

db $00

S3_SQ:
db {sixteenth}, {G3}+2, {C4}+2, {E4}, {G4}+2
db {A4}, {C5}+2, {E5}, {G5}+2
db {C6}+2, {B5}, {E5}, {C5}+2
db {A4}, {G4}+2, {E4}, {C4}+2

db {B3}, {D4}+2, {F4}+2, {B4}
db {D5}+2, {F5}+2, {B5}, {C6}+2
db {D6}+2, {C6}+2, {B5}, {F5}+2
db {D5}+2, {B4}, {F4}+2, {D4}+2

db {G4}+2, {C5}+2, {D5}+2, {F5}+2
db {B5}, {C6}+2, {D6}+2, {F6}+2
db {B6}, {F6}+2, {D6}+2, {C6}+2
db {B5}, {F5}+2, {D5}+2, {C5}+2

db {B4}, {D5}+2, {F5}+2, {B5}
db {D6}+2, {F6}+2, {B6}, {D7}+2         //high notes
db {F6}+2, {D7}+2, {B6}, {F6}+2   // F7
db {D6}+2, {B5}, {F5}+2, {D5}+2      

S3_T:
db {eighth}, {A3}, {eighthdotted}, {E4}, {E4}, {E4}, {E4}, {eighth}, {E4}
db {eighth}, {A3}, {eighthdotted}, {E4}, {E4}, {E4}, {E4}, {eighth}, {E4}

db {eighth}, {C4}+2, {eighthdotted}, {G4}+2, {G4}+2, {G4}+2, {G4}+2, {eighth}, {G4}+2
db {eighth}, {B3}, {eighthdotted}, {F4}+2, {F4}+2, {F4}+2, {F4}+2, {eighth}, {F4}+2

S3_N:
db {sixteenth}
db $04, $08, $08, $08,  $10, $08, $08, $08,  $08, $10, $08, $08,  $10, $08, $08, $10

db $00

S4:
db {whole}, {C7}+2, {C7}+2           

db {sixteenth}, {C5}+2, {E5}, {G5}+2, {B5}
db {C6}+2, {E6}, {G6}+2, {B6}
db {C7}+2, {B6}, {G6}+2, {E6}
db {C6}+2, {B5}, {G5}+2, {E5}

db {C5}+2, {F5}+2, {G5}+2, {B5}
db {C6}+2, {F6}+2, {G6}+2, {B6}
db {C7}+2, {B6}, {G6}+2, {F6}+2
db {C6}+2, {B5}, {G5}+2, {F5}+2

db $00

S4_SQ:
db {eighth}+{short}, {R}, {C5}+2, {sixteenth}+{short}, {C5}+2, {C5}+2, {R}, {C5}+2
db {R}, {C5}+2, {C5}+2, {R}, {eighth}+{short}, {B4}, {C5}+2

db {eighth}+{short}, {R}, {C5}+2, {sixteenth}+{short}, {C5}+2, {C5}+2, {R}, {C5}+2
db {R}, {C5}+2, {C5}+2, {R}, {B4}, {C5}+2, {R}, {C5}+2

db {eighth}+{short}, {R}, {C5}+2, {sixteenth}+{short}, {C5}+2, {C5}+2, {R}, {C5}+2
db {R}, {C5}+2, {C5}+2, {R}, {eighth}+{short}, {B4}, {C5}+2

db {eighth}+{short}, {R}, {C5}+2, {sixteenth}+{short}, {C5}+2, {C5}+2, {R}, {C5}+2
db {R}, {C5}+2, {C5}+2, {R}, {eighth}+{short}, {B4}, {C5}+2

S4_T:
db {sixteenth}
db {A3}, {A3}, {A4}, {A3}, {A3}, {A3}, {A4}, {A3}, {A3}, {A3}, {A4}, {A3}, {A3}, {A3}, {A4}, {A3}
db {B3}, {B3}, {B4}, {B3}, {B3}, {B3}, {B4}, {B3}, {B3}, {B3}, {B4}, {B3}, {B3}, {B3}, {B4}, {B3}
db {C4}, {C4}, {C5}, {C4}, {C4}, {C4}, {C5}, {C4}, {C4}, {C4}, {C5}, {C4}, {C4}, {C4}, {C5}, {C4}
db {G3}, {G3}, {G4}, {G3}, {G3}, {G3}, {G4}, {G3}, {G3}, {G3}, {G4}, {G3}, {G3}, {G3}, {G4}, {G3}

S4_N:
db {sixteenth}
db $04, $08, $08, $08,  $10, $08, $08, $08,  $08, $10, $08, $08,  $10, $08, $08, $10

db $00


S5:
db {whole}, {C7}+2, {C7}+2

db {sixteenth}, {B3}, {F4}+2, {B4}, {C5}+2
db {D5}+2, {B4}, {F5}+2, {D5}+2
db {B5}, {F5}+2, {D6}+2, {B5}
db {F6}+2, {D6}+2, {B6}, {F6}+2



db $00

S5_SQ:
db {eighth}+{short}, {R}, {C5}+2, {sixteenth}+{short}, {C5}+2, {C5}+2, {R}, {C5}+2
db {R}, {C5}+2, {C5}+2, {R}, {eighth}+{short}, {B4}, {C5}+2

db {eighth}+{short}, {R}, {C5}+2, {sixteenth}+{short}, {C5}+2, {C5}+2, {R}, {C5}+2
db {R}, {C5}+2, {C5}+2, {R}, {B4}, {C5}+2, {R}, {C5}+2

db {quarterdotted}, {C4}+2, {sixteenth}+{short}, {R}, {C5}+2
db {R}, {C5}+2, {C5}+2, {R}, {eighth}+{short}, {B4}, {C5}+2



S5_T:
db {sixteenth}
db {A3}, {A3}, {A4}, {A3}, {A3}, {A3}, {A4}, {A3}, {A3}, {A3}, {A4}, {A3}, {A3}, {A3}, {A4}, {A3}
db {B3}, {B3}, {B4}, {B3}, {B3}, {B3}, {B4}, {B3}, {B3}, {B3}, {B4}, {B3}, {B3}, {B3}, {B4}, {B3}

db {whole}, {C4}+2

S5_N:
db {sixteenth}
db $04, $08, $08, $08,  $10, $08, $08, $08,  $08, $10, $08, $08,  $10, $08, $08, $10

db $00


S6:
db {whole}, {D7}+2
db {sixteenth}, {R}, {D7}+2, {D7}, {C7}+2, {C7}, {B6}, {A6}+2, {A6} 
db {G6}+2, {G6}, {F6}+2, {F6}, {E6}, {D6}+2, {D6}, {C6}+2

db $00

S6_SQ:
db {whole}, {R}, {R}

S6_T:
db {whole}, {C3}+2, {R}

S6_N:
db {eighth}

db $06, $01, $01, $01,  $06, $01, $01, $10,  $10, $01, $10, $01,  $10, $10, $10, $10
db $00