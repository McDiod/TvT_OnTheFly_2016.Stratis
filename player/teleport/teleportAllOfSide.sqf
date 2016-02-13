_side = _this select 0;
_posi = _this select 1;

if (side player != _side) exitWith {};

[_posi,50,player] call teleportIt;