arch nes.cpu

// Continuing after a game over will start you at the
// beginning of the current level instead of the first
// level of the current world.

// Apply after editing with SMB2Edit.
// If you aren't using SMB2Edit, replace the addresses below
// with the unedited addresses.

// Edit the number of lives each continue starts with.
define lives      $03

// Edit the number of continues available.
define continues  $02


define ExtraLives $04ED
define Continues $05C5

org $03E41F        // $01E41F (unedited)
LDA #{continues}
STA {Continues}
JMP $ED4D
NOP #2

org $03ED5D        // $01ED5D (unedited)
LDA #{lives}
STA {ExtraLives}
JMP $E425