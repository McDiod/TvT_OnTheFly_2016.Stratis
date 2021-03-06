// These are the available fortifications. Add or take as you wish.

// Action text      - The text displayed by the action.
// Classname        - The classname of the object to be placed.
// Distance         - Minimum distance of the object from the player, in metres.
// Direction        - Direction the object will be rotated initially, in degrees (minimum 0, maximum 360).
// Direction range  - The range you can turn the object, in degrees (minimum 0, maximum 360).
//                    This means that the player will be able to set the direction of the object between `direction - direction_range / 2` and `direction + direction_range / 2` degrees.
//                    For example given 180 direction and 60 direction range, player will be able turn the object between 150 and 210 degrees.
// Code             - A piece of code that will be executed when the object placement is confirmed.
//                    Set it to {}, if you don't want to use it. The unit who confirmed the placement and the object placed, are passed as arguments to the code.
//                    An example code that hints the players name could look like {hint str (_this select 0);}.

plank_deploy_fortData = [

// Action text                      |  Classname                            |  Distance     |  Direction     |  Direction Range  |  Code
//--------------------------------------------------------------------------------------------------------------------------------------
["Dirt-Trench",                        	"Fort_EnvelopeSmall",            	    3,              0,                  360,            {}],
["Foliage",                             "01_bushes_01_b_canina2s_summer",       3,              0,                  360,            {}],
["Wide Sandbag fence",                  "land_Objects68",                       3,              0,                  360,            {}],
["H-Barrier watch tower",               "Land_HBarrierTower_F",                 15,             0,                  360,            {}],
["Short Sandbag fence",                 "Land_BagFence_Short_F",                3,              0,                  360,            {}],
["Razor Wire",                          "Land_Razorwire_F",                     6,              0,                  360,            {}],
["Concrete wall long",                  "Land_CncWall4_F",                      8,              0,                  360,            {}],
["Bunker Tower",                        "Land_BagBunker_Tower_F",               10,             0,                  360,            {}],
["Tanktrap",							"Hedgehog",							   	3,				180,				360,			{}],
["Small Bunker",                       	"land_Objects11", 		             	4, 			    180, 				360, 			{}],
["Sandbag Bunker",						"Land_BagBunker_Small_F",				4,				180,				360,			{}]
];