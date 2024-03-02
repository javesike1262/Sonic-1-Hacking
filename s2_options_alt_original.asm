VDP_Control_Port        equ $00C00004 
Player_Select_Flag		equ $FFFFFF7C
Game_Mode				equ $FFFFF600
Two_Player_Flag			equ $FFFFFFB8
Sound_Test_Sound		equ $FFFFFF84
Hardware_Id				equ $FFFFFFD8
Level_Id				equ $FFFFFE10
Two_Player_Items_Mode   equ $FFFFFF7E	
Dynamic_Normal: 
                lea     ($FFFFF7F0).w, A3	
Main_Menu_Snd           =  $0000		
Extra_Continue_Sfx      =  $00BF
Emerald_Snd				=  $0093
Ring_Sfx				=  $00B5
gm_PlayMode				= 	$0C
gm_Versus_Mode_Menu		= 	$1C
Play_Music:
                jmp     PlaySound 
NemesisDec:
				jmp		NemDec
EnigmaDec:
				jmp		EniDec
Play_Sfx	
				jmp		PlaySound_Special	
Options_Pal_FadeFrom  
				jmp Pal_FadeFrom
Opt_ClearScreen
				jmp	ClearScreen
Opt_PalLoad1
				jmp PalLoad1
Opt_DelayProgram
				jmp DelayProgram
Opt_Pal_FadeTo
				jmp Pal_FadeTo

;===============================================================================
; Menu de opções, menu de seleção de fases no modo 1 e 2 jogadores 
; [ Início ]
;=============================================================================== 
Main_Menu_Screen: ; Offset_0x008B50:   
                bsr     Options_Pal_FadeFrom                           ; Offset_0x002426
                move    #$2700, SR
                move.w  ($FFFFF60C).w, D0
                andi.b  #$BF, D0                                     ; $00C00004
                move.w  D0, (VDP_Control_Port)
                bsr     Opt_ClearScreen                            ; Offset_0x0011C4
                lea     (VDP_Control_Port), A6                       ; $00C00004
                move.w  #$8004, (A6)
                move.w  #$8230, (A6)
                move.w  #$8407, (A6)
                move.w  #$8230, (A6)
                move.w  #$8700, (A6)
                move.w  #$8C81, (A6)
                move.w  #$9001, (A6)
                lea     ($FFFFAC00).w, A1
                moveq   #$00, D0
                move.w  #$00FF, D1
Offset_0x008B96:
                move.l  D0, (A1)+
                dbra    D1, Offset_0x008B96
                lea     ($FFFFB000).w, A1
                moveq   #$00, D0
                move.w  #$07FF, D1
Offset_0x008BA6:
                move.l  D0, (A1)+
                dbra    D1, Offset_0x008BA6
                clr.w   ($FFFFDC00).w
                move.l  #$FFFFDC00, ($FFFFDCFC).w
                move.l  #$42000000, (VDP_Control_Port)               ; $00C00004
                lea     (OptMenu_Font), A0                        ; Offset_0x07C43A
                bsr     NemesisDec                             ; Offset_0x00149A
                move.l  #$4E000000, (VDP_Control_Port)               ; $00C00004
                lea     (Menu_Frame), A0                       ; Offset_0x07D990
                bsr     NemesisDec                             ; Offset_0x00149A
                move.l  #$52000000, (VDP_Control_Port)               ; $00C00004
                lea     (Level_Icons), A0                      ; Offset_0x07DA10
                bsr     NemesisDec                             ; Offset_0x00149A
                lea     ($FFFF0000), A1
                lea     (Versus_Menu_Bg_Mappings), A0          ; Offset_0x07CB80
                move.w  #$6000, D0
                bsr     EnigmaDec                              ; Offset_0x00177A
                lea     ($FFFF0000), A1
                move.l  #$60000003, D0
                moveq   #$27, D1
                moveq   #$1B, D2
                jsr     (ShowVDPGraphics)                      ; Offset_0x0013CA
;               cmpi.b  #gm_Options_Menu, (Game_Mode).w         ; $24, $FFFFF600
;               beq     Options_Menu                           ; Offset_0x008F56
;                cmpi.b  #gm_Level_Select_Menu, (Game_Mode).w    ; $28, $FFFFF600
;                beq     Level_Select_Menu                      ; Offset_0x00928C
;------------------------------------------------------------------------------- 
Offset_0x008F48:
                moveq   #$00, D1
                move.b  (A1)+, D1
Offset_0x008F4C:
                move.b  (A1)+, D0
                move.w  D0, (A2)+
                dbra    D1, Offset_0x008F4C
                rts
;===============================================================================				
Options_Menu: ; Offset_0x008F56:
                bsr     Options_Pal_FadeFrom                           ; Offset_0x002426
                move    #$2700, SR
                move.w  ($FFFFF60C).w, D0
                andi.b  #$BF, D0                                     ; $00C00004
                move.w  D0, (VDP_Control_Port)
                bsr     Opt_ClearScreen                            ; Offset_0x0011C4
                lea     (VDP_Control_Port), A6                       ; $00C00004
                move.w  #$8004, (A6)
                move.w  #$8230, (A6)
                move.w  #$8407, (A6)
                move.w  #$8230, (A6)
                move.w  #$8700, (A6)
                move.w  #$8C81, (A6)
                move.w  #$9001, (A6)
                lea     ($FFFFAC00).w, A1
                move.l  D0, (A1)+
;                dbra    D1, Offset_0x008BA6
                clr.w   ($FFFFDC00).w
                move.l  #$FFFFDC00, ($FFFFDCFC).w
                move.l  #$42000000, (VDP_Control_Port)               ; $00C00004
                lea     (OptMenu_Font), A0                        ; Offset_0x07C43A
                bsr     NemesisDec                             ; Offset_0x00149A
                move.l  #$50000000, (VDP_Control_Port)               ; $00C00004
                lea     (Menu_Frame), A0                       ; Offset_0x07D990				
                moveq   #$00, D0
                move.w  #$00FF, D1
                bsr     Options_Pal_FadeFrom                           ; Offset_0x002426
                move    #$2700, SR
                move.w  ($FFFFF60C).w, D0
                andi.b  #$BF, D0                                     ; $00C00004
                move.w  D0, (VDP_Control_Port)
                bsr     Opt_ClearScreen                            ; Offset_0x0011C4
                lea     (VDP_Control_Port), A6                       ; $00C00004
                move.w  #$8004, (A6)
                move.w  #$8230, (A6)
                move.w  #$8407, (A6)
                move.w  #$8230, (A6)
                move.w  #$8700, (A6)
                move.w  #$8C81, (A6)
                move.w  #$9001, (A6)
                lea     ($FFFFAC00).w, A1
                moveq   #$00, D0
                move.w  #$00FF, D1
                lea     ($FFFF0000), A1
                lea     (Options_Frame_Mappings), A0           ; Offset_0x009A60
                move.w  #$0070, D0
                bsr     EnigmaDec                              ; Offset_0x00177A
                lea     ($FFFF0160), A1
                lea     (Options_Frame_Mappings), A0           ; Offset_0x009A60
                move.w  #$2070, D0
                bsr     EnigmaDec                              ; Offset_0x00177A
                clr.b   ($FFFFFF6C).w
                bsr     Offset_0x009118
                addq.b  #$01, ($FFFFFF6C).w
                bsr     Offset_0x00918C
                addq.b  #$01, ($FFFFFF6C).w
                bsr     Offset_0x00918C
                clr.b   ($FFFFFF6C).w
                clr.b   ($FFFFF711).w
                clr.w   ($FFFFF7F0).w
                lea     (Menu_Animate), A2                     ; Offset_0x00874E
                jsr     (Dynamic_Normal)                       ; Offset_0x03FC78
                moveq   #$26, D0
                bsr     Opt_PalLoad1                               ; Offset_0x0026CE
                move.b  #Main_Menu_Snd, D0      ; $91
                jsr     (Play_Music)                           ; Offset_0x00131A
                clr.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                clr.l   ($FFFFEE00).w
                clr.l   ($FFFFEE04).w
                clr.w   ($FFFFFFB4).w
                clr.w   ($FFFFFFB6).w
                move.b  #$16, ($FFFFF62A).w                       ; $FFFFF62A
                bsr     Opt_DelayProgram                           ; Offset_0x00333E
                move.w  ($FFFFF60C).w, D0
                ori.b   #$40, D0
                move.w  D0, (VDP_Control_Port)                       ; $00C00004
                bsr     Opt_Pal_FadeTo                             ; Offset_0x002382
Offset_0x008FEE:
                move.b  #$16, ($FFFFF62A).w                       ; $FFFFF62A
                bsr     Opt_DelayProgram                           ; Offset_0x00333E
                move    #$2700, SR
                bsr     Offset_0x00918C
                bsr     Offset_0x009070
                bsr     Offset_0x009118
                move    #$2300, SR
                lea     (Menu_Animate), A2                     ; Offset_0x00874E
                jsr     (Dynamic_Normal)                       ; Offset_0x03FC78
                move.b  ($FFFFF605).w, D0
                or.b    ($FFFFF607).w, D0
                andi.b  #$80, D0
                bne.s   Menu_Go_Play_Mode                      ; Offset_0x00902A
                bra     Offset_0x008FEE
Menu_Go_Play_Mode: ; Offset_0x00902A:
                move.b  ($FFFFFF6C).w, D0
                bne.s   Menu_Go_Versus_Mode                    ; Offset_0x009046
                moveq   #$00, D0
                move.w  D0, (Two_Player_Flag).w                      ; $FFFFFFB8
                move.w  D0, ($FFFFFF6A).w
                move.w  D0, (Level_Id).w                             ; $FFFFFE10
                move.b  #gm_PlayMode, (Game_Mode).w             ; $0C, $FFFFF600
                rts
Menu_Go_Versus_Mode: ; Offset_0x009046:
                subq.b  #$01, D0
                bne.s   Offset_0x009068
                moveq   #$01, D0
                move.w  D0, (Two_Player_Flag).w      ; $FFFFFFB8
                move.w  D0, ($FFFFFF6A).w
                move.b  #gm_Versus_Mode_Menu, (Game_Mode).w     ; $1C, $FFFFF600
                move.b  #$00, ($FFFFFF68).w
                move.w  #$0000, ($FFFFFF7A).w
                rts
Offset_0x009068:
                move.b  #$00, (Game_Mode).w     ; $FFFFF600
                rts
Offset_0x009070:
                moveq   #$00, D2
                move.b  ($FFFFFF6C).w, D2
                move.b  ($FFFFF605).w, D0
                or.b    ($FFFFF607).w, D0
                btst    #$00, D0
                beq.s   Offset_0x00908C
                subq.b  #$01, D2
                bcc.s   Offset_0x00908C
                move.b  #$02, D2
Offset_0x00908C:
                btst    #$01, D0
                beq.s   Offset_0x00909C
                addq.b  #$01, D2
                cmpi.b  #$03, D2
                bcs.s   Offset_0x00909C
                moveq   #$00, D2
Offset_0x00909C:
                move.b  D2, ($FFFFFF6C).w
                lsl.w   #$02, D2
                move.b  Menu_Options_Boundaries(PC, D2), D3    ; Offset_0x00910C
                move.l  Menu_Options_Boundaries(PC, D2), A1    ; Offset_0x00910C
                move.w  (A1), D2                      
                btst    #$02, D0
                beq.s   Offset_0x0090B8
                subq.b  #$01, D2
                bcc.s   Offset_0x0090B8
                move.b  D3, D2
Offset_0x0090B8:
                btst    #$03, D0
                beq.s   Offset_0x0090C6
                addq.b  #$01, D2
                cmp.b   D3, D2
                bls.s   Offset_0x0090C6
                moveq   #$00, D2
Offset_0x0090C6:
                btst    #$06, D0
                beq.s   Offset_0x0090D6
                addi.b  #$10, D2
                cmp.b   D3, D2
                bls.s   Offset_0x0090D6
                moveq   #$00, D2
Offset_0x0090D6:
                move.w  D2, (A1)
                cmpi.b  #$02, ($FFFFFF6C).w
                bne.s   Offset_0x00910A
                andi.w  #$0030, D0
                beq.s   Offset_0x00910A
                move.w  (Sound_Test_Sound).w, D0                     ; $FFFFFF64
                addi.w  #$0080, D0
                jsr     (Play_Music)                           ; Offset_0x00131A
                lea     (Code_Level_Select), A0                ; Offset_0x00975C
                lea     (Code_14_Continues), A2                ; Offset_0x009762
                lea     ($FFFFFFB0).w, A1
                moveq   #$00, D2
                bsr     Offset_0x0096EA
Offset_0x00910A:
                rts
;-------------------------------------------------------------------------------                 
Menu_Options_Boundaries: ; Offset_0x00910C:
                dc.l    ($02<<$18)|(Player_Select_Flag&$00FFFFFF)    ; Jogador selecionado 
                dc.l    ($01<<$18)|(Two_Player_Items_Mode&$00FFFFFF) ; Opções do modo 2 Player
                dc.l    ($FF<<$18)|(Sound_Test_Sound&$00FFFFFF)      ; Intervalo do Sound Test    
;------------------------------------------------------------------------------- 
Offset_0x009118:
                bsr     Offset_0x0091FE
                moveq   #$00, D1
                move.b  ($FFFFFF6C).w, D1
                lsl.w   #$03, D1
                lea     (Menu_Options_Idx), A3                 ; Offset_0x009250
                lea     $00(A3, D1), A3
                move.w  #$6000, D0
                lea     ($FFFF0030), A2
                move.l  (A3)+, A1
                bsr     Offset_0x008F48
                lea     ($FFFF00B6), A2
                moveq   #$00, D1
                cmpi.b  #$02, ($FFFFFF6C).w
                beq.s   Offset_0x009160
                move.b  ($FFFFFF6C).w, D1
                lsl.w   #$02, D1
                lea     Menu_Options_Boundaries(PC), A1        ; Offset_0x00910C
                move.l  $00(A1, D1), A1
                move.w  (A1), D1
                lsl.w   #$02, D1
Offset_0x009160:
                move.l  $00(A4, D1), A1
                bsr     Offset_0x008F48
                cmpi.b  #$02, ($FFFFFF6C).w
                bne.s   Offset_0x00917A
                lea     ($FFFF00C2), A2
                bsr     Offset_0x00922C
Offset_0x00917A:
                lea     ($FFFF0000), A1
                move.l  (A3)+, D0
                moveq   #$15, D1
                moveq   #$07, D2
                jmp     (ShowVDPGraphics)                      ; Offset_0x0013CA
Offset_0x00918C:
                bsr     Offset_0x0091FE
                moveq   #$00, D1
                move.b  ($FFFFFF6C).w, D1
                lsl.w   #$03, D1
                lea     (Menu_Options_Idx), A3                 ; Offset_0x009250
                lea     $00(A3, D1), A3
                moveq   #$00, D0
                lea     ($FFFF0190), A2
                move.l  (A3)+, A1
                bsr     Offset_0x008F48
                lea     ($FFFF0216), A2
                moveq   #$00, D1
                cmpi.b  #$02, ($FFFFFF6C).w
                beq.s   Offset_0x0091D2
                move.b  ($FFFFFF6C).w, D1
                lsl.w   #$02, D1
                lea     Menu_Options_Boundaries(PC), A1        ; Offset_0x00910C
                move.l  $00(A1, D1), A1
                move.w  (A1), D1
                lsl.w   #$02, D1
Offset_0x0091D2:
                move.l  $00(A4, D1), A1
                bsr     Offset_0x008F48
                cmpi.b  #$02, ($FFFFFF6C).w
                bne.s   Offset_0x0091EC
                lea     ($FFFF0222), A2
                bsr     Offset_0x00922C
Offset_0x0091EC:
                lea     ($FFFF0160), A1
                move.l  (A3)+, D0
                moveq   #$15, D1
                moveq   #$07, D2
                jmp     (ShowVDPGraphics)                      ; Offset_0x0013CA
Offset_0x0091FE:
                lea     (Map_Player_Select_Jap_Idx), A4        ; Offset_0x009268
                tst.b   (Hardware_Id).w                              ; $FFFFFFD8
                bpl.s   Offset_0x009210
                lea     (Map_Player_Select_Idx), A4            ; Offset_0x009274
Offset_0x009210:
                tst.b   ($FFFFFF6C).w
                beq.s   Offset_0x00921C
                lea     (Map_Vs_Mode_Items_Idx), A4            ; Offset_0x009280
Offset_0x00921C:
                cmpi.b  #$02, ($FFFFFF6C).w
                bne.s   Offset_0x00922A
                lea     (Map_Sound_Test_Idx), A4               ; Offset_0x009288
Offset_0x00922A:
                rts
Offset_0x00922C:
                move.w  (Sound_Test_Sound).w, D1                     ; $FFFFFF64
                move.b  D1, D2
                lsr.b   #$04, D1
                bsr.s   Offset_0x009238
                move.b  D2, D1
Offset_0x009238:
                andi.w  #$000F, D1
                cmpi.b  #$0A, D1
                bcs.s   Offset_0x009246
                addi.b  #$04, D1
Offset_0x009246:
                addi.b  #$10, D1
                move.b  D1, D0
                move.w  D0, (A2)+
                rts
;-------------------------------------------------------------------------------                
Menu_Options_Idx: ; Offset_0x009250:
                dc.l    Map_Player_Select_Caption              ; Offset_0x009778
                dc.w    $4192, $0003
                dc.l    Map_Vs_Mode_Items_Caption              ; Offset_0x0097DA       
                dc.w    $4592, $0003
                dc.l    Map_Sound_Test_Caption                 ; Offset_0x00980C   
                dc.w    $4992, $0003  
;-------------------------------------------------------------------------------                
Map_Player_Select_Jap_Idx: ; Offset_0x009268: 
                dc.l    Map_Sonic_And_Miles                    ; Offset_0x00978A                 
                dc.l    Map_Sonic_Alone                        ; Offset_0x0097AA  
                dc.l    Map_Miles_Alone                        ; Offset_0x0097BA 
;-------------------------------------------------------------------------------                
Map_Player_Select_Idx: ; Offset_0x009274  
                dc.l    Map_Sonic_And_Tails                    ; Offset_0x00979A 
                dc.l    Map_Sonic_Alone                        ; Offset_0x0097AA
                dc.l    Map_Tails_Alone                        ; Offset_0x0097CA               
;-------------------------------------------------------------------------------                
Map_Vs_Mode_Items_Idx: ; Offset_0x009280:  
                dc.l    Map_All_Kinds_Items                    ; Offset_0x0097EC  
                dc.l    Map_Teleport_Only                      ; Offset_0x0097FC
;-------------------------------------------------------------------------------                
Map_Sound_Test_Idx: ; Offset_0x009288:          
                dc.l    Map_Sound_Test_Sound                   ; Offset_0x00981E
;===============================================================================
Offset_0x0096EA:
                move.w  ($FFFFFFB4).w, D0
                adda.w  D0, A0
                move.w  (Sound_Test_Sound).w, D0                     ; $FFFFFF64
                cmp.b   (A0), D0
                bne.s   Offset_0x009710
                addq.w  #$01, ($FFFFFFB4).w
                tst.b   $0001(A0)
                bne.s   Offset_0x009716
                move.w  #$0101, (A1)
                move.b  #Ring_Sfx, D0           ; $B5
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x009710:
                move.w  #$0000, ($FFFFFFB4).w
Offset_0x009716:
                move.w  ($FFFFFFB6).w, D0
                adda.w  D0, A2
                move.w  (Sound_Test_Sound).w, D0                     ; $FFFFFF64
                cmp.b   (A2), D0
                bne.s   Offset_0x009754
                addq.w  #$01, ($FFFFFFB6).w
                tst.b   $0001(A2)
                bne.s   Offset_0x00975A
                tst.w   D2
                bne.s   Offset_0x009744
                move.b  #$0F, ($FFFFFE18).w
                move.b  #Extra_Continue_Sfx-$80, D0 ; $3F - Referência incorreta
                jsr     (Play_Music)                           ; Offset_0x00131A
                bra.s   Offset_0x009754
Offset_0x009744:
                move.w  #$0007, ($FFFFFF90).w
                move.b  #Emerald_Snd, D0        ; $9D
                jsr     (Play_Music)                           ; Offset_0x00131A
Offset_0x009754:
                move.w  #$0000, ($FFFFFFB6).w
Offset_0x00975A:
                rts
;-------------------------------------------------------------------------------                    
Code_Level_Select: ;  Offset_0x00975C:
                dc.b    $19, $65, $09, $17, $00, $00
;-------------------------------------------------------------------------------                 
Code_14_Continues: ; Offset_0x009762:
                dc.b    $01, $01, $02, $04, $00, $00
;-------------------------------------------------------------------------------                  
;Code_Debug_Mode: ; Offset_0x009768:
;                dc.b    $01, $09, $09, $02, $01, $01, $02, $04, $00, $00
;-------------------------------------------------------------------------------                 
;Code_All_Emeralds: ; Offset_0x009772:
                dc.b    $04, $01, $02, $06, $00, $00
;-------------------------------------------------------------------------------  
Map_Player_Select_Caption: ; Offset_0x009778:
                dc.b    $10
                dc.b    _st,__,_P,_L,_A,_Y,_E,_R,__,_S,_E,_L,_E,_C,_T,__,_st                   
Map_Sonic_And_Miles: ; Offset_0x00978A: 
                dc.b    $0E
                dc.b    _S,_O,_N,_I,_C,__,_A,_N,_D,__,_M,_I,_L,_E,_S 
Map_Sonic_And_Tails: ; Offset_0x00979A: 
                dc.b    $0E
                dc.b    _S,_O,_N,_I,_C,__,_A,_N,_D,__,_T,_A,_I,_L,_S   
Map_Sonic_Alone: ; Offset_0x0097AA:
                dc.b    $0E
                dc.b    _S,_O,_N,_I,_C,__,_A,_L,_O,_N,_E,__,__,__,__
Map_Miles_Alone: ; Offset_0x0097BA:
                dc.b    $0E
                dc.b    _M,_I,_L,_E,_S,__,_A,_L,_O,_N,_E,__,__,__,__
Map_Tails_Alone: ; Offset_0x0097CA:
                dc.b    $0E
                dc.b    _T,_A,_I,_L,_S,__,_A,_L,_O,_N,_E,__,__,__,__
;-------------------------------------------------------------------------------     
Map_Vs_Mode_Items_Caption: ; Offset_0x0097DA:
                dc.b    $10
                dc.b    _st,__,_V,_S,__,_M,_O,_D,_E,__,_I,_T,_E,_M,_S,__,_st  
Map_All_Kinds_Items: ; Offset_0x0097EC:  
                dc.b    $0E
                dc.b    _A,_L,_L,__,_K,_I,_N,_D,_S,__,_I,_T,_E,_M,_S
Map_Teleport_Only: ; Offset_0x0097FC:
                dc.b    $0E
                dc.b    _T,_E,_L,_E,_P,_O,_R,_T,__,_O,_N,_L,_Y,__,__
;-------------------------------------------------------------------------------   
Map_Sound_Test_Caption: ; Offset_0x00980C:
                dc.b    $10
                dc.b    _st,__,__,_S,_O,_U,_N,_D,__,_T,_E,_S,_T,__,__,__,_st
Map_Sound_Test_Sound: ; Offset_0x00981E:   
                dc.b    $0E
               dc.b    __,__,__,__,__,__,__,__,__,__,__,__,__,__,__     
;-------------------------------------------------------------------------------  
                 
Menu_Animate: ; Offset_0x00874E:  
                dc.w    $0000                   ; Total de Animações     
                dc.l    ($FF<<$18)|Sonic_Miles  ; Offset_0x27CD2C
                dc.w    $0020                   ; VRAM 
                dc.w    $060A                   ; Quadros / Tiles
                dc.w    $00C7, $0A05, $1405, $1EC7, $1405, $0A05 ; Carregar quadro / Tempo do quadro    				
;------------------------------------------------------------------------------- 
Vs_Level_Select_Frame_Mappings: ; Offset_0x009A0E:
                incbin  'data\menu\vsslctmn.eni' 
;-------------------------------------------------------------------------------   
Options_Frame_Mappings: ; Offset_0x009A60:
                incbin  'data\menu\optframe.eni' 
;-------------------------------------------------------------------------------                             
Menu_Icons_Mappings: ; Offset_0x009BE0: 
                incbin  'data\menu\iconsmap.eni'     
OptMenu_Font:                                                    ; Offset_0x07C43A:
                incbin  'data\menu\menufont.nem'  				
Menu_Frame:                                                   ; Offset_0x07D990:
                incbin  'data\menu\menu_frm.nem'  		
Versus_Menu_Bg_Mappings:                                      ; Offset_0x07CB80:
                incbin  'data\menu\vsmenubg.eni' 
Sonic_Miles:                                                  ; Offset_0x07CD2C: 
                incbin  'data\menu\soncmils.dat'      				
;===============================================================================
; Menu de opções, menu de seleção de fases no modo 1 e 2 jogadores 
; [ Término ]
;=============================================================================== 