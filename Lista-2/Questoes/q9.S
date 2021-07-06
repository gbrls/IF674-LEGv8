div:
    eor x2, x2, x2
    cbz x1, div_end // avoiding division by 0
    div_start:

        subs x3, x0, x1
        b.mi div_end

        subs x0, x0, x1
        add x2, x2, #1

        b div_start
    div_end:

    mov x0, x2

    br x30

min:
    subs x2, x0, x1
    b.mi min_b
    mov x0, x1
    min_b:
    br x30

qst9:
	sub sp, sp, #0x300    // alocando dois vetores de frequencia

    mov x10, 0
    mov x8, 0
    mov x12, x1
    mov x17, x30

    memset_start:
    subs x9, x10, #0x300
    b.pl memset_end

        add x7, sp, x10

        add x10, x10, #1
        sturb w8, [x7, #0]

    b memset_start
    memset_end:

    // setando o primeiro vetor de frequencia
    loop_start8:
        ldurb w1, [x0, #0]
        cbz x1, loop_end8

        add x0, x0, #1

        add x7, sp, x1

        // sp[x1]++
        ldurb w8, [x7, #0]
        add x8, x8, #1
        sturb w8, [x7, #0]

        b loop_start8
    loop_end8:
    mov x0, x12
    // setando o segundo vetor de frequencia
    loop_start9:
        ldurb w1, [x0, #0]
        cbz x1, loop_end9

        add x0, x0, #1

        add x7, sp, x1
        add x7, x7, #0x100 // offset do segundo vetor na memória

        // sp[x1]++
        ldurb w8, [x7, #0]
        add x8, x8, #1
        sturb w8, [x7, #0]

        b loop_start9
    loop_end9:


    eor x4, x4, x4
    mov x13, #0x100 // x5 guarda a resposta
    mloop_start:

    subs x5, x4, #0x100
    b.pl mloop_end

    eor x5, x5, x5
    add x5, sp, x4

    add x4, x4, #1

    ldurb w0, [x5, #0]
    add x5, x5, #0x100
    ldurb w1, [x5, #0]

    cbz x1, is_zero

    bl div // x0 = x0 / x1
    mov x1, x13
    bl min // x0 = min(x0, x1)
    mov x13, x0 // x13 = min(x13, x0)

    is_zero:
    b mloop_start
    mloop_end:

    mov x0, x13
	add sp, sp, #0x300    

    mov x30, x17
    br x30
