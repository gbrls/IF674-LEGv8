fat:
    mov x1, #1

    start_fat:
    cbz x0, end_fat

    mul x1, x1, x0
    sub x0, x0, #1

    b start_fat
    end_fat:
    mov x0, x1

    br x30

mod10:

    eor x1, x1, x1
    mod_start:

    subs x2, x0, #10
    b.mi mod_end

    sub x0, x0, #10
    add x1, x1, #1

    b mod_start
    mod_end:

    br x30

qst8:
    eor x10, x10, x10 // x10 vai guardar a resposta
    mov x3, x0        // x3 guarda o valor que estamos dividindo
    mov x12, x30

    start8:
    cbz x3, end8

    mov x0, x3
    bl mod10
    mov x11, x1 // x11 = x0/10, x0 = x0%10
    bl fat

    add x10, x10, x0

    mov x3, x11

    b start8
    end8:

    mov x0, x10

    mov x30, x12
    br x30
