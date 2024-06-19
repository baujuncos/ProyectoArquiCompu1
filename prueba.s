.global parpadeoAlternado
.global olaOceanica

.extern disp_binary
.extern delay

.section .data
speed4: .word 500000
tablaAlternado: .byte 0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55, 0xAA, 0x55
tablaOla: .byte 0x01, 0x03, 0x07, 0x0F, 0x1F, 0x3F, 0x7F, 0xFF, 0xFE, 0xFC, 0xF8, 0xF0, 0xE0, 0xC0, 0x80, 0x00

.section .text

parpadeoAlternado:
    PUSH {R4, R5, R6, R7, LR}

resetP:
    LDR R4, =tablaAlternado   
    MOV R5, #0         
    MOV R6, #16        
    LDR R0, =speed4     
    LDR R1, [R0]        
    MOV R7, #5          

loopP:
    LDRB R0, [R4, R5]   
    BL disp_binary      
    MOV R0, R1          
    BL delay            

    ADD R5, R5, #1      
    CMP R5, R6         
    BEQ resetP          

    SUBS R7, R7, #1
    BEQ resetP

    B loopP             

end_loopP:
    MOV R0, #0x00
    BL disp_binary

    POP {R4, R5, R6, R7, PC}

olaOceanica:
    PUSH {R4, R5, R6, R7, LR}

resetO:
    LDR R4, =tablaOla      
    MOV R5, #0         
    MOV R6, #16        
    LDR R0, =speed4     
    LDR R1, [R0]        
    MOV R7, #5          

loopO:
         
    LDRB R0, [R4, R5]   
    BL disp_binary      
    MOV R0, R1          
    BL delay            

    ADD R5, R5, #1      
    CMP R5, R6         
    BEQ resetO          

    SUBS R7, R7, #1
    BEQ resetO

    B loopO             

end_loopO:
    MOV R0, #0x00
    BL disp_binary

    POP {R4, R5, R6, R7, PC}
.END

