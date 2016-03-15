/**
 * ExileClient_system_lootManager_thread_spawn
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_spawnRadius","_minimumDistanceToTraderZones","_minimumDistanceToTerritories","_lootLifeTime","_buildings","_buildingNetIdsToSpawnLootIn","_building","_lastTimeSentToServer"];
if !(alive player) exitWith {false};
if !((vehicle player) isEqualTo player) exitWith {false};
_spawnRadius = getNumber (missionConfigFile >> "CfgExileLootSettings" >> "spawnRadius");
_minimumDistanceToTraderZones = getNumber (missionConfigFile >> "CfgExileLootSettings" >> "minimumDistanceToTraderZones");
_minimumDistanceToTerritories = getNumber (missionConfigFile >> "CfgExileLootSettings" >> "minimumDistanceToTerritories");
_lootLifeTime = getNumber (missionConfigFile >> "CfgExileLootSettings" >> "lifeTime") * 60;
_buildings = player nearObjects ["House", _spawnRadius];

	   //these next 6 lines add the wreck classes to the spawnable buildings array for the heliCrashes
      _truckWrecks = player nearObjects ["Land_Wreck_HMMWV_F", _spawnRadius];
      _buildings append _truckWrecks;
      _heliWrecks1 = player nearObjects ["Land_UWreck_MV22_F", _spawnRadius];
      _buildings append _heliWrecks1;

_buildingNetIdsToSpawnLootIn = [];
{
	_building = _x;
	try 
	{
		if (isObjectHidden _building) throw false;
		_lastTimeSentToServer = _building getVariable ["ExileLastLootRequestedAt", -99999];
		if ((time - _lastTimeSentToServer) < _lootLifeTime) throw false;
		if (_minimumDistanceToTraderZones > 0) then
		{
			if ([_building, _minimumDistanceToTraderZones] call ExileClient_util_world_isTraderZoneInRange) then
			{
				throw false;
			};
		};
		if (_minimumDistanceToTerritories > 0) then
		{
			if ([_building, _minimumDistanceToTerritories] call ExileClient_util_world_isTerritoryInRange) then
			{
				throw false;
			};
		};
		_buildingNetIdsToSpawnLootIn pushBack (netId _building);
		_building setVariable ["ExileLastLootRequestedAt", time];
	}
	catch 
	{
	};
}
forEach _buildings;
if ((count _buildingNetIdsToSpawnLootIn) > 0) then 
{
	["spawnLootRequest", [_buildingNetIdsToSpawnLootIn]] call ExileClient_system_network_send;
};