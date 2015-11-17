SRC = header.asm init.asm
OBJ = $(SRC:.asm=.rel)

all: storage.rom

%.rel: %.asm
	sdasz80 -o $@ $^

storage.ihx: $(OBJ)
	sdld -b _CODE=0x4010 -b _DATA=0x5000 -i $@ $^

storage.bin: storage.ihx
	makebin -s 65536 $^ > $@

storage.rom: storage.bin
	split -b 16384 $^
	cat xab xac > $@
	rm xaa xab xac xad

test: storage.rom
	openmsx -machine Gradiente_Expert_DD_Plus storage.rom

clean:
	rm -f *.rel *.ihx *.bin *.rom
