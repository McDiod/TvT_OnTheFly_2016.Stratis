
// takes location, distance, classname

_location = _this select 0;
_distance = _this select 1;
_target = _this select 2;

_spawn = [_location, [0,_distance], random 360, 0, [1,30], [100,typeOf _target]] call SHK_pos;

playSound "beam";
titleCut ["", "BLACK OUT", 1];
_nul = _target setPos _spawn;
sleep 1.2;
titleCut ["", "BLACK IN", 1];