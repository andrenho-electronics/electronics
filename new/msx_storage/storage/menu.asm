	.module	menu
	.include "bios.inc"
	.globl	mc_line, mc_info1, mc_info2

; special chars
UPPER_LINE_CHAR = 0xC0
LOWER_LINE_CHAR = 0xC3
LEFT_LINE_CHAR  = 0xDE
RIGHT_LINE_CHAR = 0xC6
ARROW_CHAR = 0xCF
; TODO - check if we are using a different MSX charset

; box dimensions
X =: 0
Y =: 1
W =: 39
H =: 19  ; to change this, also change the # of lines in mcdata.asm

	.area 	_CODE

;-------------------------------------------------------
; draw the menu
;
draw_menu::
;-------------------------------------------------------
	ld	bc, (_title_len)	; draw title
	ld	de, #0
	ld	hl, #_title
	call	LDIRVM

	call 	_draw_box		; draw box
	call	_draw_menu_items
	call	_draw_arrow

	ld	bc, #SCREEN_W		; write ROM info
	ld	de, #SCREEN_W * (Y+H)
	ld	hl, #mc_info1
	call	LDIRVM
	ld	bc, #SCREEN_W
	ld	de, #SCREEN_W * (Y+H+1)
	ld	hl, #mc_info2
	call	LDIRVM

	ld	bc, #SCREEN_W		; write keys info
	ld	de, #SCREEN_W * 23
	ld	hl, #_keys
	call	LDIRVM

	ret

	_title: 	.ascii 	"MSX Storage Card v1.0"
	_title_len: 	.dw	21
	
	_keys:		.ascii 	"                 [ESC] Continue to BASIC"

_draw_box:  ; (registers lost: all)
	ld	a, #UPPER_LINE_CHAR	; draw upper line
	ld	hl, #Y * SCREEN_W + X+1	; (screen position)
	ld	bc, #W-1		; (string length)
	call	FILVRM
	
	ld	a, #LOWER_LINE_CHAR	; draw lower line
	ld	hl, #H * SCREEN_W + 1
	ld	bc, #W-1
	call	FILVRM

	ld	hl, #(Y+1) * SCREEN_W + X ; set cursor position for drawing lateral lines

0$:	ld	a, #LEFT_LINE_CHAR	; draw left char
	ld	bc, #1
	call	FILVRM

	ld	de, #W			; position hl to right char position
	add	hl, de			
	ld	a, #RIGHT_LINE_CHAR	; draw right char
	ld	bc, #1
	call	FILVRM

	ld	de, #SCREEN_W - W - X	; advance to next line
	add	hl, de

	; Here we compare if our cursor is exactly where the next line
	; would be if the box overflowed. If this is true, we can break
	; this loop.
	ld	de, #(SCREEN_W * (Y+H-1)) + X	; next overflowing position
	ld	a, e			; compare first 8 bits
	cp	l
	jp	nz, 0$
	ld	a, d			; compare second block of 8 bits
	cp	h
	jp	nz, 0$

	ret


_draw_menu_items:  ; (registers lost: all)
	
	; initialize variables
	ld	a, #H - Y - 3		; number of lines
	ld	bc, #W-3		; name length
	ld	de, #(SCREEN_W * (Y+2)) + (X+2)  ; cursor position
	ld	hl, #mc_line		; string pointer position

	; print name
0$:	push	af
	push	bc
	push	de
	push	hl
	call	LDIRVM
	pop	hl
	pop	de
	pop	bc
	pop	af
	
	; advance cursor position (in de)
	push	hl
	ex	de, hl			; hl = de
	ld	de, #SCREEN_W		; de = 40
	add	hl, de			; hl += de
	ex	de, hl			; de = hl
	pop	hl

	; advance memory pointer
	push	de
	ld	de, #W-3
	add	hl, de
	pop	de

	dec	a
	or	a
	jp	nz, 0$

	ret


_draw_arrow:
	
	ld	a, #0			; TODO - read this from microcontroller
	
	add	a, #3			; put B in the right position
	ld	b, a			

	ld	de, #SCREEN_W		; HL = B * 40
	ld	hl, #0
0$:	add	hl, de
	djnz	0$

	ld	de, #X+1
	add 	hl, de

	ld	a, #ARROW_CHAR
	ld	bc, #1
	call	FILVRM

	ret

;-------------------------------------------------------
; get input from user
;   outputs: a = 0 - exit to BASIC
;                1 - something else (TODO)
;   TODO: check joystick
;
menu_input::
;-------------------------------------------------------

	ld	a, #0xff	; hide cursor
	ld	(CSRSW), a

	call	CHGET		; get keypress

	; 'b' will contain the return value

	ld	b, #0		; ESC was pressed?
	cp	#27
	jp	z, 0$

	; TODO - check other keys / joystick

	ld	b, #1		; no compatible key was pressed, so we return 1

0$:	ld	a, b	
	ret

_hide_cursor:
	.db	27, 'x', '5'

; vim: syntax=z8a
