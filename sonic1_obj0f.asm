Obj0F:					; XREF: Obj_Index
		moveq	#0,d0
		move.b	$24(a0),d0
		move.w	Obj0F_Index(pc,d0.w),d1
		jsr	Obj0F_Index(pc,d1.w)
		bra.w	DisplaySprite
; ===========================================================================
Obj0F_Index:	dc.w Obj0F_Main-Obj0F_Index
;		dc.w Obj0F_PrsStart-Obj0F_Index
;		dc.w locret_A6F8-Obj0F_Index
		dc.w Obj0F_TitleMenu-Obj0F_Index
; ===========================================================================

Obj0F_Main:				; XREF: Obj0F_Index
		addq.b	#2,$24(a0)
		move.w	#$D0,8(a0)
		move.w	#$130,$A(a0)
		move.l	#Map_obj0F,4(a0)
		move.w	#$200,2(a0)
		cmpi.b	#2,$1A(a0)	; is object "PRESS START"?
		bcs.s	Obj0F_PrsStart	; if yes, branch
		addq.b	#2,$24(a0)
		cmpi.b	#3,$1A(a0)	; is the object	"TM"?
		bne.s	locret_A6F8	; if not, branch
		move.w	#$2510,2(a0)	; "TM" specific	code
		move.w	#$170,8(a0)
		move.w	#$F8,$A(a0)

locret_A6F8:				; XREF: Obj0F_Index
		rts	
Obj0F_TitleMenu:
	moveq	#0,d2
	move.b	($FFFFFF86).w,d2
	move.b	($FFFFF605).w,d0
;	or.b	(Ctrl_2_Press).w,d0
	btst	#0,d0
	beq.s	loc2_13660
	subq.b	#1,d2
	bcc.s	loc2_13660
	move.b	#2,d2
loc2_13660:
	btst	#1,d0
	beq.s	loc2_13670
	addq.b	#1,d2
	cmpi.b	#3,d2
	bcs.s	loc2_13670
	moveq	#0,d2
loc2_13670:
	move.b	d2,$1A(a0)
	move.b	d2,($FFFFFF86).w
	andi.b	#3,d0
	beq.s	return_13684
	move.w	#$CD,d0 ; selection blip sound
	jsr	(PlaySound_Special)
	


return_13684:
	rts		
; ===========================================================================

Obj0F_PrsStart:				; XREF: Obj0F_Index
		lea	(Ani_obj0F).l,a1
		bra.w	AnimateSprite
; ===========================================================================