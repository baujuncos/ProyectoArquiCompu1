.global olaOceanica

olaOceanica:
    PUSH {R4, R5, R6, R7, LR}

resetO:
    LDR R4, =tabla      
    MOV R5, #0         
    MOV R6, #16         
    LDR R0, =speed4     
    LDR R1, [R0]        
    MOV R7, #5          

loopO:
    BL kbhit
    CMP R0, #0          
    BEQ no_key_pressed

    BL getch
    CMP R0, #'e'        
    BEQ end_loop        

no_key_pressed:
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

end_loop:
    MOV R0, #0x00
    BL disp_binary

.data
tabla: .byte 0x80, 0xC0, 0xE0, 0xF0, 0xF8, 0xFC, 0xFE, 0xFF, 0x7F, 0x3F, 0x1F, 0x0F, 0x07, 0x03, 0x01, 0x00
speed4: .word 500000


    POP {R4, R5, R6, R7, PC}
.END

