if ((_this select 0) == opfor) then {
 ["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_opfor" + "</t><br /><t size='.5'>" + localize "str_GRAD_thankyouforplaying2" + "<br />" + localize "str_GRAD_thankyouforplaying3" + "</t>",0,0,3,2] spawn BIS_fnc_dynamicText;
      sleep 3;
};

if ((_this select 0) == blufor) then {
 ["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.7' color='#FFFFFF'>" + localize "str_GRAD_thankyouforplaying_blufor" + "</t><br /><t size='.5'>" + localize "str_GRAD_thankyouforplaying2" + "<br />" + localize "str_GRAD_thankyouforplaying3" + "</t>",0,0,3,2] spawn BIS_fnc_dynamicText;
      sleep 3;
};

sleep 3;
if ((_this select 0) == blufor) then {
if (WINCONDITIONLBUFOR) then {
 "END1" call BIS_fnc_endMission;
 } else {
 ["epicFail",false,2] call BIS_fnc_endMission;
 };
};
if ((_this select 0) == opfor) then {
 if (WINCONDITIONOPFOR) then {
 "END1" call BIS_fnc_endMission;
 } else {
 ["epicFail",false,2] call BIS_fnc_endMission;
 };
 
};
