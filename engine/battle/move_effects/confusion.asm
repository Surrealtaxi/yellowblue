Confusion10SideEffect_::
; new, to handle luck: secondary effects
	ld a, [hWhoseTurn]
	and a
	jr z, .playersTurn
; enemy's turn
	ld a, [wLuckSecondaryEffects] ; 0=NORMAL, 1=PLAYER MIN, 2=ENEMY MAX, 3=BOTH
	and a
	jr z, .vanillaLuck
	cp 1
	jr z, .vanillaLuck
; enemy's turn, and their luck is max
	jr ConfusionSideEffectSuccess
.playersTurn
	ld a, [wLuckSecondaryEffects]
	and a
	jr z, .vanillaLuck
	cp 2
	jr z, .vanillaLuck
; player's turn and their luck is minimum
	ret
.vanillaLuck
; back to vanilla
	call BattleRandom2 ; edited into the copy
	cp 10 percent ; chance of confusion
	ret nc
	jr ConfusionSideEffectSuccess

Confusion20SideEffect_::
; new, to handle luck: secondary effects
	ld a, [hWhoseTurn]
	and a
	jr z, .playersTurn
; enemy's turn
	ld a, [wLuckSecondaryEffects] ; 0=NORMAL, 1=PLAYER MIN, 2=ENEMY MAX, 3=BOTH
	and a
	jr z, .vanillaLuck
	cp 1
	jr z, .vanillaLuck
; enemy's turn, and their luck is max
	jr ConfusionSideEffectSuccess
.playersTurn
	ld a, [wLuckSecondaryEffects]
	and a
	jr z, .vanillaLuck
	cp 2
	jr z, .vanillaLuck
; player's turn and their luck is minimum
	ret
.vanillaLuck
; back to vanilla
	call BattleRandom2 ; edited into the copy
	cp 20 percent ; chance of confusion
	ret nc
	jr ConfusionSideEffectSuccess

Confusion30SideEffect_::
; new, to handle luck: secondary effects
	ld a, [hWhoseTurn]
	and a
	jr z, .playersTurn
; enemy's turn
	ld a, [wLuckSecondaryEffects] ; 0=NORMAL, 1=PLAYER MIN, 2=ENEMY MAX, 3=BOTH
	and a
	jr z, .vanillaLuck
	cp 1
	jr z, .vanillaLuck
; enemy's turn, and their luck is max
	jr ConfusionSideEffectSuccess
.playersTurn
	ld a, [wLuckSecondaryEffects]
	and a
	jr z, .vanillaLuck
	cp 2
	jr z, .vanillaLuck
; player's turn and their luck is minimum
	ret
.vanillaLuck
; back to vanilla
	call BattleRandom2 ; edited into the copy
	cp 30 percent ; chance of confusion
	ret nc
	jr ConfusionSideEffectSuccess

ConfusionEffect_::
	callfar CheckTargetSubstitute ; edited into a callfar
	jr nz, ConfusionEffectFailed
	callfar MoveHitTest ; apply accuracy tests, edited into a callfar
	ld a, [wMoveMissed]
	and a
	jr nz, ConfusionEffectFailed

ConfusionSideEffectSuccess:
	ldh a, [hWhoseTurn]
	and a
	ld hl, wEnemyBattleStatus1
	ld bc, wEnemyConfusedCounter
	ld a, [wPlayerMoveEffect]
	jr z, .confuseTarget
	ld hl, wPlayerBattleStatus1
	ld bc, wPlayerConfusedCounter
	ld a, [wEnemyMoveEffect]
.confuseTarget
	bit CONFUSED, [hl] ; is mon confused?
	jr nz, ConfusionEffectFailed
	set CONFUSED, [hl] ; mon is now confused
	push af
; new, to handle luck: statuses affliction
	ld a, [hWhoseTurn]
	and a
	jr z, .playersTurn
; enemy's turn
	ld a, [wLuckStatusesAffliction] ; 0=NORMAL, 1=PLAYER MIN, 2=ENEMY MAX, 3=BOTH
	and a
	jr z, .vanillaLuck
	cp 1
	jr z, .vanillaLuck
; enemy's turn, and their luck is max
	ld a, 5
	jr .confusionTurnsSet
.playersTurn
	ld a, [wLuckStatusesAffliction]
	and a
	jr z, .vanillaLuck
	cp 2
	jr z, .vanillaLuck
; player's turn and their luck is minimum
	ld a, 2
	jr .confusionTurnsSet
.vanillaLuck
; back to vanilla
	call BattleRandom2 ; edited into the copy
	and $3
	inc a
	inc a
.confusionTurnsSet ; new label, to handle luck: statuses affliction
	ld [bc], a ; confusion status will last 2-5 turns
	pop af
	cp CONFUSION_SIDE_EFFECT1			; simplified version
	jr nc, .doneConfusion				; skip the animation if EFFECT-CONFUSION_SIDE_EFFECT1 has no carry, i.e. the difference is >=0
	call PlayCurrentMoveAnimation2Copy	; Vortiene's suggestion; edited into the copy
.doneConfusion							; Vortiene's suggestion
	ld hl, BecameConfusedText			; Vortiene's suggestion
	jp PrintText						; Vortiene's suggestion

BecameConfusedText:
	text_far _BecameConfusedText
	text_end

ConfusionEffectFailed: 				; this seems like I've modified it ok?
	cp CONFUSION_SIDE_EFFECT1
	ret z
	cp CONFUSION_SIDE_EFFECT2
	ret z
	cp CONFUSION_SIDE_EFFECT3
	ret z
	ld c, 50
	call DelayFrames
	jpfar ConditionalPrintButItFailed ; edited into a jpfar
