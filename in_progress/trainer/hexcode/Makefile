DEVICE=atmega16
PROGRAMMER=avrisp
SPEED=19200

LFUSE=0xE1
HFUSE=0xD9

all: main.hex

main.elf: main.c
	avr-gcc -mmcu=$(DEVICE) -Wall -Os -omain.elf main.c

main.hex: main.elf
	avr-objcopy -j .text -j .data -O ihex main.elf main.hex

assembly: main.c
	avr-gcc -S -mmcu=$(DEVICE) -Wall -Os -omain.s main.c

upload: main.hex
	avrdude -p${DEVICE} -c${PROGRAMMER} -b${SPEED} -P/dev/ttyACM0 -U flash:w:main.hex

fuse:
	avrdude -p${DEVICE} -c${PROGRAMMER} -P/dev/ttyACM0 -b${SPEED} -e -Ulfuse:w:${LFUSE}:m -Uhfuse:w:${HFUSE}:m

clean:
	rm -f *.hex *.elf *.s

#
#
#

test.elf: test.c
	avr-gcc -mmcu=attiny2313 -Wall -Os -otest.elf test.c

test.hex: test.elf
	avr-objcopy -j .text -j .data -O ihex test.elf test.hex

test-upload: test.hex
	avrdude -pattiny2313 -c${PROGRAMMER} -b${SPEED} -P/dev/ttyACM0 -U flash:w:test.hex

test-fuse:
	avrdude -pattiny2313 -c${PROGRAMMER} -P/dev/ttyACM0 -b${SPEED} -e -Ulfuse:w:0x64:m -Uhfuse:w:0x9f:m
