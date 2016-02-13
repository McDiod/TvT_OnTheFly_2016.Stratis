_pos = _this select 0;
_side = _this select 1;

_color = "ColorBLUFOR";

if (side player != _side) exitWith {};

if (_side == west) then {
	_color = "ColorBLUFOR";
} else {
	_color = "ColorOPFOR";
};

//hintSilent format ["%1", _type];

vehicle_marker_start1 = createMarkerLocal ["%1_marker_vehicle1", _pos];
vehicle_marker_start1 setMarkerTypeLocal "mil_pickup";
vehicle_marker_start1 setMarkerColorLocal _color;
