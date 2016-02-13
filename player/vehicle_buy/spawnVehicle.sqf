#include "\z\ace\addons\main\script_component.hpp"

_action = _this select 0;
_action = _this select 0;
_position = _this select 1;
_vehicle = _this select 2;
_side = _this select 3;
_onWater = _this select 4;
// [createVehicleSubmarine,vehicle_position,vehicle_classname_submarine,west,submarine_items,"water"]
_spawnPos = [];
_max_distance = 50;

if (isDedicated) exitWith {};



getPositionOnWater = {
	_underwater = [];
	_pos = [];
	while {count _underwater < 1} do {

		_pos = [_this select 0, [0,_this select 1], random 360, 2, [0,30], [100,_this select 2]] call SHK_pos;
		_helperobj = "Sign_Arrow_Large_F" createVehicleLocal _pos;
		_helperobj setPosASL [_pos select 0,_pos select 1,0];
		// hintSilent format ["posi is %1",(getPosATL _helperobj) select 2 ];
		if ((getPosATL _helperobj) select 2 < 1.5) then { _underwater = []; } else { _underwater = ["YES"];};
		deleteVehicle _helperobj;
	};
	_pos
};

getPositionOnLand = {
	_pos = [_this select 0, [0,_this select 1], random 360, 0, [1,30], [100,_this select 2]] call SHK_pos;	
	_pos
};

if (_onWater) then {_spawnPos = [_position, _max_distance,_vehicle] call getPositionOnWater;} else {_spawnPos = [_position, _max_distance,_vehicle] call getPositionOnLand;};

if (count _spawnPos < 1) exitWith {[localize "str_GRAD_no_spawn_found"] call EFUNC(common,displayTextStructured);};

player removeAction _action;


_createdVehicle = _vehicle createVehicle _spawnPos;
[_createdVehicle] call clearInventory;


// if (_side == west) then {[] call raiseBluforCount;} else {[] call raiseOpforCount;};

[[[_spawnPos,_side],"player\vehicle_buy\createVehiclePositionMarker.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;


if (_vehicle == "O_G_Mortar_01_F") exitWith { 
	_createdVehicle setVehicleAmmo 0.1;
};

if (_vehicle == "B_Boat_Transport_01_F" || _vehicle == "B_SDV_01_F") exitWith { 
	_createdVehicle addItemCargoGlobal ["U_B_Wetsuit",2];
	_createdVehicle addItemCargoGlobal ["V_RebreatherB",2];
	_createdVehicle addItemCargoGlobal ["G_B_Diving",2];
};