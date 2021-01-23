
; ----------------------------------------------------------------------------- ;
;										;
;	Disassembly of R11A from Sonic CD					;
;										;
;	Created by Ralakimus							;
;	Special thanks to flamewing and TheStoneBanana for extensive help	;
;										;
;	File:		macros.asm						;
;	Contents:	Macros							;
;										;
; ----------------------------------------------------------------------------- ;

; -------------------------------------------------------------------------------
; Align
; -------------------------------------------------------------------------------
; PARAMETERS:
;	bound	- Size boundary
;	value	- Value to pad with
; -------------------------------------------------------------------------------

ALIGN macro &
	bound, value

	if narg>1
		dcb.b	((\bound)-((*)%(\bound)))%(\bound), \value
	else
		dcb.b	((\bound)-((*)%(\bound)))%(\bound), 0
	endif

	endm

; ----------------------------------------------------------------------------- ;
