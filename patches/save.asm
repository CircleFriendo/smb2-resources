// xkas-plus
// https://github.com/devinacker/xkas-plus

// author: CircleFriendo

arch nes.cpu

define CurrentLevelInit      $04E7
define CurrentLevel          $0531
define CurrentWorld          $0635

define SaveArea          $6960
define SaveCurrentLevel  $6960
define SaveCurrentWorld  $6961

// Add save to the iNES header
org $000006
db $42 

org $01E419
    JSR Load-$010010  // $FB56
    JMP $E425

org $01E469
    JSR Save-$010010  // $FB36



// freecode
org $01FB46
Save:
    LDA {CurrentLevel}
    STA {SaveCurrentLevel}
    LDA {CurrentWorld}
    STA {SaveCurrentWorld}
    
    JSR $F754
    RTS


//org $01FB66
Load:
    JSR $9A3D
    INC $06F3
    LDA #$02
    STA $05C5
    LDA #$03
    STA $04ED
    
    LDA {SaveCurrentLevel}
    STA {CurrentLevel}
    STA {CurrentLevelInit}
    LDA {SaveCurrentWorld}
    STA {CurrentWorld}    

    RTS
