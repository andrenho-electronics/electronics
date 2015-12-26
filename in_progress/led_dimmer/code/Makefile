DEVICE=attiny2313
PROGRAMMER=avrisp
SPEED=19200
#DEVICE=atmega328p
#PROGRAMMER=arduino
#SPEED=115200

LFUSE=0x64
HFUSE=0x9F
EFUSE=0xFF

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
	avrdude -p${DEVICE} -c${PROGRAMMER} -P/dev/ttyACM0 -b${SPEED} -e -Ulfuse:w:${LFUSE}:m -Uhfuse:w:${HFUSE}:m -Uefuse:w:${EFUSE}:m 

clean:
	rm -f *.hex *.elf *.s
