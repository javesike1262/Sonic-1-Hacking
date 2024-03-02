; ===========================================================================
; ---------------------------------------------------------------------------- 
; Object 0F - "PRESS START BUTTON" and "TM" from title screen along with title menu
; ----------------------------------------------------------------------------

Obj0F:				; DATA XREF: ROM:0001600Co
		moveq	#0,d0
		move.b	$24(a0),d0
		move.w	Obj0F_Index(pc,d0.w),d1
		jsr	Obj0F_Index(pc,d1.w)
		bra.w	sub_164F4
; ===========================================================================
Obj0F_Index:	dc.w Obj0F_Main-Obj0F_Index; 0 ; DATA XREF: ROM:00013612o
		dc.w loc_13644-Obj0F_Index; 1
; ===========================================================================

Obj0F_Main:				; DATA XREF: ROM:00013612o
		addq.b	#2,$24(a0)
		move.w	#$128,8(a0)
		move.w	#$14C,$A(a0)
		move.l	#Map_obj0F,4(a0) ;#MapUnc_13B70 
		move.w	#0,2(a0)
		bsr.w	sub_16D6E
		andi.b	#1,($FFFFFF86).w
		move.b	($FFFFFF86).w,$1A(a0)

loc_13644:				; DATA XREF: ROM:00013612o
		moveq	#0,d2
		move.b	($FFFFFF86).w,d2
		move.b	($FFFFF604).w,d0
		or.b	($FFFFF606).w,d0
		btst	#0,d0
		beq.s	loc_13660
		subq.b	#1,d2
		bcc.s	loc_13660
		move.b	#2,d2

loc_13660:				; CODE XREF: ROM:00013656j
					; ROM:0001365Aj
		btst	#1,d0
		beq.s	loc_13670_1
		addq.b	#1,d2
		cmpi.b	#3,d2
		bcs.s	loc_13670_1
		moveq	#0,d2

loc_13670_1:				; CODE XREF: ROM:00013664j
					; ROM:0001366Cj
		move.b	d2,$1A(a0)
		move.b	d2,($FFFFFF86).w
		andi.b	#3,d0
		beq.s	locret_13684
		move.w	#$BD,d0		 
		jsr	(PlaySound_Special).l ;play	menu sound effect

locret_13684:				; CODE XREF: ROM:0001367Cj
		rts	
; ===========================================================================
off_13686:	dc.w byte_1368E-off_13686; 0 ; DATA XREF: ROM:00012F52o
					; ROM:000132E2o ...
		dc.w byte_13694-off_13686; 1
		dc.w byte_1369C-off_13686; 2
		dc.w byte_136A4-off_13686; 3
byte_1368E:	dc.b   1		; 0 ; DATA XREF: ROM:00013686o
		dc.b   5		; 1
		dc.b   6		; 2
		dc.b   7		; 3
		dc.b   8		; 4
		dc.b $FA		; 5
byte_13694:	dc.b   1		; 0 ; DATA XREF: ROM:00013686o
		dc.b   0		; 1
		dc.b   1		; 2
		dc.b   2		; 3
		dc.b   3		; 4
		dc.b   4		; 5
		dc.b $FA		; 6
		dc.b   0		; 7
byte_1369C:	dc.b   1		; 0 ; DATA XREF: ROM:00013686o
		dc.b  $C		; 1
		dc.b  $D		; 2
		dc.b  $E		; 3
		dc.b  $D		; 4
		dc.b  $C		; 5
		dc.b $FA		; 6
		dc.b   0		; 7
byte_136A4:	dc.b   3		; 0 ; DATA XREF: ROM:00013686o
		dc.b  $C		; 1
		dc.b  $F		; 2
		dc.b $FF		; 3