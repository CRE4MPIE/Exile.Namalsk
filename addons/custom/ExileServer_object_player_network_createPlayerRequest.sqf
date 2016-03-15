/**
 * ExileServer_object_player_network_createPlayerRequest
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License. 
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_requestingPlayer","_spawnLocationMarkerName","_playerUID","_accountData","_bambiPlayer","_cargoType"];
_sessionID = _this select 0;
_parameters = _this select 1;
_requestingPlayer = _sessionID call ExileServer_system_session_getPlayerObject;
try
{
	if (isNull _requestingPlayer) then 
	{
		throw format ["Session %1 requested a bambi character, but doesn't have a player object. Hacker or Monday?", _sessionID];
	};
	_spawnLocationMarkerName = _parameters select 0;
	_playerUID = getPlayerUID _requestingPlayer;
	if(_playerUID isEqualTo "")then
	{
		throw format ["Player: '%1' has no player UID. Arma/Steam Sucks!.",name _requestingPlayer];
	};
	_accountData = format["getAccountStats:%1", _playerUID] call ExileServer_system_database_query_selectSingle;
	_group = createGroup independent;
	_bambiPlayer = _group createUnit ["Exile_Unit_Player", [0,0,0], [], 0, "CAN_COLLIDE"];
	
	
	// Exile Ranks here ! by CRE4MPIE
	// Updated for Vanilla 4-1-2016
	
_respect = (_accountData select 1);
//_bambiplayer removeGoggles;
//sleep 0.1;
//removeheadgear _bambiPlayer;
//sleep 0.1;

switch (true) do 
{
    case (_respect > 2500 && _respect < 4999):
    {
	_bambiPlayer forceAddUniform "U_C_HunterBody_grn";
	_bambiPlayer addBackpackGlobal "B_AssaultPack_cbr";
	_bambiPlayer addVest "V_BandollierB_cbr";
	_bambiPlayer addHeadgear "H_Cap_tan";
	_bambiPlayer addItem "Exile_Item_Matches";
	_bambiPlayer addItem "Exile_Item_Vishpirin";
	_bambiPlayer linkItem "ItemGPS";
	_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
	_bambiPlayer addItem "ItemMap";
	_bambiPlayer addMagazine "Exile_Magazine_Swing";
	};
    case (_respect > 5000 && _respect < 9999):
   {
	_bambiPlayer forceAddUniform "U_BG_Guerilla3_1";
	_bambiPlayer addVest "V_Rangemaster_belt";
	_bambiPlayer addBackpackGlobal "B_AssaultPack_rgr";
	_bambiPlayer addHeadgear "H_Cap_khaki_specops_UK";
	_bambiPlayer addGoggles "G_Aviator";
	_bambiPlayer addItem "Exile_Item_Matches";
	_bambiPlayer addItem "Exile_Item_Vishpirin";
	_bambiPlayer linkItem "ItemGPS";
	_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
	_bambiPlayer addMagazine "Exile_Magazine_Swing";
	_bambiPlayer addItem "ItemMap";
	_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
   };
	case (_respect > 9999 && _respect < 19999):
   {
	_bambiPlayer forceAddUniform "U_I_G_resistanceLeader_F";
	_bambiPlayer addVest "V_Chestrig_rgr";
	_bambiPlayer addBackpackGlobal "B_FieldPack_oli";
	_bambiPlayer addHeadGear "H_Shemag_olive_hs";
	_bambiPlayer addItem "Exile_Item_Matches";
	_bambiPlayer linkItem "ItemGPS";
	_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
	_bambiPlayer addMagazine "Exile_Magazine_Swing";
	_bambiPlayer addItem "Exile_Item_BBQSandwich";
	_bambiPlayer addItem "ItemMap";
	_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
	_bambiPlayer addItem "Exile_Item_InstaDoc";
   };
    case (_respect > 19999 && _respect < 29999):
   {
	_bambiPlayer forceAddUniform "U_B_survival_uniform";
	for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "6Rnd_45ACP_Cylinder";};
	_bambiPlayer addVest "V_Chestrig_blk";
	_bambiPlayer addBackpackGlobal "B_FieldPack_blk";
	_bambiPlayer addGoggles "G_Sport_Blackred";
	_bambiPlayer addHeadgear "H_Beret_blk";
	_bambiPlayer addWeaponGlobal "hgun_Pistol_heavy_02_F";
	_bambiPlayer addItem "Exile_Item_Matches";
	_bambiPlayer linkItem "ItemGPS";
	_bambiPlayer linkItem "NVGoggles";
	_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
	_bambiPlayer addMagazine "Exile_Magazine_Swing";
	_bambiPlayer addItem "Exile_Item_BBQSandwich";
	_bambiPlayer addItem "ItemMap";
	_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
	_bambiPlayer addItem "Exile_Item_InstaDoc";
   }; 
    case (_respect > 29999 && _respect < 39999):
   {
  	_bambiPlayer forceAddUniform "U_B_CTRG_2";
	for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "16Rnd_9x21_Mag";};
	_bambiPlayer addVest "V_HarnessOGL_brn";
	_bambiPlayer addBackpackGlobal "B_Kitbag_rgr";
	_bambiPlayer addHeadgear "H_Watchcap_khk";
	_bambiPlayer addGoggles "G_Bandanna_tan";
 	_bambiPlayer addWeaponGlobal "hgun_P07_F";
	_bambiPlayer addItem "Exile_Item_Matches";
	_bambiPlayer linkItem "ItemGPS";
	_bambiPlayer linkItem "NVGoggles";
	_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
	_bambiPlayer addMagazine "Exile_Magazine_Swing";
	_bambiPlayer addItem "Exile_Item_BBQSandwich";
	_bambiPlayer addItem "ItemMap";
	_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
	_bambiPlayer addItem "Exile_Item_InstaDoc";
   };
    case (_respect > 39999 && _respect < 49999):
   {
	_bambiPlayer forceAddUniform "U_B_CTRG_1";
	for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "9Rnd_45ACP_Mag";};
	_bambiPlayer addVest "V_HarnessOGL_gry";
	_bambiPlayer addBackpackGlobal "B_TacticalPack_mcamo";
	_bambiPlayer addHeadgear "H_Bandanna_mcamo";
	_bambiPlayer addGoggles "G_Bandanna_khk";
 	_bambiPlayer addWeaponGlobal "hgun_ACPC2_F";
	_bambiPlayer addItem "Exile_Item_Matches";
	_bambiPlayer linkItem "ItemGPS";
	_bambiPlayer linkItem "NVGoggles";
	_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
	_bambiPlayer addMagazine "Exile_Magazine_Swing";
	_bambiPlayer addItem "Exile_Item_BBQSandwich";
	_bambiPlayer addItem "ItemMap";
	_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
	_bambiPlayer addItem "Exile_Item_InstaDoc";
   };
    case (_respect > 49999 && _respect < 69999):
   {
	_bambiPlayer forceAddUniform "U_I_CombatUniform";
	for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "11Rnd_45ACP_Mag";};
	_bambiPlayer addVest "V_TacVest_camo";
	_bambiPlayer addBackpackGlobal "B_Kitbag_sgg";
	_bambiPlayer addHeadgear "H_Bandanna_khk_hs";
	_bambiPlayer addGoggles "G_Bandanna_beast";
 	_bambiPlayer addWeapon "hgun_Pistol_heavy_01_F";
	_bambiPlayer addItem "Exile_Item_Matches";
	_bambiPlayer linkItem "ItemGPS";
	_bambiPlayer linkItem "NVGoggles";
	_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
	_bambiPlayer addMagazine "Exile_Magazine_Swing";
	_bambiPlayer addItem "Exile_Item_BBQSandwich";
	_bambiPlayer addItem "ItemMap";
	_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
   };
    case (_respect > 69999 && _respect < 89999):
   {
	_bambiPlayer forceAddUniform "U_O_Wetsuit";
	for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "30Rnd_9x21_Mag";};
	_bambiPlayer addVest "V_TacVestIR_blk";
	_bambiPlayer addBackpackGlobal "B_FieldPack_blk";
	_bambiPlayer addHeadgear "H_HelmetO_oucamo";
 	_bambiPlayer addWeaponGlobal "hgun_PDW2000_F";
	_bambiPlayer addItem "Exile_Item_Matches";
	_bambiPlayer linkItem "ItemGPS";
	_bambiPlayer linkItem "NVGoggles";
	_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
	_bambiPlayer addMagazine "Exile_Magazine_Swing";
	_bambiPlayer addItem "Exile_Item_BBQSandwich";
	_bambiPlayer addItem "ItemMap";
	_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
   };
     case (_respect > 89999 && _respect < 149999):
   {
	_bambiPlayer forceAddUniform "U_I_GhillieSuit";
	for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "30Rnd_9x21_Mag";};
	_bambiPlayer addVest "V_PlateCarrierSpec_rgr";
	_bambiPlayer addBackpackGlobal "B_Carryall_oli";
	_bambiPlayer addHeadgear "H_HelmetO_oucamo";
	_bambiPlayer addWeapon "SMG_02_F";
	_bambiPlayer addPrimaryWeaponItem "optic_Aco_smg";
	_bambiPlayer addItem "Exile_Item_Matches";
	_bambiPlayer linkItem "ItemGPS";
	_bambiPlayer linkItem "NVGoggles";
	_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
	_bambiPlayer addMagazine "Exile_Magazine_Swing";
	_bambiPlayer addItem "Exile_Item_BBQSandwich";
	_bambiPlayer addItem "ItemMap";
	_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
	_bambiPlayer addItem "Exile_Item_InstaDoc";
   };
     case (_respect > 149999):
   {
	_bambiPlayer forceAddUniform "U_I_FullGhillie_lsh";
	for "_i" from 1 to 2 do {_bambiPlayer addItemToUniform "30Rnd_45ACP_Mag_SMG_01";};
	_bambiPlayer addVest "V_PlateCarrierIA1_dgtl";
	_bambiPlayer addBackpackGlobal "B_Carryall_mcamo";
	_bambiPlayer addHeadgear "H_HelmetO_oucamo";
 	_bambiPlayer addWeaponGlobal "SMG_01_F";
	_bambiPlayer addPrimaryWeaponItem "muzzle_snds_acp";
	_bambiPlayer addPrimaryWeaponItem "optic_Hamr";
	_bambiPlayer addItem "Exile_Item_Matches";
	_bambiPlayer linkItem "ItemGPS";
	_bambiPlayer linkItem "NVGoggles";
	_bambiPlayer addWeaponGlobal "Exile_Melee_Axe";
	_bambiPlayer addMagazine "Exile_Magazine_Swing";
	_bambiPlayer addItem "Exile_Item_BBQSandwich";
	_bambiPlayer addItem "ItemMap";
	_bambiPlayer addItem "Exile_Item_PlasticBottleFreshWater";
	_bambiPlayer addItem "Exile_Item_InstaDoc";
   };
    default
    {	
	//_uniform = ["U_C_Poor_1","U_OrestesBody","U_BG_Guerilla2_2","U_BG_Guerilla2_3"] BIS_fnc_selectRandom;
	_bambiPlayer forceAddUniform "U_C_Poor_1";
	_bambiPlayer addItem "ItemMap";
	};
};
	
	{
		_cargoType = _x call ExileClient_util_cargo_getType;
		switch (_cargoType) do
		{
			case 1: 	{ _bambiPlayer addItem _x; };
			case 2: 	{ _bambiPlayer addWeaponGlobal _x; };
			case 3: 	{ _bambiPlayer addBackpackGlobal _x; };
			case 4:		{ _bambiPlayer linkItem _x; };
			default 	{ _bambiPlayer addItem _x; };
		};
	}
	forEach getArray(configFile >> "CfgSettings" >> "BambiSettings" >> "loadOut");
	[_sessionID, _requestingPlayer, _spawnLocationMarkerName, _bambiPlayer, _accountData] call ExileServer_object_player_createBambi;
}
catch
{
	_exception call ExileServer_util_log;
};