.extern disp_binary
.extern delay
.extern kbhit
.extern getch

.text 
.global parpadeoAlternado

.data
speed: .word 500000

.text
parpadeoAlternado:
    push {r4, r5, r6, r7, lr}

    ldr r0, =speed
    ldr r1, [r0]       
    mov r2, #0xAA      
    mov r3, #0x55      

loop:
    bl kbhit
    cmp r0, #0
    bne continue_loop

    bl getch
    cmp r0, #'e'
    beq end_loop

continue_loop:
    mov r0, r2
    bl disp_binary
    mov r0, r1
    bl delay

    mov r0, r3
    bl disp_binary
    mov r0, r1
    bl delay

    b loop

end_loop:
    mov r0, #0x00
    bl disp_binary

    pop {r4, r5, r6, r7, lr}
    bx lr
.section .note.GNU-stack

