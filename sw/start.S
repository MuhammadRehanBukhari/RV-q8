    .section .text.init
    .globl _start

_start:
    li   sp, 0x80010000
    li   a0, 7
    li   a1, 5
    call add

end:
    j    end
    