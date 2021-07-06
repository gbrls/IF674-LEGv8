qst7:
	sub sp, sp, #0x100    // alocando memoria na pilha
    mov x1,  #1
    mov x2,  #2
    mov x3,  #3
    mov x4,  #4
    mov x5,  #5
    mov x8,  #8
    mov x10, #10

    mov x11, sp

    sturb w1, [sp, 'A']
    sturb w1, [sp, 'E']
    sturb w1, [sp, 'I']
    sturb w1, [sp, 'O']
    sturb w1, [sp, 'U']
    sturb w1, [sp, 'N']
    sturb w1, [sp, 'R']
    sturb w1, [sp, 'S']

    sturb w2, [sp, 'D']
    sturb w2, [sp, 'G']
    sturb w2, [sp, 'T']

    sturb w3, [sp, 'B']
    sturb w3, [sp, 'C']
    sturb w3, [sp, 'M']
    sturb w3, [sp, 'P']

    sturb w4, [sp, 'F']
    sturb w4, [sp, 'H']
    sturb w4, [sp, 'V']
    sturb w4, [sp, 'W']
    sturb w4, [sp, 'Y']

    sturb w5, [sp, 'K']

    sturb w8, [sp, 'J']
    sturb w8, [sp, 'L']
    sturb w8, [sp, 'X']

    sturb w10, [sp, 'Q']
    sturb w10, [sp, 'Z']

    eor x3, x3, x3

    loop_start2:
        ldurb w1, [x0, #0]
        cbz x1, loop_end2

        add x0, x0, #1

        add x4, x1, x11
        ldurb w4, [x4, #0]
        add x3, x3, x4

        b loop_start2
    loop_end2:

	add sp, sp, #0x100    // desalocando memoria da pilha

    mov x0, x3

    br x30
