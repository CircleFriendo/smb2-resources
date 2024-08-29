arch nes.cpu

//; Item carry heights

define MarioBig $FFFA
define PeachBig $FFF6
define ToadBig  $FFFC
define LuigiBig $FFF7

define MarioSmall $0002
define PeachSmall $FFFE
define ToadSmall  $0004
define LuigiSmall $FFFF


org $004010

db {MarioBig}, {PeachBig}, {ToadBig}, {LuigiBig}
db {MarioBig}>>8, {PeachBig}>>8, {ToadBig}>>8, {LuigiBig}>>8

db {MarioSmall}, {PeachSmall}, {ToadSmall}, {LuigiSmall}
db {MarioSmall}>>8, {PeachSmall}>>8, {ToadSmall}>>8, {LuigiSmall}>>8
