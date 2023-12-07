DEF HIDE EQU $11
DEF SHOW EQU $15

; MissableObjects indexes (see data/maps/hide_show_data.asm)
; this is a list of the sprites that can be enabled/disabled during the game
; TODO: mark sprite constants with an X that are never used
; new: this first block now corresponds to MissableObjectsBase

	const_def							   ; equivalent to "const_value=0"
	const HS_PALLET_TOWN_OAK               ; 00
	const HS_PALLET_TOWN_DARK_GUIDE        ; new
	const HS_LYING_OLD_MAN                 ; 01
	const HS_OLD_MAN_1                     ; 02
	const HS_OLD_MAN                       ; 03
	const HS_VIRIDIAN_CITY_TRAVELER        ; new
	const HS_PEWTER_CITY_TRAVELER          ; new
	const HS_CERULEAN_RIVAL                ; 06
	const HS_CERULEAN_ROCKET               ; 07
	const HS_CERULEAN_GUARD_1              ; 08
	const HS_CERULEAN_CAVE_GUY             ; 09
	const HS_CERULEAN_GUARD_2              ; 0A
	const HS_CERULEAN_CITY_TRAVELER        ; new
	const HS_VERMILION_MACHOKE             ; new
	const HS_VERMILION_MACHAMP             ; new
	const HS_VERMILION_CITY_TRAVELER       ; new
	const HS_VERMILION_CITY_ITEM_1         ; new
	const HS_CELADON_ROCKET_1			   ; new
	const HS_CELADON_ROCKET_2			   ; new
	const HS_CELADON_ROCKET_GUARD_1		   ; new
	const HS_CELADON_ROCKET_GUARD_2		   ; new
	const HS_CELADON_CITY_TRAVELER		   ; new
	const HS_SAFFRON_CITY_1                ; 0B
	const HS_SAFFRON_CITY_2                ; 0C
	const HS_SAFFRON_CITY_3                ; 0D
	const HS_SAFFRON_CITY_4                ; 0E
	const HS_SAFFRON_CITY_5                ; 0F
	const HS_SAFFRON_CITY_TRAVELER         ; new/edited
	const HS_SAFFRON_CITY_7                ; 11
	const HS_SAFFRON_CITY_8                ; 12
	const HS_SAFFRON_CITY_9                ; 13
	const HS_SAFFRON_CITY_A                ; 14
	const HS_SAFFRON_CITY_B                ; 15
	const HS_SAFFRON_CITY_C                ; 16
	const HS_SAFFRON_CITY_D                ; 17
	const HS_SAFFRON_CITY_E                ; 18
	const HS_ROUTE_2_ITEM_1                ; 1A
	const HS_ROUTE_2_ITEM_2                ; 1B
	const HS_ROUTE_4_HIKER_1               ; new
	const HS_ROUTE_4_HIKER_2               ; new
	const HS_ROUTE_4_ITEM                  ; 1C
	const HS_ROUTE_4_BOULDER_1             ; new
	const HS_ROUTE_4_BOULDER_2             ; new
	const HS_ROUTE_4_BOULDER_3             ; new
	const HS_ROUTE_4_BOULDER_4             ; new
	const HS_ROUTE_9_ITEM                  ; 1D
	const HS_ROUTE_12_SNORLAX              ; 1E
	const HS_ROUTE_12_HIKER	               ; new
	const HS_ROUTE_12_ITEM_1               ; 1F
	const HS_ROUTE_12_ITEM_2               ; 20
	const HS_ROUTE_15_ITEM                 ; 21
	const HS_ROUTE_16_SNORLAX              ; 22
	const HS_ROUTE_20_MISTY				   ; new
	const HS_ROUTE_21_OAK				   ; new
	const HS_ROUTE_22_RIVAL_1              ; 23
	const HS_ROUTE_22_RIVAL_2              ; 24
	const HS_NUGGET_BRIDGE_GUY             ; 25
	const HS_ROUTE_24_ITEM                 ; 26
	const HS_ROUTE_25_ITEM                 ; 27
	const HS_DAISY_SITTING                 ; 28
	const HS_DAISY_WALKING                 ; 29
	const HS_TOWN_MAP                      ; 2A
	const HS_OAKS_LAB_RIVAL                ; 2B
	const HS_STARTER_BALL_1                ; 2C
	const HS_OAKS_LAB_OAK_1                ; 2D
	const HS_POKEDEX_1                     ; 2E
	const HS_POKEDEX_2                     ; 2F
	const HS_OAKS_LAB_OAK_2                ; 30
	const HS_OAKS_LAB_GIOVANNI             ; new
	const HS_VIRIDIAN_GYM_GIOVANNI         ; 31
	const HS_VIRIDIAN_GYM_ITEM_1           ; 32
	const HS_VIRIDIAN_GYM_ITEM_2           ; new
	const HS_OLD_AMBER                     ; 33
	const HS_CERULEAN_BULBASAUR            ; 34
	const HS_CERULEAN_CAVE_1F_ITEM_1       ; 35
	const HS_CERULEAN_CAVE_1F_ITEM_2       ; 36
	const HS_CERULEAN_CAVE_1F_ITEM_3       ; 37
	const HS_CERULEAN_CAVE_1F_ITEM_4       ; 38
	const HS_POKEMON_TOWER_2F_RIVAL        ; 39
	const HS_POKEMON_TOWER_3F_ITEM         ; 3A
	const HS_POKEMON_TOWER_4F_ITEM_1       ; 3B
	const HS_POKEMON_TOWER_4F_ITEM_2       ; 3C
	const HS_POKEMON_TOWER_4F_ITEM_3       ; 3D
	const HS_POKEMON_TOWER_5F_ITEM         ; 3E
	const HS_POKEMON_TOWER_6F_AGATHA       ; new
	const HS_POKEMON_TOWER_6F_ITEM_1       ; 3F
	const HS_POKEMON_TOWER_6F_ITEM_2       ; 40
	const HS_POKEMON_TOWER_7F_JESSIE       ; 41
	const HS_POKEMON_TOWER_7F_JAMES        ; 42
	const HS_POKEMON_TOWER_7F_MR_FUJI      ; 43
	const HS_MR_FUJIS_HOUSE_MR_FUJI        ; 44
	const HS_CELADON_MANSION_EEVEE_GIFT    ; 45
	const HS_GAME_CORNER_ROCKET            ; 46
	const HS_WARDENS_HOUSE_ITEM            ; 47
	const HS_POKEMON_MANSION_1F_ITEM_1     ; 48
	const HS_POKEMON_MANSION_1F_ITEM_2     ; 49
	const HS_FIGHTING_DOJO_BRUNO           ; new
	const HS_FIGHTING_DOJO_GIFT_1          ; 4A
	const HS_FIGHTING_DOJO_GIFT_2          ; 4B
	const HS_FIGHTING_DOJO_GIFT_3          ; new
	const HS_SILPH_CO_1F_RECEPTIONIST      ; 4C
	const HS_POWER_PLANT_LT_SURGE          ; new
	const HS_VOLTORB_1                     ; 4D
	const HS_VOLTORB_2                     ; 4E
	const HS_VOLTORB_3                     ; 4F
	const HS_ELECTRODE_1                   ; 50
	const HS_VOLTORB_4                     ; 51
	const HS_VOLTORB_5                     ; 52
	const HS_ELECTRODE_2                   ; 53
	const HS_VOLTORB_6                     ; 54
	const HS_ZAPDOS                        ; 55
	const HS_POWER_PLANT_ITEM_1            ; 56
	const HS_POWER_PLANT_ITEM_2            ; 57
	const HS_POWER_PLANT_ITEM_3            ; 58
	const HS_POWER_PLANT_ITEM_4            ; 59
	const HS_MOLTRES                       ; 5B
	const HS_VICTORY_ROAD_2F_ITEM_1        ; 5C
	const HS_VICTORY_ROAD_2F_ITEM_2        ; 5D
	const HS_VICTORY_ROAD_2F_ITEM_3        ; 5E
	const HS_VICTORY_ROAD_2F_ITEM_4        ; 5F
	const HS_VICTORY_ROAD_2F_BOULDER       ; 60
	const HS_VICTORY_ROAD_2F_KOGA          ; new
	const HS_BILL_POKEMON                  ; 61
	const HS_BILL_1                        ; 62
	const HS_BILL_2                        ; 63
	const HS_VIRIDIAN_FOREST_ERIKA         ; new
	const HS_VIRIDIAN_FOREST_ITEM_1        ; 64
	const HS_VIRIDIAN_FOREST_ITEM_2        ; 65
	const HS_VIRIDIAN_FOREST_ITEM_3        ; 66
	const HS_MT_MOON_1F_ITEM_1             ; 67
	const HS_MT_MOON_1F_ITEM_2             ; 68
	const HS_MT_MOON_1F_ITEM_3             ; 69
	const HS_MT_MOON_1F_ITEM_4             ; 6A
	const HS_MT_MOON_1F_ITEM_5             ; 6B
	const HS_MT_MOON_1F_ITEM_6             ; 6C
	const HS_MT_MOON_1F_RIVAL              ; new
	const HS_MT_MOON_B2F_JESSIE            ; 6D
	const HS_MT_MOON_B2F_JAMES             ; 6E
	const HS_MT_MOON_B2F_FOSSIL_1          ; 6F
	const HS_MT_MOON_B2F_FOSSIL_2          ; 70
	const HS_MT_MOON_B2F_ITEM_1            ; 71
	const HS_MT_MOON_B2F_ITEM_2            ; 72
	const HS_SS_ANNE_2F_RIVAL              ; 73
	const HS_SS_ANNE_1F_ROOMS_ITEM         ; 74
	const HS_SS_ANNE_2F_ROOMS_ITEM_1       ; 75
	const HS_SS_ANNE_2F_ROOMS_ITEM_2       ; 76
	const HS_SS_ANNE_B1F_ROOMS_ITEM_1      ; 77
	const HS_SS_ANNE_B1F_ROOMS_ITEM_2      ; 78
	const HS_SS_ANNE_B1F_ROOMS_ITEM_3      ; 79
	const HS_VICTORY_ROAD_3F_ITEM_1        ; 7A
	const HS_VICTORY_ROAD_3F_ITEM_2        ; 7B
	const HS_VICTORY_ROAD_3F_BOULDER       ; 7C
	const HS_ROCKET_HIDEOUT_B1F_TRAINER_1  ; new
	const HS_ROCKET_HIDEOUT_B1F_TRAINER_2  ; new
	const HS_ROCKET_HIDEOUT_B1F_TRAINER_3  ; new
	const HS_ROCKET_HIDEOUT_B1F_TRAINER_4  ; new
	const HS_ROCKET_HIDEOUT_B1F_TRAINER_5  ; new
	const HS_ROCKET_HIDEOUT_B1F_ITEM_1     ; 7D
	const HS_ROCKET_HIDEOUT_B1F_ITEM_2     ; 7E
	const HS_ROCKET_HIDEOUT_B2F_TRAINER_1  ; new
	const HS_ROCKET_HIDEOUT_B2F_ITEM_1     ; 7F
	const HS_ROCKET_HIDEOUT_B2F_ITEM_2     ; 80
	const HS_ROCKET_HIDEOUT_B2F_ITEM_3     ; 81
	const HS_ROCKET_HIDEOUT_B2F_ITEM_4     ; 82
	const HS_ROCKET_HIDEOUT_B3F_TRAINER_1  ; new
	const HS_ROCKET_HIDEOUT_B3F_TRAINER_2  ; new
	const HS_ROCKET_HIDEOUT_B3F_ITEM_1     ; 83
	const HS_ROCKET_HIDEOUT_B3F_ITEM_2     ; 84
	const HS_ROCKET_HIDEOUT_B4F_GIOVANNI   ; 85
	const HS_ROCKET_HIDEOUT_B4F_JAMES      ; 86
	const HS_ROCKET_HIDEOUT_B4F_JESSIE     ; 87
	const HS_ROCKET_HIDEOUT_B4F_TRAINER_4  ; new
	const HS_ROCKET_HIDEOUT_B4F_ITEM_1     ; 88
	const HS_ROCKET_HIDEOUT_B4F_ITEM_2     ; 89
	const HS_ROCKET_HIDEOUT_B4F_ITEM_3     ; 8A
	const HS_ROCKET_HIDEOUT_B4F_ITEM_4     ; 8B
	const HS_ROCKET_HIDEOUT_B4F_ITEM_5     ; 8C
;	const HS_SILPH_CO_2F_1                 ; 8D XXX never (de)activated? ; commented out because unused
	const HS_SILPH_CO_2F_2                 ; 8E
	const HS_SILPH_CO_2F_3                 ; 8F
	const HS_SILPH_CO_2F_4                 ; 90
	const HS_SILPH_CO_2F_5                 ; 91
	const HS_SILPH_CO_3F_1                 ; 92
	const HS_SILPH_CO_3F_2                 ; 93
	const HS_SILPH_CO_3F_ITEM              ; 94
	const HS_SILPH_CO_4F_1                 ; 95
	const HS_SILPH_CO_4F_2                 ; 96
	const HS_SILPH_CO_4F_3                 ; 97
	const HS_SILPH_CO_4F_ITEM_1            ; 98
	const HS_SILPH_CO_4F_ITEM_2            ; 99
	const HS_SILPH_CO_4F_ITEM_3            ; 9A
	const HS_SILPH_CO_5F_1                 ; 9B
	const HS_SILPH_CO_5F_2                 ; 9C
	const HS_SILPH_CO_5F_3                 ; 9D
	const HS_SILPH_CO_5F_4                 ; 9E
	const HS_SILPH_CO_5F_ITEM_1            ; 9F
	const HS_SILPH_CO_5F_ITEM_2            ; A0
	const HS_SILPH_CO_5F_ITEM_3            ; A1
	const HS_SILPH_CO_6F_1                 ; A2
	const HS_SILPH_CO_6F_2                 ; A3
	const HS_SILPH_CO_6F_3                 ; A4
	const HS_SILPH_CO_6F_ITEM_1            ; A5
	const HS_SILPH_CO_6F_ITEM_2            ; A6
	const HS_SILPH_CO_7F_1                 ; A7
	const HS_SILPH_CO_7F_2                 ; A8
	const HS_SILPH_CO_7F_3                 ; A9
	const HS_SILPH_CO_7F_4                 ; AA
	const HS_SILPH_CO_7F_RIVAL             ; AB
	const HS_SILPH_CO_7F_ITEM_1            ; AC
	const HS_SILPH_CO_7F_ITEM_2            ; AD
;	const HS_SILPH_CO_7F_8                 ; AE XXX sprite doesn't exist ; commented out because unused
	const HS_SILPH_CO_8F_1                 ; AF
	const HS_SILPH_CO_8F_2                 ; B0
	const HS_SILPH_CO_8F_3                 ; B1
	const HS_ROCK_TUNNEL_B1F_BROCK         ; new
	const HS_SILPH_CO_9F_1                 ; B2
	const HS_SILPH_CO_9F_2                 ; B3
	const HS_SILPH_CO_9F_3                 ; B4
	const HS_SILPH_CO_10F_1                ; B5
	const HS_SILPH_CO_10F_2                ; B6
;	const HS_SILPH_CO_10F_3                ; B7 XXX never (de)activated? ; commented out because unused
	const HS_SILPH_CO_10F_ITEM_1           ; B8
	const HS_SILPH_CO_10F_ITEM_2           ; B9
	const HS_SILPH_CO_10F_ITEM_3           ; BA
	const HS_SILPH_CO_11F_1                ; BB, Silph Giovanni
	const HS_SILPH_CO_11F_JAMES            ; BC
	const HS_SILPH_CO_11F_2                ; BD Rocket grunt
	const HS_SILPH_CO_11F_JESSIE           ; BE
	const HS_MT_MOON_POKECENTER_MAGIKARP   ; new
	const HS_OBSIDIAN_WOOD_ORAGE           ; new
	const HS_OBSIDIAN_WOOD_ITEM_1          ; new
	const HS_OBSIDIAN_WOOD_ITEM_2          ; new
	const HS_OBSIDIAN_WOOD_ITEM_3          ; new
	const HS_OBSIDIAN_WAREHOUSE_TRAINER_1  ; new
	const HS_OBSIDIAN_WAREHOUSE_TRAINER_2  ; new
	const HS_OBSIDIAN_WAREHOUSE_TRAINER_3  ; new
	const HS_OBSIDIAN_WAREHOUSE_TRAINER_4  ; new
	const HS_OBSIDIAN_WAREHOUSE_ITEM_1     ; new
	const HS_OBSIDIAN_WAREHOUSE_ITEM_2     ; new
	const HS_OBSIDIAN_WAREHOUSE_ITEM_3     ; new
	const HS_OBSIDIAN_WAREHOUSE_ITEM_4     ; new
	const HS_OBSIDIAN_WAREHOUSE_ITEM_5     ; new
	const HS_OBSIDIAN_WAREHOUSE_ITEM_6     ; new
	const HS_OBSIDIAN_WAREHOUSE_ITEM_7     ; new
	const HS_OBSIDIAN_WAREHOUSE_ITEM_8     ; new
	const HS_OBSIDIAN_WAREHOUSE_ITEM_9     ; new
	const HS_OBSIDIAN_WAREHOUSE_ITEM_EXTRA ; new
	const HS_OBSIDIAN_WAREHOUSE_FINAL_JAMES    ; new
	const HS_OBSIDIAN_WAREHOUSE_FINAL_JESSIE   ; new
	const HS_OBSIDIAN_WAREHOUSE_FINAL_ADMIN_1  ; new
	const HS_OBSIDIAN_WAREHOUSE_FINAL_ADMIN_2  ; new
	const HS_OBSIDIAN_WAREHOUSE_FINAL_ADMIN_3  ; new
	const HS_OBSIDIAN_WAREHOUSE_FINAL_ADMIN_4  ; new
	const HS_OBSIDIAN_WAREHOUSE_FINAL_GIOVANNI ; new
;DEF NUM_HS_OBJECTS EQU const_value ; TODO: verify that this is indeed no longer necessary and removed everywhere else is used

; --- start of the variables moved to the extra block ---

; new ; this block now corresponds to MissableObjectsExtra
	const_def							   ; equivalent to "const_value=0" ; TODO: verify that this works as intended
	const HS_POKEMON_MANSION_2F_BLAINE     ; new
	const HS_POKEMON_MANSION_2F_ITEM       ; C0
	const HS_POKEMON_MANSION_3F_ITEM_1     ; C1
	const HS_POKEMON_MANSION_3F_ITEM_2     ; C2
	const HS_POKEMON_MANSION_B1F_ITEM_1    ; C3
	const HS_POKEMON_MANSION_B1F_ITEM_2    ; C4
	const HS_POKEMON_MANSION_B1F_ITEM_3    ; C5
	const HS_POKEMON_MANSION_B1F_ITEM_4    ; C6
	const HS_POKEMON_MANSION_B1F_ITEM_5    ; C7
	const HS_SAFARI_ZONE_EAST_ITEM_1       ; C8
	const HS_SAFARI_ZONE_EAST_ITEM_2       ; C9
	const HS_SAFARI_ZONE_EAST_ITEM_3       ; CA
	const HS_SAFARI_ZONE_EAST_ITEM_4       ; CB
	const HS_SAFARI_ZONE_NORTH_GIOVANNI    ; new, Safari Giovanni
	const HS_SAFARI_ZONE_NORTH_ITEM_1      ; CC
	const HS_SAFARI_ZONE_NORTH_ITEM_2      ; CD
	const HS_SAFARI_ZONE_WEST_ITEM_1       ; CE
	const HS_SAFARI_ZONE_WEST_ITEM_2       ; CF
	const HS_SAFARI_ZONE_WEST_ITEM_3       ; D0
	const HS_SAFARI_ZONE_WEST_ITEM_4       ; D1
	const HS_SAFARI_ZONE_CENTER_ITEM       ; D2
	const HS_CERULEAN_CAVE_2F_ITEM_1       ; D3
	const HS_CERULEAN_CAVE_2F_ITEM_2       ; D4
	const HS_CERULEAN_CAVE_2F_ITEM_3       ; D5
	const HS_CERULEAN_CAVE_2F_ITEM_4       ; D6
	const HS_MEWTWO                        ; D7
	const HS_CERULEAN_CAVE_B1F_ITEM_1      ; D8
	const HS_CERULEAN_CAVE_B1F_ITEM_2      ; D9
	const HS_CERULEAN_CAVE_B1F_ITEM_3      ; DA
	const HS_CERULEAN_CAVE_B1F_ITEM_4      ; DB
	const HS_CERULEAN_CAVE_B1F_TRAVELER    ; new
	const HS_VICTORY_ROAD_1F_ITEM_1        ; DC
	const HS_VICTORY_ROAD_1F_ITEM_2        ; DD
	const HS_CHAMPIONS_ROOM_RIVAL          ; new
	const HS_CHAMPIONS_ROOM_OAK            ; DE
	const HS_SEAFOAM_ISLANDS_1F_BOULDER_1  ; DF
	const HS_SEAFOAM_ISLANDS_1F_BOULDER_2  ; E0
	const HS_SEAFOAM_ISLANDS_B1F_BOULDER_1 ; E1
	const HS_SEAFOAM_ISLANDS_B1F_BOULDER_2 ; E2
	const HS_SEAFOAM_ISLANDS_B2F_BOULDER_1 ; E3
	const HS_SEAFOAM_ISLANDS_B2F_BOULDER_2 ; E4
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_1 ; E5
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_2 ; E6
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_3 ; E7
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_4 ; E8
	const HS_SEAFOAM_ISLANDS_B4F_LORELEI   ; new
	const HS_SEAFOAM_ISLANDS_B4F_BOULDER_1 ; E9
	const HS_SEAFOAM_ISLANDS_B4F_BOULDER_2 ; EA
	const HS_ARTICUNO                      ; EB
	const HS_MR_PSYCHIC_SABRINA            ; new
	const HS_OBSIDIAN_ISLAND_ROCKET_1      ; new
	const HS_OBSIDIAN_ISLAND_ROCKET_2      ; new
	const HS_OBSIDIAN_ISLAND_ROCKET_3      ; new
	const HS_OBSIDIAN_ISLAND_SLAVE_1       ; new
	const HS_OBSIDIAN_ISLAND_SLAVE_2       ; new
	const HS_OBSIDIAN_ISLAND_SCIENTIST_1   ; new
	const HS_OBSIDIAN_ISLAND_SCIENTIST_2   ; new
	const HS_OBSIDIAN_ISLAND_OFFICIER      ; new
	const HS_OBSIDIAN_ISLAND_CITIZEN_1     ; new
	const HS_OBSIDIAN_ISLAND_CITIZEN_2     ; new
	const HS_OBSIDIAN_ISLAND_CITIZEN_3     ; new
	const HS_OBSIDIAN_ISLAND_CITIZEN_4     ; new
	const HS_OBSIDIAN_ISLAND_TRAVELER      ; new
	const HS_OBSIDIAN_ISLAND_ITEM_1        ; new
	const HS_OCHRE_WONDERLAND_BLUE		   ; new, Wonderland Blue
	const HS_OCHRE_WONDERLAND_ITEM_1	   ; new
	const HS_OCHRE_WONDERLAND_ITEM_2	   ; new
	const HS_OCHRE_WONDERLAND_ITEM_3	   ; new
	const HS_OCHRE_WONDERLAND_ITEM_4	   ; new
	const HS_OCHRE_WONDERLAND_EEVEE		   ; new
	const HS_OCHRE_WONDERLAND_ITEM_5	   ; new
	const HS_OCHRE_WONDERLAND_ITEM_6	   ; new
	const HS_OCHRE_WONDERLAND_ITEM_7	   ; new
	const HS_OCHRE_WONDERLAND_ITEM_8	   ; new
	const HS_CELADON_MANSION_PIGEON		   ; new, PIGEON cameo
	const HS_LAVENDER_TOWN_TRAVELER        ; new
	const HS_OBSIDIAN_MINES_LOST_HIKER     ; new
	const HS_OBSIDIAN_MINES_ITEM_1         ; new
	const HS_OBSIDIAN_MINES_ITEM_2         ; new
	const HS_OBSIDIAN_MINES_ITEM_3         ; new
	const HS_OBSIDIAN_MINES_ITEM_4         ; new
	const HS_OBSIDIAN_MINES_ITEM_5         ; new
	const HS_OBSIDIAN_MINES_ITEM_6         ; new
	const HS_OBSIDIAN_MINES_ITEM_7         ; new
	const HS_ROUTE_28_ROCKET_1             ; new
	const HS_ROUTE_28_ROCKET_2             ; new
	const HS_ROUTE_28_ROCKET_3             ; new
	const HS_ROUTE_28_ROCKET_4             ; new
	const HS_SNORLAX_DEN                   ; new
	const HS_FUCHSIA_CITY_ERIK_WAITING     ; new
	const HS_FUCHSIA_CITY_ROCKET_SAFARI    ; new
	const HS_FUCHSIA_CITY_ERIK_HAPPY       ; new
	const HS_FUCHSIA_CITY_SARA_HAPPY       ; new
	const HS_FUCHSIA_CITY_TRAVELER         ; new
	const HS_CERULEAN_CAVE_EXTRA_MIDDLE_LANCE  ; new
	const HS_ZYGARDEC					   ; new
	const HS_UNECROZMA					   ; new
	const HS_MRAYQUAZA					   ; new
	const HS_EETERNATUS					   ; new
	const HS_ARCEUS						   ; new
	const HS_OCHRE_CITY_TRAVELER           ; new
	const HS_CINNABAR_ISLAND_TRAVELER      ; new
	const HS_OBSIDIAN_POKECENTER_NPC_1     ; new
	const HS_OBSIDIAN_POKECENTER_NPC_2     ; new
	const HS_CERULEAN_CAVE_EXTRA_BOTTOM_ITEM_1	; new
