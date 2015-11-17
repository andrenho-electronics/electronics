	.area _CODE
init::
	call	0x050E		; INITXT
	ld	bc, #12
	ld	de, #0
	ld	hl, #text
	call	0x0744		; LDIRVM

end:
	jp	end

	.area _DATA

text:
	.ascii 	"Hello world!"

; vim: syntax=z8a
