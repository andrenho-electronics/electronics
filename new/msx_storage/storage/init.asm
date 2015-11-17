	.module	init
	.include "bios.inc"
	.globl	draw_menu, menu_input, parse_input

	.area 	_CODE

;-------------------------------------------------------
; initialization code
;
init::
;-------------------------------------------------------
	call	INITXT			; clear screen

0$:	call 	draw_menu		; draw the menu and get user input

	call	menu_input		; menu input is returned in A
	or	a
	jp	z, _basic		; if A == 0, return to BASIC

	call	parse_input		; if return is not zero, contact the uC with the user input,
	jp	0$			; and then do everything again

_basic:
	call	INITXT			; clear screen
	ret				; return to BASIC


; vim: syntax=z8a
