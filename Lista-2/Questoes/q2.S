ldur x0, [sp, #0x0]
adds x0, x0, #0x0 // testando se a >= 0
b.mi .exit

ldur x0, [sp, #0x8]
subs x0, x0, #65 // (b - 65 < 0) <=> (b <= 64)
b.pl exit

ldur x0, [sp, #0x10]
subs x0, x0, #25
b.mi .exit

movz x0, #1
stur x0, [sp, #0x18]
.exit:
