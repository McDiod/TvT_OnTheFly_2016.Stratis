// Intro Gruppe Adler

titleCut ["", "BLACK FADED", 999];

[] spawn {

	titleText ["","PLAIN"];
	titleFadeOut 1;
	sleep 2;

	titleCut ["", "BLACK IN", 1];

	waitUntil {time > 3};
		["<img size= '6' shadow='false' image='pic\gruppe-adler.paa'/><br/><t size='.9' color='#FFFFFF'>OnTheFly</t>",0,0,2,2] spawn BIS_fnc_dynamicText;
};