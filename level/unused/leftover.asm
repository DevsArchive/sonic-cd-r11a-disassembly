
; -------------------------------------------------------------------------------
; Looks like PLC data, but there's isn't enough info to tell what this is from
; -------------------------------------------------------------------------------

	dc.w	$FE60

; -------------------------------------------------------------------------------
; R62D's animated level tile handler
; -------------------------------------------------------------------------------

R62D_LevelAniArt:
;	jsr	LoadShieldArt
;
;	lea	(v_ani_art_timers).w,a2
;	lea	(v_ani_art_frames).w,a4
;
;	lea	(R62D_AniArt_Electricity).l,a1
;	move.w	#$3F,d6
;	bsr.w	R62D_RunAniArt2
;	bne.s	@RunAniArt2
;
;	lea	(VDP_CTRL).l,a5
;	move.l	#$94009380,(a5)
;	move.l	#$968C95C0,(a5)
;	move.w	#$977F,(a5)
;	move.w	#$5640,(a5)
;	move.w	#$81,(v_dma_cmd_cache).w
;	move.w	(v_dma_cmd_cache).w,(a5)
;
; @RunAniArt2:
;	lea	(R62D_AniArt_ElecPole).l,a1
;	move.w	#$1F,d6
;	bsr.w	R62D_RunAniArt2
;	bne.s	@RunAniArt3
;
;	lea	(VDP_CTRL).l,a5
;	move.l	#$94009340,(a5)
;	move.l	#$968C95C0,(a5)
;	move.w	#$977F,(a5)
;	move.w	#$55C0,(a5)
;	move.w	#$81,(v_dma_cmd_cache).w
;	move.w	(v_dma_cmd_cache).w,(a5)
;
; @RunAniArt3:
;	lea	(R62D_AniArt_FlashLight).l,a1
	move.w	#$1F,d6
	bsr.w	R62D_RunAniArt1
	bne.s	@End

	lea	(VDP_CTRL).l,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$5540,(a5)
	move.w	#$81,(v_dma_cmd_cache).w
	move.w	(v_dma_cmd_cache).w,(a5)

@End:
	rts

; -------------------------------------------------------------------------------

R62D_RunAniArt1:
	subq.b	#1,(a2)
	bpl.s	@TimerGoing
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	(a1),d0
	bcs.s	@NoReset
	moveq	#0,d0

@NoReset:
	move.b	d0,(a4)
	add.w	d0,d0
	move.b	2(a1,d0.w),(a2)
	move.b	3(a1,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	add.w	d0,d0
	moveq	#0,d1
	move.b	(a1),d1
	add.w	d1,d1
	add.w	d1,d0
	movea.l	2(a1,d0.w),a1
	lea	(v_dma_buffer).l,a3

@Loop:
	move.l	(a1)+,(a3)+
	dbf	d6,@Loop
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

@TimerGoing:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; -------------------------------------------------------------------------------

R62D_AniArt_FlashLight:
	dc.b	4, 0
	dc.b	4, 0
	dc.b	9, 1
	dc.b	4, 2
	dc.b	$F, 3
	dc.l	$233F0C					; ArtUnc_FlashingLight
	dc.l	$233F8C					; ArtUnc_FlashingLight+$80
	dc.l	$23400C					; ArtUnc_FlashingLight+$100
	dc.l	$23408C					; ArtUnc_FlashingLight+$180

; -------------------------------------------------------------------------------

R62D_RunAniArt2:
	subq.b	#1,(a2)
	bpl.w	@TimerGoing
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.s	@NoReset
	moveq	#0,d0

@NoReset:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	(v_dma_buffer).l,a3

@Loop:
	move.l	(a1)+,(a3)+
	dbf	d6,@Loop
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts

@TimerGoing:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; -------------------------------------------------------------------------------

R62D_AniArt_Electricity:
	dc.b	4, 3
	dc.l	$233C0C					; ArtUnc_Electricity
	dc.l	$233D0C					; ArtUnc_Electricity+$100
	dc.l	$233E0C					; ArtUnc_Electricity+$200

R62D_AniArt_ElecPole:
	dc.b	3, 2
	dc.l	$233B0C					; ArtUnc_ElecPole
	dc.l	$233B8C					; ArtUnc_ElecPole+$80

; -------------------------------------------------------------------------------

R62D_LevelDataIndex:
	dc.l	$32381DC				; ArtNem_LevelArt
	dc.l	$2236F30				; MapNem_LevelBlocks
	dc.l	LevelChunks
	dc.b	0
	dc.b	$81

R62D_LevelPaletteID:
	dc.b	4
	dc.b	4

; -------------------------------------------------------------------------------
; R62D's PLC index
; -------------------------------------------------------------------------------

R62D_PLCIndex:
	dc.w	R62D_PLC_LevelArt-R62D_PLCIndex
	dc.w	R62D_PLC_Main1-R62D_PLCIndex
	dc.w	R62D_PLC_Main2-R62D_PLCIndex
	dc.w	R62D_PLC_LevelArt-R62D_PLCIndex
	dc.w	R62D_PLC_Main2-R62D_PLCIndex
	dc.w	R62D_PLC_Main2-R62D_PLCIndex
	dc.w	R62D_PLC_Main2-R62D_PLCIndex
	dc.w	R62D_PLC_Main2-R62D_PLCIndex
	dc.w	R62D_PLC_Main2-R62D_PLCIndex
	dc.w	R62D_PLC_Main2-R62D_PLCIndex
	dc.w	R62D_PLC_Main2-R62D_PLCIndex
	dc.w	R62D_PLC_Main2-R62D_PLCIndex
	dc.w	R62D_PLC_Main2-R62D_PLCIndex
	dc.w	R62D_PLC_Main2-R62D_PLCIndex
	dc.w	R62D_PLC_Main2-R62D_PLCIndex
	dc.w	R62D_PLC_Main2-R62D_PLCIndex
	dc.w	R62D_PLC_Results-R62D_PLCIndex
	dc.w	R62D_PLC_Main2-R62D_PLCIndex
	dc.w	R62D_PLC_Signpost-R62D_PLCIndex

; -------------------------------------------------------------------------------

R62D_PLC_LevelArt:
	dc.w	0
	dc.l	$2381DC					; ArtNem_LevelArt
	dc.w	0

; -------------------------------------------------------------------------------

R62D_PLC_Main1:
	dc.w	$E
	dc.l	$230DA2					; ArtNem_TitleCard
	dc.w	$6C00
	dc.l	$2339BC					; ArtNem_TitleCardText
	dc.w	$7A00
	dc.l	$23CA20					; ArtNem_Batapyon
	dc.w	$8700
	dc.l	$23CC94					; ArtNem_PohBee
	dc.w	$8AE0
	dc.l	$23CFF4					; ArtNem_Minomusi
	dc.w	$9100
	dc.l	$23D458					; ArtNem_Semi
	dc.w	$9500
	dc.l	$23D2B6					; ArtNem_SpikeBall
	dc.w	$9900
	dc.l	$23DC52					; ArtNem_WWZAnimals
	dc.w	$9A00
	dc.l	$23213A					; ArtNem_Springs
	dc.w	$A400
	dc.l	$2334BC					; ArtNem_HUD
	dc.w	$AD00
	dc.l	$23235C					; ArtNem_MonitorTimePosts
	dc.w	$B500
	dc.l	$232960					; ArtNem_Explosions
	dc.w	$D000
	dc.l	$22EDE6					; ArtNem_Points
	dc.w	$D8C0
	dc.l	$233732					; ArtNem_Flower
	dc.w	$DAE0
	dc.l	$232E48					; ArtNem_Rings
	dc.w	$F5C0

; -------------------------------------------------------------------------------

R62D_PLC_Main2:
	dc.w	$E
	dc.l	$22F8FC					; ArtNem_GoalPost
	dc.w	$5780
	dc.l	$234378					; ArtNem_FrozenSonic
	dc.w	$5C20
	dc.l	$234220					; ArtNem_Freezer
	dc.w	$6200
	dc.l	$23B174					; ArtNem_Crusher
	dc.w	$6800
	dc.l	$23C8EE					; ArtNem_ElecOrb
	dc.w	$6B00
	dc.l	$23B2B2					; ArtNem_SpinningPtfm
	dc.w	$6D40
	dc.l	$23BE78					; ArtNem_Button
	dc.w	$7340
	dc.l	$23BECA					; ArtNem_Door
	dc.w	$7400
	dc.l	$23D378					; ArtNem_MovingBlock
	dc.w	$7500
	dc.l	$23D6B0					; ArtNem_Seesaw
	dc.w	$7700
	dc.l	$23BD98					; ArtNem_BouncingPtfm
	dc.w	$7D00
	dc.l	$23DB7A					; ArtNem_RotSpikeBall
	dc.w	$7F00
	dc.l	$23410C					; ArtNem_Launcher
	dc.w	$8000
	dc.l	$23C34E					; ArtNem_FlapDoor
	dc.w	$8200
	dc.l	$23C066					; ArtNem_MovingBlock
	dc.w	$9D00

; -------------------------------------------------------------------------------

R62D_PLC_Results:
	dc.w	0
	dc.l	$230098					; ArtNem_Results
	dc.w	$7880

; -------------------------------------------------------------------------------

R62D_PLC_Signpost:
	dc.w	2
	dc.l	$22FABC					; ArtNem_Signpost
	dc.w	$8780
	dc.l	$22F4F2					; ArtNem_BigRing
	dc.w	$9100
	dc.l	$20BBBC					; ArtNem_BigRingFlash
	dc.w	$7DE0

; -------------------------------------------------------------------------------
; Generic leftover PLC entry data for ArtNem_BigRingFlash, could be from
; any level file
; -------------------------------------------------------------------------------

	dc.w	$7DE0

; -------------------------------------------------------------------------------
; This tidbit of PLC data is from R72C
; -------------------------------------------------------------------------------

	dc.l	$23D59E					; ArtNem_Kabasira
	dc.w	$78C0
	dc.l	$23C440					; ArtNem_Kanabun
	dc.w	$7D20
	dc.l	$23D0C4					; ArTNem_Hotaru
	dc.w	$8BA0

; -------------------------------------------------------------------------------
; Looks like PLC data, but there's isn't enough info to tell what this is from
; -------------------------------------------------------------------------------

	dc.w	0
	dc.w	$23

; -------------------------------------------------------------------------------
