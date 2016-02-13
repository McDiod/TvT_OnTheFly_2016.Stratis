#include "\z\ace\addons\main\script_component.hpp"



teleportGroup = {
	openMap [false,false];
	spawnpoint_mapclick = _this select 0;

	if (surfaceIsWater [(spawnpoint_mapclick select 0),(spawnpoint_mapclick select 1)]) exitWith {
    	[localize "str_GRAD_spawn_on_water"] call EFUNC(common,displayTextStructured);
	};
   	

	// doesnt work correctly in SP tests
	[[[spawnpoint_mapclick],"player\teleport\bluforShowSpawnArea.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

	if (player == opfor_teamlead && !OPFOR_TELEPORTED) then {
		OPFOR_TELEPORTED = TRUE;
		publicVariable "OPFOR_TELEPORTED";

		[[[east,spawnpoint_mapclick],"player\teleport\teleportAllOfSide.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

		_opfor_marker = createMarker ["opfor_marker", spawnpoint_mapclick];
		_opfor_marker setMarkerType "hd_objective";
		_opfor_marker setMarkerColor "ColorWEST";
		// with sector module, marker is only needed for getting position
		_opfor_marker setMarkerAlpha 0;

		// move task to new destination
		sector_trigger setPos spawnpoint_mapclick;

		[[[spawnpoint_mapclick],"common\teleport\opforSpawnListener.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

		
		choose_vehicle_opfor = opfor_teamlead addAction["<t color=""#93E352"">" +
		 localize "str_GRAD_choose_vehicle",{nul = [choose_vehicle_opfor] execVM "player\vehicle_buy\choose_vehicle.sqf"}, 
		 _Args, 1, false, false, "","_this == _target && BLUFOR_TELEPORTED && OPFOR_TELEPORTED"];
	};

	if (player == blufor_teamlead && OPFOR_TELEPORTED) then {
		openMap [false,false];
		BLUFOR_TELEPORTED = TRUE;
		publicVariable "BLUFOR_TELEPORTED";

		// entfernung marker zu spawnpunkt zu klein oder groß?
		// pos ist hier ein anderes pos als oben!
		_distance = spawnpoint_mapclick distance (getMarkerPos "opfor_marker");

		if (_distance < MINIMAL_BLUFOR_SPAWN_DISTANCE) exitWith {
			hintSilent format [localize "str_GRAD_spawnTooClose1" + '(%1 m).' + 
				localize "str_GRAD_spawnTooClose2" + ' %2.', 
				floor(_distance), MINIMAL_BLUFOR_SPAWN_DISTANCE];
			[] execVM "common\teleport\selectSpawn.sqf";};

		if (_distance > MAXIMAL_BLUFOR_SPAWN_DISTANCE) exitWith {
			hintSilent format [localize "str_GRAD_spawnTooFar1" + '(%1 m).' + 
			localize "str_GRAD_spawnTooFar2" + ' %2.', 
			floor(_distance), MAXIMAL_BLUFOR_SPAWN_DISTANCE];
		[] execVM "common\teleport\selectSpawn.sqf";
		};



		// teleport und gucken, ob posi frei ist
		[[[west,spawnpoint_mapclick],"player\teleport\teleportAllOfSide.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;

		choose_vehicle_blufor = blufor_teamlead addAction["<t color=""#93E352"">" + localize "str_GRAD_choose_vehicle",
			{nul = [choose_vehicle_blufor] execVM "player\vehicle_buy\choose_vehicle.sqf"},
			_Args, 1, false, false, "","_this == _target && BLUFOR_TELEPORTED && OPFOR_TELEPORTED"];
	
		[[[spawnpoint_mapclick],"player\teleport\bluforSpawnListener.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;
	};
};

spawnpoint_mapclick = [];

// opfor teamlead opens map
if (player == opfor_teamlead && !OPFOR_TELEPORTED) then {
	[localize "str_GRAD_choose_spawn_location"] call EFUNC(common,displayTextStructured);
	openMap [true,false];
	onMapSingleClick "[_pos] call teleportGroup; onMapSingleClick ''; true";
};

// blufor teamlead opens map
if (player == blufor_teamlead && OPFOR_TELEPORTED) then {
	[localize "str_GRAD_choose_spawn_location"] call EFUNC(common,displayTextStructured);
	openMap [true,false];
	onMapSingleClick "[_pos] call teleportGroup; onMapSingleClick ''; true";
};
