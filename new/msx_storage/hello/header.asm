; 
; ROM header
;

; 0000 - 3FFF:	main ROM
; 4000 - 7FFF:	ext ROM
; 8000 - BFFF:  ext ROM
; C000 - FFFF:  RAM (work area)

	.module start
	.globl	init

	.area 	_ROM_HDR (ABS)
	.org	0x4000

	.db	'A		; mandatory ROM bytes
	.db	'B	
	.dw	init		; program entry point
	.dw	0		;
	.dw	0		;
	.dw	0		;
	.dw	0		;
	.dw	0		;
	.dw	0		;

	.ascii "END"

; vim: syntax=z8a
