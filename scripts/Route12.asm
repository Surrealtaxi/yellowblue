Route12_Script:
	call EnableAutoTextBoxDrawing
	ld hl, Route12TrainerHeaders
	ld de, Route12_ScriptPointers
	ld a, [wRoute12CurScript]
	call ExecuteCurMapScriptInTable
	ld [wRoute12CurScript], a
	ret

Route12Script_59606:
	xor a
	ld [wJoyIgnore], a
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

Route12_ScriptPointers:
	dw Route12Script0
	dw DisplayEnemyTrainerTextAndStartBattle
	dw EndTrainerBattle
	dw Route12Script3
	dw Route12Script4 ; new, trigger battle vs Rival
	dw Route12Script5 ; new
	dw Route12Script6 ; new

AroundSnorlaxRoute12Coords: ; new
	dbmapcoord  9, 62
	dbmapcoord 11, 62
	dbmapcoord 10, 61
	db -1 ; end

Route12Script0:
; new, for Rival Snorlax battle
; we need to: NOT have faced this rival already; be around Snorlax; have the flute in the bag
	CheckEvent EVENT_FACED_SNORLAX_RIVAL
	jp nz, .vanillaCode
	ld hl, AroundSnorlaxRoute12Coords
	call ArePlayerCoordsInArray
	jr nz, .vanillaCode
	ld b, POKE_FLUTE
	call IsItemInBag
	jr z, .vanillaCode
; if we are here, we begin triggering the battle vs the rival
; walking code
	ld a, [wWalkBikeSurfState]
	and a
	jr z, .walking
	call StopAllMusic
.walking
	ld c, BANK(Music_MeetRival)
	ld a, MUSIC_MEET_RIVAL
	call PlayMusic
	xor a
	ldh [hJoyHeld], a
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, [wXCoord]
	cp 9 ; where is the player standing?
	jr z, .playerLeftOfSnorlax ; handles it differently, because loads another sprite
	cp 10
	jr z, .playerAboveOfSnorlax
; else, the player is to the right of Snorlax
	ld a, HS_ROUTE_12_RIVAL_RIGHT
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, PLAYER_DIR_UP ; TBC
	ld [wPlayerMovingDirection], a
	ld de, Route12FMovements1_Right
	ld a, 13 ; index of Rival's sprite right
	ldh [hSpriteIndex], a
	jr .continue
.playerLeftOfSnorlax
	ld a, HS_ROUTE_12_RIVAL_LEFT
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, PLAYER_DIR_LEFT ; TBC
	ld [wPlayerMovingDirection], a
	ld de, Route12FMovements1_Left
	ld a, 12 ; index of Rival's sprite left
	ldh [hSpriteIndex], a
	jr .continue
.playerAboveOfSnorlax
	ld a, HS_ROUTE_12_RIVAL_RIGHT
	ld [wMissableObjectIndex], a
	predef ShowObject
	ld a, PLAYER_DIR_UP ; TBC
	ld [wPlayerMovingDirection], a
	ld de, Route12FMovements1_Above
	ld a, 13 ; index of Rival's sprite right
	ldh [hSpriteIndex], a
.continue
	call MoveSprite
	ld a, $4 ; testing
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret
.vanillaCode
; back to vanilla
	CheckEventHL EVENT_BEAT_ROUTE12_SNORLAX
	jp nz, CheckFightingMapTrainers
	CheckEventReuseHL EVENT_FIGHT_ROUTE12_SNORLAX
	ResetEventReuseHL EVENT_FIGHT_ROUTE12_SNORLAX
	jp z, CheckFightingMapTrainers
	ld a, $10 ; edited, +1 for new Hiker, +2 for rival
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld a, SNORLAX
	ld [wCurOpponent], a
	ld a, 30
	ld [wCurEnemyLVL], a
	ld a, HS_ROUTE_12_SNORLAX
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, $3
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

Route12FMovements1_Right: ; new
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_DOWN
Route12FMovements1_Above:
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db NPC_MOVEMENT_DOWN
	db -1 ; end

Route12FMovements1_Left: ; new
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db NPC_MOVEMENT_RIGHT
	db -1 ; end

Route12Script3:
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route12Script_59606
	call UpdateSprites
	ld a, [wBattleResult]
	cp $2
	jr z, .asm_59664
	ld a, $11 ; edited, +1 for new Hiker, +2 for rival
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
.asm_59664
	SetEvent EVENT_BEAT_ROUTE12_SNORLAX
	call Delay3
	ld a, $0
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

; ----------------------------------------------

Route12Script4: ; new
	ld a, [wd730] ; bit 0: NPC being moved by script
	bit 0, a
	ret nz
	xor a
	ld [wJoyIgnore], a
	ld a, 12 ; Rival's text ID, pre-battle
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	ld hl, wd72d ; nobody knows what it does lol
	set 6, [hl]
	set 7, [hl]
	ld hl, Route12RivalText_Win ; text if player wins
	ld de, Route12RivalText_Lose ; text if player loses
	call SaveEndBattleTextPointers
	ld a, OPP_RIVAL2
	ld [wCurOpponent], a
	ld a, 5
	ld [wTrainerNo], a
	xor a
	ldh [hJoyHeld], a
	call Route12Script_RivalFacingRightOrDown
	SetEvent EVENT_FACED_SNORLAX_RIVAL
	ld a, 5
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

Route12Script5: ; new
	ld a, [wIsInBattle]
	cp $ff
	jp z, Route12Script_ResetIfLoseVsRival
; stuff to do if we defeat the rival
	call Route12Script_RivalFacingRightOrDown
	ld a, $f0
	ld [wJoyIgnore], a
	ld a, 18 ; Rival's text ID
	ldh [hSpriteIndexOrTextID], a
	call DisplayTextID
	call StopAllMusic
	farcall Music_RivalAlternateStart
	ld a, [wXCoord]
	cp 9
	jr z, .playerIsLeftOfSnorlax
	ld a, 13 ; Rival's sprite ID
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld de, Route12FMovements2_Right
;	ld a, 13 ; Rival's sprite ID
;	ldh [hSpriteIndex], a
	jr .continue
.playerIsLeftOfSnorlax
	ld a, 12 ; Rival's sprite ID
	ldh [hSpriteIndex], a
	call SetSpriteMovementBytesToFF
	ld de, Route12FMovements2_Left
;	ld a, 12 ; Rival's sprite ID
;	ldh [hSpriteIndex], a
.continue
	call MoveSprite
	ld a, $6
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

Route12FMovements2_Right: ; new
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db NPC_MOVEMENT_UP
	db -1 ; end

Route12FMovements2_Left: ; new
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_LEFT
	db NPC_MOVEMENT_LEFT
	db -1 ; end

Route12Script_ResetIfLoseVsRival: ; new
	xor a
	ld [wJoyIgnore], a
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ld a, HS_ROUTE_12_SNORLAX
	ld [wMissableObjectIndex], a
	predef_jump HideObject

Route12Script_RivalFacingRightOrDown:
	ld a, [wXCoord]
	cp 9 ; where is the player standing?
	jr z, .playerLeftOfSnorlax ; handles it differently, because loads another sprite
	ld a, 13
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_DOWN
	jr .continue
.playerLeftOfSnorlax
	ld a, 12
	ldh [hSpriteIndex], a
	ld a, SPRITE_FACING_RIGHT
.continue
	ldh [hSpriteFacingDirection], a
	call SetSpriteFacingDirectionAndDelay ; face object
	ret

Route12Script6: ; new
	ld a, [wd730]
	bit 0, a
	ret nz
	ld a, HS_ROUTE_12_RIVAL_RIGHT
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, HS_ROUTE_12_RIVAL_LEFT
	ld [wMissableObjectIndex], a
	predef HideObject
	xor a
	ld [wJoyIgnore], a
	call PlayDefaultMusic
	ld a, HS_ROUTE_16_SNORLAX
	ld [wMissableObjectIndex], a
	predef HideObject
	ld a, $0
	ld [wRoute12CurScript], a
	ld [wCurMapScript], a
	ret

; ==============================================

Route12_TextPointers:
	dw Route12Text1
	dw Route12TextObsidianMinesHiker ; new, can't be bothered to reorder and rename following labels lol
	dw Route12Text2
	dw Route12Text3
	dw Route12Text4
	dw Route12Text5
	dw Route12Text6
	dw Route12Text7
	dw Route12Text8
	dw PickUpItemText
	dw PickUpItemText
	dw Route12TextRival ; new, rival left; ID=12
	dw Route12TextRival ; new, rival right; ID=13
	dw Route12Text11 ; sign
	dw Route12Text12 ; sign
	dw Route12Text13
	dw Route12Text14
	dw Route12TextRivalPostBattle ; new, TBC; ID=18

Route12TrainerHeaders:
	def_trainers 3 ; edited, +1 for new Hiker
Route12TrainerHeader0:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_0, 4, Route12BattleText1, Route12EndBattleText1, Route12AfterBattleText1
Route12TrainerHeader1:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_1, 4, Route12BattleText2, Route12EndBattleText2, Route12AfterBattleText2
Route12TrainerHeader2:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_2, 4, Route12BattleText3, Route12EndBattleText3, Route12AfterBattleText3
Route12TrainerHeader3:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_3, 4, Route12BattleText4, Route12EndBattleText4, Route12AfterBattleText4
Route12TrainerHeader4:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_4, 4, Route12BattleText5, Route12EndBattleText5, Route12AfterBattleText5
Route12TrainerHeader5:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_5, 4, Route12BattleText6, Route12EndBattleText6, Route12AfterBattleText6
Route12TrainerHeader6:
	trainer EVENT_BEAT_ROUTE_12_TRAINER_6, 1, Route12BattleText7, Route12EndBattleText7, Route12AfterBattleText7
	db -1 ; end

Route12TextObsidianMinesHiker: ; new
	text_far _Route12TextObsidianMinesHiker
	text_end

Route12Text1:
	text_far _Route12Text1
	text_end

Route12Text13:
	text_far _Route12Text13
	text_end

Route12Text14:
	text_far _Route12Text14
	text_end

Route12Text2:
	text_asm
	ld hl, Route12TrainerHeader0
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText1:
	text_far _Route12BattleText1
	text_end

Route12EndBattleText1:
	text_far _Route12EndBattleText1
	text_end

Route12AfterBattleText1:
	text_far _Route12AfterBattleText1
	text_end

Route12Text3:
	text_asm
	ld hl, Route12TrainerHeader1
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText2:
	text_far _Route12BattleText2
	text_end

Route12EndBattleText2:
	text_far _Route12EndBattleText2
	text_end

Route12AfterBattleText2:
	text_far _Route12AfterBattleText2
	text_end

Route12Text4:
	text_asm
	ld hl, Route12TrainerHeader2
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText3:
	text_far _Route12BattleText3
	text_end

Route12EndBattleText3:
	text_far _Route12EndBattleText3
	text_end

Route12AfterBattleText3:
	text_far _Route12AfterBattleText3
	text_end

Route12Text5:
	text_asm
	ld hl, Route12TrainerHeader3
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText4:
	text_far _Route12BattleText4
	text_end

Route12EndBattleText4:
	text_far _Route12EndBattleText4
	text_end

Route12AfterBattleText4:
	text_far _Route12AfterBattleText4
	text_end

Route12Text6:
	text_asm
	ld hl, Route12TrainerHeader4
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText5:
	text_far _Route12BattleText5
	text_end

Route12EndBattleText5:
	text_far _Route12EndBattleText5
	text_end

Route12AfterBattleText5:
	text_far _Route12AfterBattleText5
	text_end

Route12Text7:
	text_asm
	ld hl, Route12TrainerHeader5
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText6:
	text_far _Route12BattleText6
	text_end

Route12EndBattleText6:
	text_far _Route12EndBattleText6
	text_end

Route12AfterBattleText6:
	text_far _Route12AfterBattleText6
	text_end

Route12Text8:
	text_asm
	ld hl, Route12TrainerHeader6
	call TalkToTrainer
	jp TextScriptEnd

Route12BattleText7:
	text_far _Route12BattleText7
	text_end

Route12EndBattleText7:
	text_far _Route12EndBattleText7
	text_end

Route12AfterBattleText7:
	text_far _Route12AfterBattleText7
	text_end

Route12Text11:
	text_far _Route12Text11
	text_end

Route12Text12:
	text_far _Route12Text12
	text_end

Route12TextRival: ; new
	text_far _Route12TextRival
	text_end

Route12TextRivalPostBattle: ; new
	text_far _Route12TextRivalPostBattle
	text_end

Route12RivalText_Win: ; new
	text_far _Route12RivalText_Win
	text_end

Route12RivalText_Lose: ; new
	text_far _Route12RivalText_Lose
	text_end
