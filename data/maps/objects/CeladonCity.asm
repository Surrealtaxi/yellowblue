CeladonCity_Object: ; edited, +14 on the y coordinate of everything pre-LUNAR_SHRINE because of north expansion
	db $f ; border block

	def_warp_events
	warp_event  8, 27, CELADON_MART_1F, 1
	warp_event 10, 27, CELADON_MART_1F, 3
	warp_event 24, 23, CELADON_MANSION_1F, 1
	warp_event 24, 17, CELADON_MANSION_1F, 3
	warp_event 25, 17, CELADON_MANSION_1F, 3
	warp_event 41, 23, CELADON_POKECENTER, 1
	warp_event 12, 41, CELADON_GYM, 1
	warp_event 28, 33, GAME_CORNER, 1
	warp_event 39, 33, CELADON_MART_5F, 1
	warp_event 33, 33, GAME_CORNER_PRIZE_ROOM, 1 ; useless
	warp_event 27, 41, CELADON_DINER, 1 ; updated
	warp_event 31, 41, CELADON_CHIEF_HOUSE, 1 ; updated
	warp_event 35, 41, CELADON_HOTEL, 1 ; updated
	warp_event 44, 41, CELADON_UNIVERSITY, 1 ; new
	warp_event 12,  7, MT_MOON_B2F, 29 ; new
	warp_event 36,  8, CELADON_CHIEF_HOUSE, 3 ; LUNAR_SHRINE

	def_bg_events
	bg_event 27, 29, 13 ; CeladonCityText10
	bg_event 19, 29, 14 ; CeladonCityText11
	bg_event 42, 23, 15 ; PokeCenterSignText
	bg_event 13, 43, 16 ; CeladonCityText13 ; Gym
	bg_event 21, 23, 17 ; CeladonCityText14
	bg_event 12, 27, 18 ; CeladonCityText15 ; Mart
	bg_event 39, 35, 19 ; CeladonCityText16
	bg_event 33, 35, 20 ; CeladonCityText17
	bg_event 27, 35, 21 ; CeladonCityText18
	bg_event 27, 43, 22 ; CeladonCityText19 ; new, Diner
	bg_event 35, 43, 23 ; CeladonCityText20 ; new, Hotel
	bg_event 43, 43, 24 ; CeladonCityText21 ; new, University

	def_object_events
	object_event  8, 31, SPRITE_LITTLE_GIRL, WALK, ANY_DIR, 1 ; person
	object_event 11, 42, SPRITE_GRAMPS, STAY, UP, 2 ; person
	object_event 14, 33, SPRITE_GIRL, WALK, UP_DOWN, 3 ; person
	object_event 25, 36, SPRITE_GRAMPS, STAY, DOWN, 4 ; person
	object_event 22, 30, SPRITE_GRAMPS, STAY, DOWN, 5 ; person
	object_event 32, 26, SPRITE_FISHER, STAY, LEFT, 6 ; person
	object_event 30, 26, SPRITE_MONSTER, STAY, RIGHT, 7 ; person
	object_event 32, 43, SPRITE_ROCKET, WALK, LEFT_RIGHT, 8 ; person
	object_event 42, 28, SPRITE_ROCKET, WALK, LEFT_RIGHT, 9 ; person
	object_event 28, 49, SPRITE_ROCKET, STAY, DOWN, 10 ; new, guard the bridge
	object_event 29, 49, SPRITE_ROCKET, STAY, DOWN, 11 ; new, guard the bridge
	object_event 17, 26, SPRITE_TRAVELER, STAY, ANY_DIR, 12 ; new, traveler

	def_warps_to CELADON_CITY
