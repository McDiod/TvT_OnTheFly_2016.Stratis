#include "\z\ace\addons\main\script_component.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

/* preprocessing important functions */
call compile preprocessFile "islandConfig.sqf";
call compile preprocessfile "common\SHK_pos\shk_pos_init.sqf";
clearInventory = compile preprocessFile "common\loadout\clearInventory.sqf";
spawnIt = compile preprocessFile "common\spawn\spawnVehicle.sqf";
teleportIt = compile preprocessFile "common\teleport\teleport.sqf";
showIntro = compile preprocessFile "player\intro\showIntro.sqf";


/* parameter from description.ext */
TIME_OF_DAY = paramsArray select 0;
WEATHER_SETTING = paramsArray select 1;
BLUFORCE = paramsArray select 2;
OPFORCE = paramsArray select 3;

diag_log format ["BLUFORCE is %1, OPFORCE is %2", BLUFORCE, OPFORCE];

switch (BLUFORCE) do {
	case 0: {BLUFORCE = "german";};
	case 1: {BLUFORCE = "unitedstates";};
	default {BLUFORCE =  "german";};
};
switch (OPFORCE) do {
	case 0: {OPFORCE = "russian";};
	case 1: {OPFORCE = "nationalists";};
	default {OPFORCE = "russian";};
};

MINIMAL_BLUFOR_SPAWN_DISTANCE = paramsArray select 4;
MAXIMAL_BLUFOR_SPAWN_DISTANCE = paramsArray select 5;
TIME_ACCELERATION = paramsArray select 6;
AR3PLAY_ENABLE_REPLAY = (paramsArray select 7) == 1;
AR3PLAY_IS_STREAMABLE = (paramsArray select 8) == 1;

/* set date + time */
if (isServer) then { setDate [2015, 2, 2, TIME_OF_DAY, 1]; };

/* check if TFAR is installed */
if (isClass(configFile >> (_this select 0) >> task_force_radio)) then {
	TFAR_ENABLED = true;
	} else {
	TFAR_ENABLED = false;
};

// global options
did_replay = false;
loadout_processed = true;

if (!isMultiplayer) then {
	{_x disableAI "MOVE"} forEach allUnits;
};

if (isServer) then {
	setTimeMultiplier TIME_ACCELERATION;

	// spawn teleports done?
	OPFOR_TELEPORTED = false;
	publicVariable "OPFOR_TELEPORTED";
	BLUFOR_TELEPORTED = false;
	publicVariable "BLUFOR_TELEPORTED";
	WINCONDITIONOPFOR = false;
	publicVariable "WINCONDITIONOPFOR";
	WINCONDITIONBLUFOR = false;
	publicVariable "WINCONDITIONBLUFOR";

	BLUFOR_CAPTURED = false;
	publicVariable "BLUFOR_CAPTURED";
	MISSION_COMPLETED = false;
	publicVariable "MISSION_COMPLETED";
	bluforMarkerDrawn = false;
	publicVariable "bluforMarkerDrawn";
	publicVariable "MBT_VS_AT";
	BLUFOR_SURRENDERED = false;
	publicVariable "BLUFOR_SURRENDERED";
	END_MISSION_TRIGGERED = false;
	publicVariable "END_MISSION_TRIGGERED";
	SPECTATOR_LIST = [];
	publicVariable "SPECTATOR_LIST";
	RUSSIAN_MARKER_HIDDEN = true;
	publicVariable "RUSSIAN_MARKER_HIDDEN";
	BLUFOR_AT_BARREL = false;
	publicVariable "BLUFOR_AT_BARREL";

	opfor_action_count = 0;
	publicVariable "opfor_action_count";
	blufor_action_count = 0;
	publicVariable "blufor_action_count";

	REPLAY_FINISHED = false;
	publicVariable "REPLAY_FINISHED";

	REPLAY_SPEED = 0.02;

	// loadouts for SP tests
	if (!isMultiplayer) then {
	 	[] spawn {
	 		{if (!isPlayer _x) then {sleep 0.5; [_x, BLUFORCE, OPFORCE] execVM "common\loadout\_client.sqf"};} forEach allUnits;
	 	};
 	};
};

[3] execVM "common\GRAD_replay\GRAD_replay_init.sqf";


opfor_teleport = opfor_teamlead addAction["<t color='#93E352'>" + localize "str_GRAD_choose_spawn_location",{[[[false], "common\teleport\selectSpawn.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;  }, _Args, 1, false, true, "","_this == _target && !OPFOR_TELEPORTED"];
blufor_teleport = blufor_teamlead addAction["<t color='#93E352'>" + localize "str_GRAD_choose_spawn_location",{[[[false], "common\teleport\selectSpawn.sqf"],"BIS_fnc_execVM",true,true] spawn BIS_fnc_MP;  }, _Args, 1, false, true, "","_this == _target && !BLUFOR_TELEPORTED && OPFOR_TELEPORTED"];




/*                            */
/* all kinds of optimizations */
/*                            */

// disable ai chatter
enableSentences false;

// optimize for PVP
disableRemoteSensors true;


if ((isServer) || (isDedicated)) then {
	
	[] execVM "server\tfar\tfarsettings.sqf";

	[] execVM "server\objectives\detect_all_dead.sqf";
 	

 	respawn_helper = "Land_MetalBarrel_F" createVehicle (getPos opfor_teamlead);
	[[respawn_helper, true, [0,1,0], 180], "ace_dragging_fnc_setdraggable", true, true] call BIS_fnc_MP;
	[respawn_helper] execVM "server\barrelcapture\barrelcapture.sqf";

};


if !(isDedicated) then {

	

	[] execVM "player\intro\adjustInitialSpawnPosition.sqf";
	[] execVM "player\intro\helpBriefing.sqf";

	if (BLUFOR_TELEPORTED && didJIP) then {
		player setDamage 1;
	};

	switchMoveEverywhere = compileFinal "_this select 0 switchMove (_this select 1);";

	[] call showIntro;
	[] spawn {
		sleep (random 3);
		[player, BLUFORCE, OPFORCE] execVM "common\loadout\_client.sqf"; diag_log format ["setup: loadout %1 initiated",player];
	};
};