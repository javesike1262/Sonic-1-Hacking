; ===========================================================================
; ---------------------------------------------------------------------------
; Object 0F - "PRESS START BUTTON" and "TM" from title screen
; ---------------------------------------------------------------------------

Obj0F:					; XREF: Obj_Index
		moveq	#0,d0
		move.b	$24(a0),d0
		move.w	Obj0F_Index(pc,d0.w),d1
		jsr	Obj0F_Index(pc,d1.w)
		bra.w	DisplaySprite
; ===========================================================================
Obj0F_Index:	dc.w Obj0F_Main-Obj0F_Index
		dc.w Obj0F_PrsStart-Obj0F_Index
		dc.w locret_A6F8-Obj0F_Index
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
; ===========================================================================

Obj0F_PrsStart:				; XREF: Obj0F_Index
		lea	(Ani_obj0F).l,a1
		bra.w	AnimateSprite
; ===========================================================================
Ani_obj0E:
	include "_anim\obj0E.asm"

Ani_obj0F:
	include "_anim\obj0F.asm"