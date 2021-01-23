
; -------------------------------------------------------------------------------
; This bit is leftover from the sawblade sprite mappings in R83D
; -------------------------------------------------------------------------------

	dc.b	5, 8, $22, $CB
	dc.b	$D5, 5, 8, $22, $D5
	dc.b	$DF, 5, 8, $22, $DF
	dc.b	$E9, 5, 8, $22, $E9
	dc.b	$F3, 5, 8, $1E, $F3
	dc.b	$E0, 8, 0, 0, $E8
	dc.b	$E8, $E, 0, 3, $E0
	dc.b	$E0, 8, 8, 0, 0
	dc.b	$E8, $E, 8, 3, 0
	dc.b	$18, 8, $10, 0, $E8
	dc.b	0, $E, $10, 3, $E0
	dc.b	$18, 8, $18, 0, 0
	dc.b	0, $E, $18, 3, 0
	even

; -------------------------------------------------------------------------------
; This bit is leftover from the flower capsule sprite mappings
; -------------------------------------------------------------------------------

	dc.b	8, $54, 0
	even

Leftover_MapSpr_FlowerCapsule_Frame2:
	dc.b	6
	dc.b	8, $D, 0, $44, $E0
	dc.b	8, $D, 0, $4C, 0
	dc.b	$18, $C, 0, $20, $E0
	dc.b	$18, $C, 8, $20, 0
	dc.b	$20, 7, 0, $54, $F0
	dc.b	$20, 7, 8, $54, 0
	even

Leftover_MapSpr_FlowerCapsule_Frame3:
	dc.b	1
	dc.b	$F8, 5, 0, $5C, $F8
	even

Leftover_MapSpr_FlowerCapsule_Frame4:
	dc.b	1
	dc.b	$F8, 5, 0, $60, $F8
	even

Leftover_MapSpr_FlowerCapsule_Frame5:
	dc.b	1
	dc.b	$F8, 5, 0, $64, $F8
	even

Leftover_MapSpr_FlowerCapsule_Frame6:
	dc.b	1
	dc.b	$F8, 5, 8, $64, $F8
	even

Leftover_MapSpr_FlowerCapsule_Frame7:
	dc.b	1
	dc.b	$F8, 5, 8, $60, $F8
	even

Leftover_MapSpr_FlowerCapsule_8:
	dc.b	1
	dc.b	$F8, 5, 8, $5C, $F8
	even

	; Duplicated data
	dc.b	5, 8, $5C, $F8
	even

; -------------------------------------------------------------------------------
; This bit is a section of the path data for the small platforms on converyor
; betls in Metallic Madness
; -------------------------------------------------------------------------------

	;	X,   Y
	dc.b	$56, $11
	dc.b	$57, $12
	dc.b	$58, $12
	dc.b	$59, $13
	dc.b	$5A, $13
	dc.b	$5B, $14
	dc.b	$5C, $15
	dc.b	$5D, $16
	dc.b	$5E, $17
	dc.b	$5F, $18
	dc.b	$60, $19
	dc.b	$61, $1A
	dc.b	$62, $1B
	dc.b	$63, $1C
	dc.b	$63, $1D
	dc.b	$64, $1E
	dc.b	$64, $1F
	dc.b	$64, $20
	dc.b	$65, $21
	dc.b	$65, $22
	dc.b	$65, $23
	dc.b	$66, $24
	dc.b	$66, $25
	dc.b	$66, $26
	dc.b	$66, $27
	dc.b	$66, $28
	dc.b	$66, $29
	dc.b	$66, $2A
	dc.b	$66, $2B
	dc.b	$66, $2C
	dc.b	$66, $2D
	dc.b	$65, $2E
	dc.b	$65, $2F
	dc.b	$65, $30
	dc.b	$64, $31
	dc.b	$64, $32
	dc.b	$64, $33
	dc.b	$63, $34
	dc.b	$62, $35
	dc.b	$62, $36
	dc.b	$61, $37
	dc.b	$60, $38
	dc.b	$5F, $39
	dc.b	$5E, $3A
	dc.b	$5D, $3B
	dc.b	$5C, $3C
	dc.b	$5B, $3C
	dc.b	$5A, $3D
	dc.b	$59, $3D
	dc.b	$58, $3D
	dc.b	$57, $3E
	dc.b	$56, $3E
	dc.b	$55, $3E
	dc.b	$54, $3F
	dc.b	$53, $3F
	dc.b	$52, $3F
	dc.b	$51, $3F
	dc.b	$50, $3F
	dc.b	$4F, $3F
	dc.b	$4E, $3F
	dc.b	$4D, $3F
	dc.b	$4C, $3F
	dc.b	$4B, $3F
	dc.b	$4A, $3F
	dc.b	$49, $3F
	dc.b	$48, $3E
	dc.b	$47, $3E
	dc.b	$46, $3E
	dc.b	$45, $3D
	dc.b	$44, $3D
	dc.b	$43, $3C
	dc.b	$42, $3C
	dc.b	$41, $3B
	dc.b	$40, $3B
	dc.b	$3F, $3A
	dc.b	$3E, $3A
	dc.b	$3D, $39
	dc.b	$3C, $39
	dc.b	$3B, $38
	dc.b	$3A, $38
	dc.b	$39, $37
	dc.b	$38, $37
	dc.b	$37, $36
	dc.b	$36, $36
	dc.b	$35, $35
	dc.b	$34, $35
	dc.b	$33, $34
	dc.b	$32, $34
	dc.b	$31, $33
	dc.b	$30, $33
	dc.b	$2F, $32
	dc.b	$2E, $32
	dc.b	$2D, $31
	dc.b	$2C, $31
	dc.b	$2B, $30
	dc.b	$2A, $30
	dc.b	$29, $2F
	dc.b	$28, $2F
	dc.b	$27, $2E
	dc.b	$26, $2E
	dc.b	$25, $2D
	dc.b	$24, $2D
	dc.b	$23, $2C
	dc.b	$22, $2C
	dc.b	$21, $2B
	dc.b	$20, $2B
	dc.b	$1F, $2A
	dc.b	$1E, $2A
	dc.b	$1D, $29
	dc.b	$1C, $29
	dc.b	$1B, $28
	dc.b	$1A, $28
	dc.b	$19, $27
	dc.b	$18, $27
	dc.b	$17, $26
	dc.b	$16, $26
	dc.b	$15, $25
	dc.b	$14, $25
	dc.b	$13, $24
	dc.b	$12, $24
	dc.b	$11, $23
	dc.b	$10, $23
	dc.b	$0F, $22
	dc.b	$0E, $22
	dc.b	$0D, $21
	dc.b	$0C, $21
	dc.b	$0B, $20
	dc.b	$0A, $20
	dc.b	$09, $1F

; -------------------------------------------------------------------------------
