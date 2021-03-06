    processor 6502
    include "vcs.h"
    include "macro.h"

    seg code
    org $F000      ; Defines origin of the ROM at $F000

START:
    CLEAN_START     ; Macro to safely clear the memory


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
:;  Set Background Luminosity Color to Yellow   ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

    lda #$1E        ; Load color into A ($1E is NTSC yellow)
    sta COLUBK      ; Store A to BackgroundColor Address $09

    jmp START       ; Repeat from START

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
:;  Fill ROM size to exactly 4KB                ;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    org $FFFC       ; Defines origin to $FFFC
    .word START     ; Reset vector at $FFFC (where the program starts)
    .word START     ; Interrupt vector at $FFFE (unused in the VCS)