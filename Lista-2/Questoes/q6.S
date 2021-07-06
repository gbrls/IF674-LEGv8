qst6:
    eor x3, x3, x3

    mov x4, 'A'
    mov x5, 'E'
    mov x6, 'I'
    mov x7, 'O'
    mov x8, 'U'

    loop_start:
        ldurb w1, [x0, #0]
        cbz x1, loop_end

        add x0, x0, #1

        eor x2, x1, x4
        cbz x2, is_vowel
        eor x2, x1, x5
        cbz x2, is_vowel
        eor x2, x1, x6
        cbz x2, is_vowel
        eor x2, x1, x7
        cbz x2, is_vowel
        eor x2, x1, x8
        cbz x2, is_vowel

        b loop_start
    is_vowel:
        add x3, x3, #1
        b loop_start
    loop_end:

    mov x0, x3

    br x30
