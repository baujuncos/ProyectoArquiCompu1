.extern disp_binary
.extern delay

.text 


.global parpadeoAlternado
parpadeoAlternado:
    push {r0, r1,r2,r3, lr}

    mov r2, #0xAA      
    mov r3, #0x55      

loop:
    
    mov r0, r2
    bl disp_binary
    
    mov r0, r1
    bl delay

    mov r0, r3
    bl disp_binary
    mov r0, r1
    bl delay


    pop {r0, r1,r2,r3,  pc}





.global olaOceanica

olaOceanica:
    PUSH {R4, R5, R6, LR}

reset1:
    LDR R4, =tabla      
    MOV R5, #0         
    MOV R6, #16         
    LDR R0, =speed4     
    LDR R1, [R0]        

    LDRB R0, [R4, R5]   
    BL disp_binary      
    MOV R0, R1          
    BL delay            

    ADD R5, R5, #1      
    
    MOV R0, #0x00
    BL disp_binary

.data
tabla: .byte 0x80, 0xC0, 0xE0, 0xF0, 0xF8, 0xFC, 0xFE, 0xFF, 0x7F, 0x3F, 0x1F, 0x0F, 0x07, 0x03, 0x01, 0x00
speed4: .word 500000


    POP {R4, R5, R6, R7, PC}
    bx lr




