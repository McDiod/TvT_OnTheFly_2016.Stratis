
// takes location, distance, classname

_location = _this select 0;
_distance = _this select 1;
_classname = _this select 2;

_spawnpos = [_location, [0,_distance], random 360, 0, [1,30], [100,_classname]] call SHK_pos;
_vehicle = _classname createVehicle _spawnpos;
[_vehicle] call clearInventory;

_vehicle