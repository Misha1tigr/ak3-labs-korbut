.global lab2
.syntax unified

// Define a, b, c
#define A #7
#define B #5
#define C #-3

// {a * b / c, c > 0; ((a + b) << 3), c = 0; a & b + c,  c < 0}

lab2:
    push {lr}   // Save registers and return address

    mov r0, A
    mov r1, B
    mov r2, C

    cmp r2, #0
    bgt compute_1  // if c > 0
    beq compute_2   // if c == 0
    blt compute_3  // if c < 0

compute_1:
    mul r4, r0, r1      // r4 = a * b
    udiv r3, r4, r2     // r3 = r4 / c
    b done

compute_2:
    add r4, r0, r1      // r4 = a + b
    lsl r3, r4, #3      // r3 = r4 << 3
    b done

compute_3:
    and r4, r0, r1      // r4 = a & b
    add r3, r4, r2      // r3 = r4 + c
    b done

done:
    pop {pc}    // Return

