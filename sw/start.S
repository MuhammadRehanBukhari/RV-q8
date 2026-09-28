    .section .text.init
    .globl _start

_start:
    li   sp, 0x80010000
    li   a0, 7
    li   a1, 5
    call add

    # ---- self-check: is the result correct? ----
    li   t0, 2
    bne  a0, t0, fail

pass:
    li   t1, 1
    j    write_tohost

fail:
    li   t1, 3

write_tohost:
    la   t2, tohost
    sw   t1, 0(t2)
    sw   zero, 4(t2)

end:
    j    end

    # ---- communication with Spike ----
    .section .tohost, "aw", @progbits
    .align 3
    .globl tohost
tohost:   .dword 0
    .globl fromhost
fromhost: .dword 0