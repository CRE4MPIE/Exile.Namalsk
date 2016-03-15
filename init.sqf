[] execVM "addons\EnigmaRevive\init.sqf"; 					// Enigma Revive
[] execVM "IgiLoad\IgiLoadInit.sqf";

if (!isDedicated && hasInterface) then {
[] execvm "addons\killMessages\KillMessages.sqf";			// Kill Messages by GR8
};

_GF = [] execVM "addons\fog\fog.sqf";				//creepy ground fog between certain times