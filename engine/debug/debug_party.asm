      ; not IshiharaTeam
SetDebugTeam:
	ld de, DebugTeam
.loop
	ld a, [de]
	cp -1
	ret z
	ld [wcf91], a
	inc de
	ld a, [de]
	ld [wCurEnemyLVL], a
	inc de
	call AddPartyMon
	jr .loop

DebugTeam:
	db MEWTWO, 98 ; 255
	db MEW, 100
	db STARTER_PIKACHU, 5
;	db ARTICUNO, 9
;	db ZAPDOS, 9
;	db MOLTRES, 100
	db -1 ; end

DebugStart:
IF DEF(_DEBUG)
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a

	; Fly anywhere.
	dec a ; $ff
	ld [wTownVisitedFlag], a
	ld [wTownVisitedFlag + 1], a

	; Get all badges except Earth Badge.
	ld a, ~(1 << BIT_EARTHBADGE)
;	ld a, %11111111
;	ld a, %00000100
	ld [wObtainedBadges], a

	call SetDebugTeam

	; Mewtwo gets test moves
	ld a, STEEL_WING
	ld hl, wPartyMon1Moves
	ld [hl], a
	ld a, IRON_TAIL
	ld hl, wPartyMon1Moves + 1
	ld [hl], a
	ld a, METAL_CLAW
	ld hl, wPartyMon1Moves + 2
	ld [hl], a
	ld a, HAZE
	ld hl, wPartyMon1Moves + 3
	ld [hl], a

	; Mew gets four HM moves.
	ld hl, wPartyMon2Moves
	ld a, FLY
	ld [hli], a
	ld a, CUT
	ld [hli], a
	ld a, SURF
	ld [hli], a
	ld a, STRENGTH
	ld [hl], a

	; Pikachu gets Surf and Fly.
	ld a, FLY
	ld hl, wPartyMon3Moves + 2
	ld [hl], a
	ld a, SURF
	ld hl, wPartyMon3Moves + 3
	ld [hl], a

	; Pikachu get transformed into Starter Pikachu
	ld de, wPartyMon3OT
	ld hl, SamuelNameForPikachu3
	ld bc, NAME_LENGTH
	call CopyData ; copies bc bytes from hl to de
	ld de, wPartyMon3OTID
	xor a
	ld [de], a
	inc de
	ld [de], a
; this adds a status (SLP, PSN, etc) to the 3rd mon
; still not clear which number corresponds to which status
; bit-wise system?
; 1, 2 = SLP
; 10 = PSN but is also SLP
;	ld a, 10
;	ld de, wPartyMon3Status
;	ld [de], a

	; Get some debug items.
	ld hl, wNumBagItems
	ld de, DebugItemsList
.items_loop
	ld a, [de]
	cp -1
	jr z, .items_end
	ld [wcf91], a
	inc de
	ld a, [de]
	inc de
	ld [wItemQuantity], a
	call AddItemToInventory
	jr .items_loop
.items_end

	; Complete the Pokédex.
	ld hl, wPokedexOwned
	call DebugSetPokedexEntries
	ld hl, wPokedexSeen
	call DebugSetPokedexEntries
	SetEvent EVENT_GOT_POKEDEX

	; Rival chose Jolteon.
	ld hl, wRivalStarter
	ld a, RIVAL_STARTER_JOLTEON
	ld [hli], a
	ld a, NUM_POKEMON
	ld [hli], a ; hl = wUnknownDebugByte
	ld a, STARTER_PIKACHU
	ld [hl], a ; hl = wPlayerStarter

	; Select gender: 0 male, 1 female, 2 enby
	ld a, 2
	ld [wPlayerGender], a

	; Give max money.
	ld hl, wPlayerMoney
	ld a, $99
	ld [hli], a
	ld [hli], a
	ld [hl], a

;	; set fast text and set mode - new
;	ld a, %01100001
;	ld [wOptions], a

;	SetEvent EVENT_BEAT_OBSIDIAN_WAREHOUSE_FINAL_TRAINER_4
	SetEvent EVENT_BEAT_CHAMPION_FINAL_REMATCH
;	SetEvent EVENT_GOT_HM01
	SetEvent EVENT_BEAT_LEAGUE_AT_LEAST_ONCE
	SetEvent EVENT_SS_ANNE_LEFT
;	SetEvent EVENT_LEFT_BILLS_HOUSE_AFTER_HELPING

;	SetEvent EVENT_BEAT_POWER_PLANT_VOLTORB_0
;	SetEvent EVENT_BEAT_POWER_PLANT_VOLTORB_1
;	SetEvent EVENT_BEAT_POWER_PLANT_VOLTORB_2
;	SetEvent EVENT_BEAT_POWER_PLANT_VOLTORB_3
;	SetEvent EVENT_BEAT_POWER_PLANT_VOLTORB_4
;	SetEvent EVENT_BEAT_POWER_PLANT_VOLTORB_5
;	SetEvent EVENT_BEAT_POWER_PLANT_VOLTORB_6
;	SetEvent EVENT_BEAT_POWER_PLANT_VOLTORB_7

;    SetEvent EVENT_OBTAIN_MAP_PIECE_1_BIRD_FAN_CLUB
;    SetEvent EVENT_OBTAIN_MAP_PIECE_2_PIGEON
;    SetEvent EVENT_OBTAIN_MAP_PIECE_3_TREASURE_HUNTER
;    SetEvent EVENT_OBTAIN_MAP_PIECE_4_RESCUED_TRAVELER

	ret

DebugSetPokedexEntries:
	ld b, wPokedexOwnedEnd - wPokedexOwned - 1
	ld a, %11111111
.loop
	ld [hli], a
	dec b
	jr nz, .loop
	ld [hl], %11111111
	ret

SamuelNameForPikachu3: db "SAMUEL @" ; new, with a space to make it harder for players to emulate it

DebugItemsList:
;    db MYSTERY_MAP, 1
;	db SUPER_REPEL, 3
;	db REPEL, 3
;	db MAX_REPEL, 3
;	db LUNAR_RELIC, 1
;	db PP_UP, 42
;   db OAKS_PARCEL, 1
	db PERFECTER, 50
	db SUPER_ROD, 1
;	db GOOD_ROD, 1
	db MASTER_BALL, 99
;	db MEGA_STONE_X, 99
	db TOWN_MAP, 1
	db BICYCLE, 1
	db FULL_RESTORE, 99
	db SECRET_KEY, 1
	db CARD_KEY, 1
;	db POKE_DOLL, 99 ; FULL_HEAL
;	db REVIVE, 99
	db S_S_TICKET, 1
	db LIFT_KEY, 1
	db POKE_FLUTE, 1
	db ESCAPE_ROPE, 99
	db LEGEND_CANDY, 42
	db RARE_CANDY, 42
	db GOLD_TEETH, 1
	db SILPH_SCOPE, 1
;	db LAVA_STONE, 1
;	db MAGMA_STONE, 1
;	db MOLTEN_STONE, 1
;	db EXP_ALL, 1
	db -1 ; end

DebugUnusedList:
	db OLD_AMBER, 1
	db DOME_FOSSIL, 1
	db HELIX_FOSSIL, 1
	db X_ACCURACY, 99
	db DIRE_HIT, 99
	db FRESH_WATER, 1
	db S_S_TICKET, 1
	db GOLD_TEETH, 1
	db COIN_CASE, 1
	db POKE_FLUTE, 1
	db LIFT_KEY, 1
	db ETHER, 99
	db MAX_ETHER, 99
	db ELIXER, 99
	db MAX_ELIXER, 99
;	db TM_RAZOR_WIND, 10
	db TM_HYDRO_PUMP, 10
	db TM_METEOR_MASH, 10
	db TM_BLIZZARD, 10
	db TM_HYPER_BEAM, 10
	db TM_STONE_EDGE, 10
;	db TM_DRAGON_RAGE, 10
	db TM_MIMIC, 10
	db TM_BIDE, 10
	db TM_METRONOME, 10
	db TM_SELFDESTRUCT, 10
	db TM_DARK_PULSE, 10
	db TM_BRAVE_BIRD, 10
	db TM_CLOSE_COMBAT, 10
	db TM_REST, 10
	db TM_SUBSTITUTE, 10
	db -1 ; end
ELSE
	ret
ENDC
