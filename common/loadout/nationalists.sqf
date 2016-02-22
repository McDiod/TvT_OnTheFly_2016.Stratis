// loadout_russian

set_ak74m_ammo = {
	this = _this select 0;
	[this, "rhs_30Rnd_545x39_AK_no_tracers", 5] call addMagazinesToVest; // 5 (1 in der waffe)
	[this, "rhs_30Rnd_545x39_AK", 5] call addMagazinesToVest; // 3
};

opfor_ak74m = [
"rhs_weap_ak74m",
"rhs_weap_ak74m_2mag",
"rhs_weap_ak74m_camo",
"rhs_weap_ak74m_desert",
"rhs_weap_ak74m_gp25"
];

//RHS + vanilla + rds
opfor_uniform = [
"rhs_chdkz_uniform_1",
"rhs_chdkz_uniform_2",
"rhs_chdkz_uniform_3",
"rhs_chdkz_uniform_4",
"rhs_chdkz_uniform_5",
"U_BG_Guerrilla_6_1",
"U_BG_Guerilla1_1",
"rds_uniform_Woodlander3",
"rds_uniform_Woodlander4"
];

opfor_vest = [
"V_BandollierB_blk",
"V_BandollierB_cbr",
"V_BandollierB_rgr",
"V_BandollierB_khk",
"V_BandollierB_oli",
"V_TacVest_camo"
];

opfor_headgear = [
"rhs_beanie_green",
"rhs_beanie_green",
"rhs_beanie_green",
"rhs_Booniehat_m81",
"rds_worker_cap4",
"H_Shemag_olive",
"H_ShemagOpen_tan",
"H_MilCap_gry",
"H_MilCap_blue",
"rhs_fieldcap_digi",
"H_Cap_oli"
];


opfor_basic = {
	this = _this select 0;

	[this, "ACE_Earplugs", 1] call addItemsToUniform;
	[this, "ACE_fieldDressing", 6] call addItemsToUniform;
	[this, "ACE_Morphine", 2] call addItemsToUniform;
	[this, "ACE_epinephrine", 1] call addItemsToUniform;

	[this, "ACE_Flashlight_MX991", 1] call addItemsToUniform;
	[this, "ACE_key_east", 1] call addItemsToUniform;
	[this, "ACE_MapTools", 1] call addItemsToUniform;
	[this, "Chemlight_red", 2] call addItemsToUniform;
	

	[this, "16Rnd_9x21_Mag", 3] call addItemsToUniform;

	this addPrimaryWeaponItem "rhs_acc_2dpZenit";
	this addPrimaryWeaponItem "rhs_acc_1p63";
	this addWeapon "hgun_Rook40_F";

	comment "Add items";
	this linkItem "ItemMap";
	this linkItem "ItemCompass";
	this linkItem "ItemWatch";
	this linkItem "tf_fadak";
};

opfor_default = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform (opfor_uniform call BIS_fnc_selectRandom);
	this addVest (opfor_vest call BIS_fnc_selectRandom);
	this addHeadgear (opfor_headgear call BIS_fnc_selectRandom);
	this addBackpack "rhs_sidor";
	
	[this, "SmokeShell", 1] call addMagazinesToVest;
	[this, "SmokeShellRed", 1] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 2] call addMagazinesToVest;

	this addWeapon "Binocular";
	this addWeapon (opfor_ak74m call BIS_fnc_selectRandom);
	this addWeapon "hgun_Rook40_F";
	
	[this] call opfor_basic;
	[this, "rhs_30Rnd_762x39mm", 14] call addMagazinesToBackpack;

};

opfor_sql = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform (opfor_uniform call BIS_fnc_selectRandom);
	this addVest (opfor_vest call BIS_fnc_selectRandom);
	this addHeadgear (opfor_headgear call BIS_fnc_selectRandom);
	this addBackpack "tf_rt1523g_big";

	
	
	[this, "SmokeShell", 4] call addMagazinesToVest; // 1 weiß angekommen
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_mag_rgd5", 2] call addMagazinesToBackpack; // beide angekommen

	[this, "rhs_GRD40_White", 4] call addMagazinesToBackpack;
	[this, "rhs_GRD40_Green", 3] call addMagazinesToBackpack;
	[this, "rhs_GRD40_Red", 3] call addMagazinesToBackpack;
	

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_ak74m_gp25";
	this addWeapon "hgun_Rook40_F";
	

	this linkItem "ItemGPS";
	this linkItem "ItemMap";

	[this] call set_ak74m_ammo;
	[this] call opfor_basic;

};

opfor_ftl = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform (opfor_uniform call BIS_fnc_selectRandom);
	this addVest (opfor_vest call BIS_fnc_selectRandom);
	this addHeadgear (opfor_headgear call BIS_fnc_selectRandom);
	this addBackpack "tf_rt1523g_big";


	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "rhs_mag_rgd5", 2] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon (opfor_ak74m call BIS_fnc_selectRandom);
	this addWeapon "hgun_Rook40_F";
	this linkItem "ItemGPS";

	[this] call set_ak74m_ammo;
	[this] call opfor_basic;

};

opfor_medic = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform (opfor_uniform call BIS_fnc_selectRandom);
	this addVest (opfor_vest call BIS_fnc_selectRandom);
	this addHeadgear (opfor_headgear call BIS_fnc_selectRandom);
	this addBackpack "rhs_sidor";
	
	[this, "SmokeShell", 4] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;

	[this, "ACE_fieldDressing", 40] call addMagazinesToBackpack;
	[this, "ACE_Morphine", 20] call addMagazinesToBackpack;
	[this, "ACE_epinephrine", 20] call addMagazinesToBackpack;
	[this, "ACE_bloodIV_250", 12] call addMagazinesToBackpack;

	[this, "rhs_mag_rgd5", 2] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon (opfor_ak74m call BIS_fnc_selectRandom);
	this addWeapon "hgun_Rook40_F";
	
	[this] call set_ak74m_ammo;
	[this] call opfor_basic;

};

opfor_marksman = {


	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform (opfor_uniform call BIS_fnc_selectRandom);
	this addVest (opfor_vest call BIS_fnc_selectRandom);
	this addHeadgear "rhs_Booniehat_flora";

	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;
	


	this addWeapon "Binocular";
	this addWeapon (opfor_ak74m call BIS_fnc_selectRandom);
	this addWeapon "hgun_Rook40_F";
	this addPrimaryWeaponItem "rhs_acc_pgo7v";
	this addPrimaryWeaponItem "rhs_acc_2dpZenit";
	this linkItem "rhs_balaclava";

	[this] call set_ak74m_ammo;
	[this] call opfor_basic;

};

opfor_AT = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform (opfor_uniform call BIS_fnc_selectRandom);
	this addVest (opfor_vest call BIS_fnc_selectRandom);
	this addHeadgear (opfor_headgear call BIS_fnc_selectRandom);
	this addBackpack "rhs_rpg_empty";

	
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;

	[this, "rhs_rpg7_PG7VL_mag", 3] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon (opfor_ak74m call BIS_fnc_selectRandom);
	this addWeapon "hgun_Rook40_F";
	this addWeapon "rhs_weap_rpg7";
	[this] call set_ak74m_ammo;
	[this] call opfor_basic;

};

opfor_MG = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform (opfor_uniform call BIS_fnc_selectRandom);
	this addVest (opfor_vest call BIS_fnc_selectRandom);
	this addHeadgear (opfor_headgear call BIS_fnc_selectRandom);
	this addBackpack "rhs_sidor";

	[this, "rhs_100Rnd_762x54mmR_green", 1] call addMagazinesToVest;
	[this, "rhs_100Rnd_762x54mmR", 2] call addMagazinesToBackpack;
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;

	
	

	this addWeapon "Binocular";
	this addWeapon "rhs_weap_pkm";
	this addWeapon "hgun_Rook40_F";

	[this, "rhs_100Rnd_762x54mmR_green", 1] call addMagazinesToBackpack;

	[this] call opfor_basic;

};


opfor_engineer = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform (opfor_uniform call BIS_fnc_selectRandom);
	this addVest (opfor_vest call BIS_fnc_selectRandom);
	this addHeadgear (opfor_headgear call BIS_fnc_selectRandom);
	this addBackpack "rhs_sidor";

	
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;

	this addWeapon "Binocular";
	this addWeapon (opfor_ak74m call BIS_fnc_selectRandom);
	this addWeapon "hgun_Rook40_F";
	[this] call set_ak74m_ammo;
	[this] call opfor_basic;

};

opfor_crew = {
	
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform (opfor_uniform call BIS_fnc_selectRandom);
	this addVest (opfor_vest call BIS_fnc_selectRandom);
	this addHeadgear (opfor_headgear call BIS_fnc_selectRandom);
	this addBackpack "rhs_sidor";

	
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;

	this addWeapon "Binocular";
	this addWeapon (opfor_ak74m call BIS_fnc_selectRandom);
	this addWeapon "hgun_Rook40_F";
	[this] call set_ak74m_ammo;
	[this] call opfor_basic;

};

opfor_ammobearer = {
	this = _this select 0;

	comment "Remove existing items";
	removeAllWeapons this;
	removeAllItems this;
	removeAllAssignedItems this;
	removeUniform this;
	removeVest this;
	removeBackpack this;
	removeHeadgear this;
	removeGoggles this;

	comment "Add containers";
	
	this forceAddUniform (opfor_uniform call BIS_fnc_selectRandom);
	this addVest (opfor_vest call BIS_fnc_selectRandom);
	this addHeadgear (opfor_headgear call BIS_fnc_selectRandom);
	this addBackpack "rhs_sidor";

	
	
	[this, "SmokeShell", 2] call addMagazinesToVest;
	[this, "SmokeShellRed", 2] call addMagazinesToVest;
	[this, "rhs_mag_rgd5", 1] call addMagazinesToVest;

	[this, "rhs_100Rnd_762x54mmR_green", 2] call addMagazinesToBackpack;
	[this, "rhs_100Rnd_762x54mmR", 6] call addMagazinesToBackpack;

	this addWeapon "Binocular";
	this addWeapon (opfor_ak74m call BIS_fnc_selectRandom);
	this addWeapon "hgun_Rook40_F";
	[this] call set_ak74m_ammo;
	[this] call opfor_basic;
};