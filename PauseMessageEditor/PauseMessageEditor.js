
function importMessage() {
    const file = document.getElementById('import').files[0];
    
    if (file) {
        const fr = new FileReader();
        fr.readAsText(file);
        fr.addEventListener('loadend', loadMessageFromFile);
    }
}

function loadMessageFromFile(e) {
    const fr = e.target;
    var result = fr.result;
    state.messages = JSON.parse(result.match(/messages:(.*)$/)[1]);
    loadMessage();
    updateCount();
}

function updateText() {
    state.messages[state.current] = document.getElementById('message').value;
    
    updateCount();
    redrawPreview();
}

function updateCount() {
    var code = generateMessageCode();
    var count = code.code.length;
    var warning = '';
    if (count > 8748) {
        warning = ' Warning: Total message length exceeds available space. You can still export your .asm file to save your messages, but you will be unable to insert into your rom until you reduce the total size.';
    }
    document.getElementById('count').innerHTML = `${count}/8748` + warning;
}

function loadMessage() {
    state.level = parseInt(document.getElementById('level').value);
    state.area = parseInt(document.getElementById('area').value);
    state.current = state.level * 10 + state.area;
    
    var message = state.messages[state.current];
    if (message === undefined) {
        message = state.messages[state.current] = "";
    }
    
    document.getElementById('message').value = message;
    
    redrawPreview();    
}


function placeTile(x, y, tile) {
    var xpos = x*tileWidth;
    var ypos = y*tileHeight;
    
    var xs = tile%16;
    var ys = Math.floor((tile)/16);
    
    var xspos = xs*tileWidth;
    var yspos = ys*tileHeight;
    
    context.clearRect(xpos, ypos, tileWidth, tileHeight);
    context.drawImage(tiles, xspos, yspos, tileWidth, tileHeight, xpos, ypos, tileWidth, tileHeight);
}

function redrawPreview() {
    context.drawImage(image, 0, 0, previewWidth, previewHeight, 0, 0, previewWidth, previewHeight);
    
    var message = state.messages[state.current].toUpperCase();
    
    placeTile(18, 5, alphabet[Math.floor(state.level/3)+1]);
    placeTile(20, 5, alphabet[state.level%3+1]);
    
    var x = 6;
    var y = 9;
    
    for (var i=0; i<message.length; i++) {
        var chr = message[i];
        if (chr=='\n') {
            x = 6;
            y++;
            if (y>19) break;
            continue;
        }
        if (chr=='\\' && i+2<message.length && x<26) {
            var chr1 = message[i+1];
            var chr2 = message[i+2];
            i += 2;
            chr = parseInt(chr1+chr2, 16);
            placeTile(x,y,chr);
            x++;
        }
        if (chr in alphabet) {
            if (x<26) {
                placeTile(x,y,alphabet[chr]);
            }
            x++;
        }
    }
}

function newState() {
    var messages = []
    return {
        messages: messages,
        current: 0,
        level: 0,
        area: 0
    }
}

function populateSelects() {
    var select = document.getElementById('level');
    for (var i in levels) {
        var opt = document.createElement('option');
        opt.value = i;
        opt.innerHTML = levels[i];
        select.appendChild(opt);
    }
    
    var select = document.getElementById('area');
    for (var i in areas) {
        var opt = document.createElement('option');
        opt.value = i;
        opt.innerHTML = areas[i];
        select.appendChild(opt);
    }
}

var levels = {
    0: "1-1",
    1: "1-2",
    2: "1-3",
    3: "2-1",
    4: "2-2",
    5: "2-3",
    6: "3-1",
    7: "3-2",
    8: "3-3",
    9: "4-1",
    10: "4-2",
    11: "4-3",
    12: "5-1",
    13: "5-2",
    14: "5-3",
    15: "6-1",
    16: "6-2",
    17: "6-3",
    18: "7-1",
    19: "7-2",
}

var areas = {
    0: "Area 0",
    1: "Area 1",
    2: "Area 2",
    3: "Area 3",
    4: "Area 4",
    5: "Area 5",
    6: "Area 6",
    7: "Area 7",
    8: "Area 8",
    9: "Area 9"
}


var alphabet = {
    '0': 208,
    '1': 209,
    '2': 210,
    '3': 211,
    '4': 212,
    '5': 213,
    '6': 214,
    '7': 215,
    '8': 216,
    '9': 217,
    'A': 218,
    'B': 219,
    'C': 220,
    'D': 221,
    'E': 222,
    'F': 223,
    'G': 224,
    'H': 225,
    'I': 226,
    'J': 227,
    'K': 228,
    'L': 229,
    'M': 230,
    'N': 231,
    'O': 232,
    'P': 233,
    'Q': 234,
    'R': 235,
    'S': 236,
    'T': 237,
    'U': 238,
    'V': 239,
    'W': 240,
    'X': 241,
    'Y': 242,
    'Z': 243,
    '?': 247,
    '.': 248,
    ' ': 251 
}

function generateMessageCode() {
    var code = [];
    var offsets = [];
    var offset = 0;
    var position;
        
    for (var i=0; i<200; i++){
        offsets[i] = offset + 40402; //$9DD2
        var message = state.messages[i];
        if (message === undefined || message === null) {
            message = "";
        }
        message = message.toUpperCase();
        
        var y = 9;
        
        var lines = message.split(/\n/);
        var nlines = Math.min(lines.length, 11);
        for (var j=0; j<nlines; j++) {
            var line = lines[j];
            var bytes = [];
            var x = 6;
            
            for (var k=0; k<line.length; k++) {
                var chr = line[k];
                if (chr == '\\' && k+2 < line.length) {
                    var chr1 = line[k+1];
                    var chr2 = line[k+2];
                    k += 2;
                    chr = parseInt(chr1+chr2, 16);
                    bytes.push(chr);    
                }
                if (chr in alphabet) {
                    bytes.push(alphabet[chr]);
                }
            }
            
            
            var nchars = Math.min(bytes.length, 20);
            
            if (nchars > 0) {
                position = y*32 + x + 9248; //$2420
                code.push( Math.floor(position/256), position%256, nchars);
                
                for (var k=0; k<nchars; k++) {
                    code.push(bytes[k]);
                }
            }
            y++;
        }
        offset = code.push(0);        
    }
    return {
        code: code,
        offsets: offsets
    }
}

function generateMessageData() {
    var messageCode = generateMessageCode();
    var code = messageCode.code;
    var offsets = messageCode.offsets;
    
    var data = `
org $00DC53
db `;

    for (var i=0; i<200; i++) {
        data += '$' + (offsets[i]%256).toString(16) + ',';
    }
    for (var i=0; i<200; i++) {
        data += '$' + Math.floor(offsets[i]/256).toString(16) + ',';
    }
    data += "$00"; //just using up that last comma

    data += `
org $00DDE3
db `
    for (var i=0; i<code.length; i++) {
        data += '$' + (code[i]).toString(16) + ',';
    }
    data += "$00\n"; //just using up that last comma

    data += "warnpc $010011\n"

    data += "//messages:" + JSON.stringify(state.messages);

    return data;
}

function exportAsm() {
    var text = mainAsm + generateMessageData();
    var filename = "PauseMessages.asm";

    var element = document.createElement('a');
    element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
    element.setAttribute('download', filename);

    element.style.display = 'none';
    document.body.appendChild(element);

    element.click();

    document.body.removeChild(element);
}

var mainAsm = `arch nes.cpu

define CurrentLevel $0531
define CurrentLevelArea $0532
define PRGBank_0_1 $00
define PRGBank_6_7 $03
define ChangeMappedPRGBank $FF85
define ScreenUpdateBuffer_PauseText $0D
define CardScreenUpdateIndex $05BD
define ScreenUpdateIndex $11
define WaitForNMI_TurnOffPPU $EAA3



// disable blinking
org $03E556
NOP
NOP


// move PauseExtraLife textbuffer
org $03DC3C
db $00, $07

// move TitleCardLeftover buffer
org $03DC3A
db $08, $FC

// repurpose PauseText buffer
org $03DC2A
db $2E, $FC

org $03E525
JSR $EEDE

org $03EEEE



LDA #{PRGBank_6_7}
JSR {ChangeMappedPRGBank}
JSR $99B8
LDA #{PRGBank_0_1}
JSR {ChangeMappedPRGBank}

JSR $E9E5

LDA #{ScreenUpdateBuffer_PauseText}
STA {ScreenUpdateIndex}
JSR {WaitForNMI_TurnOffPPU}

RTS


org $00D9C8
LDA {CurrentLevel}
ASL
ASL
CLC
ADC {CurrentLevel}
ASL        ;// CurrentLevel * 10
CLC
ADC {CurrentLevelArea}
TAY
LDA $9C43,y
STA $00 
LDA $9D0B,y
STA $01


LDY #$FF
- 
LDA ($00),y
STA $0700-1,y
DEY
BNE -



RTS

warnpc $00DA80

// freespace $03FC18
org $03FC18

db $27, $D0, $10
  db $44, $BF, $AF, $AF, $AF, $AF, $EF, $11, $44, $FF, $FF, $FF, $FF, $FF, $FF, $11 

db $27, $E0, $10

db $44, $FF, $FF, $FF, $FF, $FF, $FF, $11, $44, $FF, $FF, $FF, $FF, $FF, $AF, $11

// fall-through
///////////
// $03FC2E

db $20, $1F, $DE, $FF

db $23, $C7, $01, $00
db $23, $CF, $01, $00
db $23, $D7, $01, $00
db $23, $DF, $01, $00
db $23, $E7, $01, $00
db $23, $EF, $01, $00
db $23, $F7, $01, $00
db $23, $FF, $01, $00

db $00
///////////




org $03DE8A

db $23, $C0, $09
db $3E, $0E, $0E, $0E, $0E, $0E, $0E, $8E, $32

db $23, $CF, $01, $8C

db $23, $D0, $10
db $32, $00, $A0, $A0, $A0, $20, $00, $8C, $32, $00, $00, $0A, $02, $00, $00, $8C

db $23, $E0, $09
db $32, $00, $00, $0E, $00, $00, $00, $8C, $32

db $23, $EF, $01, $8C

db $23, $F0, $06
db $32, $00, $A0, $A0, $A0, $A0

db $23, $F7, $09
db $8C, $0E, $0E, $0E, $0E, $0E, $0E, $0E, $0E

db $24, $00, $60, $FF
db $24, $20, $60, $FF
db $24, $40, $60, $FF
db $24, $60, $60, $FF
db $27, $40, $60, $FF
db $27, $60, $60, $FF
db $27, $80, $60, $FF
db $27, $A0, $60, $FF
db $24, $80, $D6, $FF
db $24, $81, $D6, $FF
db $24, $82, $D6, $FF
db $24, $9D, $D6, $FF
db $24, $9E, $D6, $FF
db $24, $9F, $D6, $FF
db $24, $83, $01, $D0
db $24, $9C, $01, $D8
db $24, $84, $58, $FB
db $24, $A3, $D4, $D1
db $24, $BC, $D4, $D7
db $24, $A4, $58, $FB
db $24, $C4, $58, $FB
db $24, $E4, $58, $FB
db $25, $04, $58, $FB
db $25, $24, $58, $FB
db $25, $44, $58, $FB
db $25, $64, $58, $FB
db $25, $84, $58, $FB
db $25, $A4, $58, $FB
db $25, $C4, $58, $FB
db $25, $E4, $58, $FB
db $26, $04, $58, $FB
db $26, $24, $58, $FB
db $26, $44, $58, $FB
db $26, $64, $58, $FB
db $26, $84, $58, $FB
db $26, $A4, $58, $FB
db $26, $C4, $58, $FB
db $26, $E4, $58, $FB
db $27, $23, $01, $D2
db $27, $3C, $01, $D6
db $27, $24, $58, $D3


db $27, $C8, $08
db $44, $FF, $BF, $AF, $AF, $AF, $FF, $11

db $27, $D0, $10
db $44, $AA, $AA, $AF, $AF, $AA, $AA, $11, $44, $AA, $AA, $AA, $AA, $AA, $AA, $11

db $27, $E0, $10
db $44, $AA, $AA, $AA, $AA, $AA, $AA, $11, $44, $AA, $AA, $AA, $AA, $AA, $AA, $11

db $27, $F0, $08
db $44, $05, $05, $05, $05, $05, $05, $01

db $27, $04, $58, $FB

db $00


`