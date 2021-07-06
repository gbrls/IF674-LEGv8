// a) Usaria o formato CB pois nele é possível passar um endereço para o
// goto e um registrador para a operação

.loop:

// inicio da solução
cbz x12, .exit2
sub x12, x12, #1
b .loop
// fim da solução
.exit2:
