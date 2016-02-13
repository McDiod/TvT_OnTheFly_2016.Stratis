_player_action = _this select 0;
vehicle_position = getPos player;



vehicle_classname_tactical = "I_G_Offroad_01_armed_F";
vehicle_classname_mortar = "O_G_Mortar_01_F";

// littlebird classname
if (BLUFORCE == "german") then {
	if ((ISLAND_TARGET_POSITIONS select (ISLANDS find worldName)) select 3) then {
		vehicle_classname_littlebird = "MH6_Flecktarn";
	} else {
		vehicle_classname_littlebird = "MH6_Tropentarn";
	};
} else {
	vehicle_classname_littlebird = "B_Heli_Light_01_F";
};

if ((ISLAND_TARGET_POSITIONS select (ISLANDS find worldName)) select 3) then {
       vehicle_classname_HMMWV = "rhsusf_m998_w_4dr";     
    } else {
       vehicle_classname_HMMWV = "rhsusf_m998_d_4dr";
};

	
vehicle_classname_submarine = "B_SDV_01_F";
vehicle_classname_KORD = "rhs_KORD_high_vdv";
vehicle_classname_rubberboat = "B_Boat_Transport_01_F";


opfor_action_count = 0;
blufor_action_count = 0;

raiseBluforCount = {
	blufor_action_count = blufor_action_count + 1;	
};

raiseOpforCount = {
	opfor_action_count = opfor_action_count + 1;	
};

if (player == opfor_teamlead) then {
	 player removeAction choose_vehicle_opfor; 
	 
	 createVehicleTactical = opfor_teamlead addAction["<t color=""#93E352"">" + "Spawn Tactical",
	 {[createVehicleTactical,vehicle_position,vehicle_classname_tactical,east,opfor_action_count,false] execVM "player\vehicle_buy\spawnVehicle.sqf"; }, _Args, 1, false, true, "","_this == _target && opfor_action_count < 2"];

	 createVehicleMortar = opfor_teamlead addAction["<t color=""#93E352"">" + "Spawn Mortar",
	 {[createVehicleMortar,vehicle_position,vehicle_classname_mortar,east,opfor_action_count,false] execVM "player\vehicle_buy\spawnVehicle.sqf"; }, _Args, 1, false, true, "","_this == _target && opfor_action_count < 2"];

	 createVehicleKORD = opfor_teamlead addAction["<t color=""#93E352"">" + "Spawn KORD",
	 {[createVehicleKORD,vehicle_position,vehicle_classname_KORD,east,opfor_action_count,false] execVM "player\vehicle_buy\spawnVehicle.sqf"; }, _Args, 1, false, true, "","_this == _target && opfor_action_count < 2"];
};

if (player == blufor_teamlead) then {
	player removeAction choose_vehicle_blufor; 

 	createVehicleLittlebird = blufor_teamlead addAction["<t color=""#93E352"">" + "Spawn Littlebird",
 	{[createVehicleLittlebird,vehicle_position,vehicle_classname_littlebird,west,false] execVM "player\vehicle_buy\spawnVehicle.sqf"; }, _Args, 1, false, true, "","_this == _target && blufor_action_count < 2"];

 	createVehicleHMMWV = blufor_teamlead addAction["<t color=""#93E352"">" + "Spawn HMMWV",
 	{[createVehicleHMMWV,vehicle_position,vehicle_classname_HMMWV,west,false] execVM "player\vehicle_buy\spawnVehicle.sqf"; }, _Args, 1, false, true, "","_this == _target && blufor_action_count < 2"];

 	createVehicleSubmarine = blufor_teamlead addAction["<t color=""#93E352"">" + "Spawn Submarine",
 	{[createVehicleSubmarine,vehicle_position,vehicle_classname_submarine,west,true] execVM "player\vehicle_buy\spawnVehicle.sqf"; }, _Args, 1, false, true, "","_this == _target && blufor_action_count < 2"];

 	createVehicleRubberboat = blufor_teamlead addAction["<t color=""#93E352"">" + "Spawn Rubberboat",
 	{[createVehicleRubberboat,vehicle_position,vehicle_classname_rubberboat,west,true] execVM "player\vehicle_buy\spawnVehicle.sqf"; }, _Args, 1, false, true, "","_this == _target && blufor_action_count < 2"];
};