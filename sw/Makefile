CC      = riscv64-unknown-elf-gcc
OBJDUMP = riscv64-unknown-elf-objdump
CFLAGS  = -march=rv32i -mabi=ilp32 -O2 -nostdlib -T link.ld -Wl,--no-warn-rwx-segments

add.elf: start.S add.c link.ld
	$(CC) $(CFLAGS) start.S add.c -o add.elf

dump: add.elf
	$(OBJDUMP) -d add.elf

run: add.elf
	spike -d --isa=rv32i add.elf

clean:
	rm -f *.elf *.o

.PHONY: dump run clean