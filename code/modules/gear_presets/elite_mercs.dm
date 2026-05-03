/datum/equipment_preset/other/freelancer_elite
	name = "Freelancer Cell"

	assignment = "Elite Freelancer"
	rank = "Elite"
	idtype = /obj/item/card/id/data

	faction = FACTION_MERCENARY

/datum/equipment_preset/other/freelancer_elite/New()
	. = ..()
	access = get_access(ACCESS_LIST_EMERGENCY_RESPONSE) //ACCESS_COME_BACK_TO_ME

/datum/equipment_preset/other/freelancer_elite/load_name(mob/living/carbon/human/new_human, randomise)
	new_human.gender = pick(60;MALE,40;FEMALE)
	var/datum/preferences/A = new()
	A.randomize_appearance(new_human)
	var/random_name
	if(new_human.gender == MALE)
		random_name = "[pick(GLOB.first_names_male_colonist)] [pick(GLOB.last_names_colonist)]"
		new_human.f_style = "5 O'clock Shadow"
	else
		random_name = "[pick(GLOB.first_names_female_colonist)] [pick(GLOB.last_names_colonist)]"
	new_human.change_real_name(new_human, random_name)
	new_human.age = rand(20,45)
	new_human.r_hair = 25
	new_human.g_hair = 25
	new_human.b_hair = 35

/datum/equipment_preset/other/freelancer_elite/standard
	name = "Freelancer Cell (Standard)"
	paygrades = list(PAY_SHORT_EFL_S = JOB_PLAYTIME_TIER_0)
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = "Elite Freelancer"
	rank = "Elite"

	skills = /datum/skills/mercenary/elite

/datum/equipment_preset/other/freelancer_elite/standard/load_gear(mob/living/carbon/human/new_human)
	//generic clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer/elite, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife, WEAR_FEET)
	add_combat_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/freelancer/elite, WEAR_HEAD)
	add_elite_freelancer_armor(new_human)
	if(prob(60))
		add_helmet_cigarettes(new_human)
	if(prob(30))
		add_facewrap(new_human)
	//storage and specific stuff
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/small/elite_freelancer(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/waist/elite_freelancer(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/merc, WEAR_L_EAR)
	var/elite_backpack = rand(1,3)
	switch(elite_backpack)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/medium, WEAR_BACK)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/light, WEAR_BACK)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/heavy, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical/socmed/full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/explosive, WEAR_R_STORE)
	//oh boy
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/sebb, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/explosive/grenade/sebb, WEAR_IN_R_STORE)
	add_elite_freelancer_smoke(new_human)
	add_elite_freelancer_phosphorus(new_human)
	add_elite_freelancer_high_explosive(new_human)
	add_elite_freelancer_high_explosive(new_human)
	var/elite_weapon = rand(1,3)
	switch(elite_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/wy, WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/xm40(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/xm40(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/xm40(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/xm40/heap(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/xm40/heap(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/rifle/xm40/heap(new_human), WEAR_IN_BELT)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/shotgun/wy/elite_freelancer, WEAR_WAIST)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/standard/m39/elite_freelancer, WEAR_WAIST)
	//weapon
	switch(elite_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/m41aMK1/xm40(new_human), WEAR_J_STORE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/shotgun/combat/marsoc(new_human), WEAR_J_STORE)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/m39/elite/pve/elite_freelancer(new_human), WEAR_J_STORE)

/datum/equipment_preset/other/freelancer_elite/medic
	name = "Freelancer Cell (Medic)"
	paygrades = list(PAY_SHORT_EFL_M = JOB_PLAYTIME_TIER_0)
	flags = EQUIPMENT_PRESET_EXTRA
	assignment = "Elite Medic"
	rank = "Elite"
	skills = /datum/skills/mercenary/elite/medic

/datum/equipment_preset/other/freelancer_elite/medic/load_gear(mob/living/carbon/human/new_human)
	//generic clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer/elite, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife, WEAR_FEET)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/gloves/marine/veteran/royal_marine/medical, WEAR_HANDS)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/freelancer/elite/beret, WEAR_HEAD)
	if(prob(60))
		add_helmet_cigarettes(new_human)
	if(prob(30))
		add_facewrap(new_human)
	add_elite_freelancer_medic_armor(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/recon/medic/marsoc(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/surg_vest/drop_black/equipped(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/merc, WEAR_L_EAR)
	if(new_human.disabilities & NEARSIGHTED)
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health/prescription(new_human), WEAR_EYES)
	else
		new_human.equip_to_slot_or_del(new /obj/item/clothing/glasses/hud/health(new_human), WEAR_EYES)
	var/elite_backpack = rand(1,2)
	switch(elite_backpack)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/medium, WEAR_BACK)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/rmc/light, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/softpack/brute, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/firstaid/softpack/fire, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/roller, WEAR_IN_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/belt/medical/lifesaver/upp/black/full, WEAR_WAIST)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/sling, WEAR_L_STORE)
	if(prob(50))
		new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer, WEAR_IN_L_STORE)
	else
		new_human.equip_to_slot_or_del(new /obj/item/device/healthanalyzer/soul, WEAR_IN_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/magazine/large/wy, WEAR_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/pve, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/pve, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/pve, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/smg/m39/pve, WEAR_IN_R_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smg/m39/elite/pve/elite_freelancer(new_human), WEAR_J_STORE)

/datum/equipment_preset/other/freelancer_elite/rto
	name = "Freelancer Cell (RTO)"
	paygrades = list(PAY_SHORT_EFL_S = JOB_PLAYTIME_TIER_0)
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = "Elite RTO"
	rank = "Elite"

	skills = /datum/skills/mercenary/elite/engineer

/datum/equipment_preset/other/freelancer_elite/rto/load_gear(mob/living/carbon/human/new_human)
	//generic clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer/elite, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife, WEAR_FEET)
	add_combat_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/freelancer/elite, WEAR_HEAD)
	add_elite_freelancer_armor(new_human)
	if(prob(60))
		add_helmet_cigarettes(new_human)
	if(prob(30))
		add_facewrap(new_human)
	//storage and specific stuff
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/small/elite_freelancer(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/waist/elite_freelancer(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/merc, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/storage/backpack/marine/satchel/rto/twe_net/freelancer, WEAR_BACK)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical/socmed/full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/tools/tactical/sof, WEAR_R_STORE)
	var/elite_weapon = rand(1,3)
	switch(elite_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/rmc(new_human), WEAR_WAIST)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/rmc(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/rmc(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/rmc(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/rmc(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/rmc(new_human), WEAR_IN_BELT)
			new_human.equip_to_slot_or_del(new /obj/item/ammo_magazine/sniper/rmc(new_human), WEAR_IN_BELT)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/upp/spp(new_human), WEAR_WAIST)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/marine/upp/caws(new_human), WEAR_WAIST)
	//weapon
	switch(elite_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/sniper/rmc(new_human), WEAR_J_STORE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/spp(new_human), WEAR_J_STORE)
		if(3)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/rifle/caws/auto(new_human), WEAR_J_STORE)

/datum/equipment_preset/other/freelancer_elite/heavy
	name = "Freelancer Cell (Heavy)"
	paygrades = list(PAY_SHORT_EFL_S = JOB_PLAYTIME_TIER_0)
	flags = EQUIPMENT_PRESET_EXTRA

	assignment = "Elite Juggernaut"
	rank = "Elite"

	skills = /datum/skills/mercenary/elite/heavy

/datum/equipment_preset/other/freelancer_elite/heavy/load_gear(mob/living/carbon/human/new_human)
	//generic clothing
	new_human.equip_to_slot_or_del(new /obj/item/clothing/under/marine/veteran/freelancer/elite, WEAR_BODY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/shoes/marine/knife, WEAR_FEET)
	add_combat_gloves(new_human)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/head/helmet/marine/veteran/freelancer/elite/heavy, WEAR_HEAD)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/suit/marine/veteran/freelancer/elite/heavy/smartgunner, WEAR_JACKET)
	if(prob(60))
		add_helmet_cigarettes(new_human)
	if(prob(30))
		add_facewrap(new_human)
	new_human.equip_to_slot(new /obj/item/clothing/glasses/night/m56_goggles(new_human), WEAR_EYES)
	//storage and specific stuff
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/webbing/m3/small/elite_freelancer(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/clothing/accessory/storage/holster/waist/elite_freelancer(new_human), WEAR_ACCESSORY)
	new_human.equip_to_slot_or_del(new /obj/item/device/radio/headset/distress/merc, WEAR_L_EAR)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/medical/socmed/full, WEAR_L_STORE)
	new_human.equip_to_slot_or_del(new /obj/item/storage/pouch/flare/rmc/full(new_human), WEAR_R_STORE)
	var/elite_weapon = rand(1,3)
	switch(elite_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/smartgunner/pmc/full, WEAR_WAIST)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/storage/belt/gun/smartgunner/pmc/full, WEAR_WAIST)
	//weapon
	switch(elite_weapon)
		if(1)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smartgun/l56a2/elite_freelancer(new_human), WEAR_J_STORE)
		if(2)
			new_human.equip_to_slot_or_del(new /obj/item/weapon/gun/smartgun/dirty/elite_freelancer(new_human), WEAR_J_STORE)
