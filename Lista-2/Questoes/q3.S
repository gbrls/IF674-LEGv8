movz x12, #0x3F // máscara de 5 bits 00011111
and x9, x10, x12, lsl 11  // 11-16 x10 mask
and x8, x11, x12, lsl 26  // 26-31 x11 mask


eor x11, x11, x9, lsl 15 // xoring x10's mask into x11
eor x11, x11, x8         // removing original x11 bits
