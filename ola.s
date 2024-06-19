.text
.global OlaOceanica
OlaOceanica:
    STMFD   SP!, {r0, r4, r5, r6, LR}
    LDR     r5, =tabla
    MOV     r6, #0
    
ForOlaOceanica:
    LDRB    r4, [r5, r6]
    ADD     r6, r6, #1
    CMP     r6, #9
    BNE     ForOlaOceanica
    BL      Termino

Termino:
    LDMFD   SP!, {r0, r4, r5, r6, LR}
    MOV     PC, LR

tabla:
    .byte 0x80
    .byte 0xA0
    .byte 0xC0
    .byte 0xE0
    .byte 0xF0
    .byte 0xE0
    .byte 0xC0
    .byte 0xA0
    .byte 0x80