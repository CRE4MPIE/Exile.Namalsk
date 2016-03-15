/**
 * ExileClient_object_item_construct
 *
 * Exile Mod
 * www.exilemod.com
 * © 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_itemClassName","_minimumDistanceToTraderZones","_minimumDistanceToSpawnZones","_maximumNumberOfTerritoriesPerPlayer","_numberOfTerritories","_Reason","_cantBuildNear","_NearRoad","_TooNearRoads","_AIBasepos","_MinRange","_cantBuildDist"];
_itemClassName = _this select 0;
if( isClass(configFile >> "CfgMagazines" >> _itemClassName >> "Interactions" >> "Constructing") ) then
{
    if (findDisplay 602 != displayNull) then
    {
        (findDisplay 602) closeDisplay 2;
    };
    try
    {
        if !((vehicle player) isEqualTo player) then
        {
            throw "ConstructionVehicleWarning";  
        };
        _minimumDistanceToTraderZones = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToTraderZones");
        if ([getPosATL player, _minimumDistanceToTraderZones] call ExileClient_util_world_isTraderZoneInRange) then
        {
            throw "ConstructionTraderZoneWarning";
        };
        _minimumDistanceToSpawnZones = getNumber (missionConfigFile >> "CfgTerritories" >> "minimumDistanceToSpawnZones");
        if ([getPosATL player, _minimumDistanceToSpawnZones] call ExileClient_util_world_isSpawnZoneInRange) then
        {
            throw "ConstructionSpawnZoneWarning";
        };
       
 
_cantBuildNear = [


            "Land_Dome_Big_F",
			"Land_Dome_Small_F",
            "Land_Barracks_ruins_F",
			"Land_i_Barracks_V1_F",
            "Land_i_Barracks_V1_dam_F",
			"Land_i_Barracks_V2_F",
            "Land_i_Barracks_V2_dam_F", 
			"Land_u_Barracks_V2_F",
            "Land_Budova4_in",
			"Land_Mil_Barracks_i",
            "Land_Mil_Guardhouse",
			"Land_Barrack2",
            "Land_tav_Barrack2",
			"Land_Mil_Barracks_L",
            "Land_TentHangar_V1_F",
			"Land_Hangar_F",
            "Land_Airport_Tower_F",
			"Land_Hospital_main_F",
            "Land_Hospital_side1_F",
			"Land_Hospital_side2_F",
            "Land_MilOffices_V1_F",
			"Land_TentHangar_V1_F",
            "Land_Hangar_F",
			"Land_Airport_Tower_F",
            "Land_Cargo_House_V1_F",
			"Land_Cargo_House_V2_F",
			"Land_Cargo_House_V3_F",
            "Land_Cargo_HQ_V1_F",
			"Land_Cargo_HQ_V2_F",
            "Land_Cargo_HQ_V3_F",
			"Land_Cargo_Patrol_V1_F",
            "Land_Cargo_Patrol_V2_F",
			"Land_Cargo_Patrol_V3_F",
			"Land_Cargo_Tower_V1_F",
            "Land_Cargo_Tower_V1_No1_F",
			"Land_Cargo_Tower_V1_No2_F",
            "Land_Cargo_Tower_V1_No3_F",
			"Land_Cargo_Tower_V1_No4_F",
            "Land_Cargo_Tower_V1_No5_F",
			"Land_Cargo_Tower_V1_No6_F",
            "Land_Cargo_Tower_V1_No7_F",
			"Land_Cargo_Tower_V2_F",
            "Land_Cargo_Tower_V3_F",
			"Land_Radar_F",
			"Land_i_Stone_Shed_V3_F",
			"Land_dp_mainFactory_F",
			"Land_i_House_Small_02_V1_F",
			"Land_Slum_House03_F",
			"Land_i_House_Small_03_V1_F",
			"Land_i_House_Big_02_V1_F",
			"Land_ReservoirTank_V1_F",
			"Land_R_Minaret",
			"Land_i_House_Big_01_V3_F",
			"Land_Cargo_HQ_V1_F",
			"Land_Unfinished_building_01_F",
			"Land_Offices_01_V1_F",
			"Land_Ind_Workshop01_04",
			"Land_Slum_House01_F",
			"Land_cargo_house_slum_F",
			"Land_i_Shop_01_V1_F",
			"Land_i_Shop_01_V2_F",
			"Land_i_Shop_02_V1_F",
			"Land_i_Shop_02_V3_F",
			"Land_i_Stone_HouseBig_V2_F",
			"Land_i_Stone_HouseBig_V3_F",
			"Land_i_Stone_HouseSmall_V1_F",
			"Land_i_Stone_Shed_V1_dam_F",
			"Land_i_Stone_HouseSmall_V3_F",
			"Land_d_House_Big_02_V1_F",
			"Land_i_House_Small_01_V3_F",
			"Land_i_House_Big_01_V3_F",
			"Land_i_House_Big_02_V2_dam_F",
			"Land_i_Shop_01_V3_dam_F",
			"Land_u_Shop_01_V1_F",
			"Land_Church_02a",
			"Land_ReservoirTower_F",
			"Land_A_Castle_Donjon",
			"Land_A_Castle_Bergfrit",
			"Land_A_Castle_Wall1_20",
			"Land_A_Castle_Wall2_30",
			"Land_A_Castle_Wall1_End",
			"Land_A_Castle_Wall1_End_2",
			"Land_A_Castle_Wall2_End",
			"Land_A_Castle_Bastion",
			"Land_A_Castle_Gate",
			"Land_Ss_hangar",
			"land_1",
			"land_2",
			"Land_A_Crane_02a",
			"Land_A_Crane_02b",
			"Land_A_CraneCon",
			"Land_A_Hospital",
			"Land_A_Office01",
			"Land_A_Office02",
			"land_AII_last_floor",
			"land_AII_middle_floor",
			"land_AII_upper_part",
			"land_b_small1",
			"Land_Barn_Metal",
			"Land_Barn_W_01",
			"Land_bouda2_vnitrek",
			"land_bud2",
			"Land_budova4_winter",
			"land_bunka",
			"land_cast1",
			"land_cast2",
			"land_chat_tr",
			"land_dlouhy1",
			"land_dlouhy2",
			"land_domek_podhradi_1",
			"land_dr_1",
			"land_dr_2",
			"Land_dulni_bs",
			"Land_dum_ras",
			"Land_dum_zboreny",
			"Land_dum_zboreny_total",
			"land_f_b1",
			"land_f_b2",
			"Land_Fuel_tank_stairs",
			"land_fuelstation_w",
			"land_garaze",
			"land_hala1",
			"land_hlaska",
			"Land_Hlidac_budka",
			"land_hotel_p1",
			"land_hotel_p2",
			"Land_HouseV2_01B",
			"Land_HouseV2_04_interier",
			"Land_HouseV2_05",
			"Land_HouseV_1I1",
			"Land_HouseV_1I4",
			"Land_houseV_2T2",
			"Land_HouseV_3I1",
			"Land_HouseV_3I2",
			"Land_HouseV_3I3",
			"Land_HouseV_3I4",
			"Land_hut06",
			"Land_hut_old01",
			"Land_Ind_Expedice_1",
			"Land_Ind_IlluminantTower",
			"Land_Ind_MalyKomin",
			"Land_Ind_Pec_03a",
			"Land_Ind_Pec_03b",
			"Land_Ind_Quarry",
			"Land_Ind_SawMill",
			"Land_Ind_Stack_Big",
			"Land_Ind_Workshop01_01",
			"Land_Ind_Workshop01_02",
			"Land_Ind_Workshop01_04",
			"land_jzd_4silka",
			"land_jzd_bezstrechy",
			"land_jzd_kr1",
			"land_jzd_kr2",
			"land_jzd_silo_tes",
			"land_jzd_stodola1",
			"land_jzd_stodola2",
			"land_jzd_vodojem",
			"Land_KBud",
			"Land_komin",
			"land_kontejner_des",
			"land_kostelik_final_2122",
			"Land_kulna",
			"land_lodenice",
			"land_marsh1",
			"land_marsh2",
			"Land_Mil_Barracks_i",
			"Land_Misc_Cargo1Ao",
			"Land_Misc_Cargo1Bo",
			"Land_Misc_deerstand",
			"Land_Misc_PowerStation",
			"land_molovabud1",
			"Land_Nasypka",
			"land_Tovarna1",
			"Land_Tovarna2",
			"land_trubice",
			"Land_vez",
			"land_vstup",
			"Land_vys_budova_p2",
			"Land_Vysilac_FM",
			"land_vysoky2",
			"land_x_nadrz",
			"land_x_skladiste_low_te",
			"land_x_vetraci_komin",
			"land_x_vez_te",
			"land_zd_1",
			"land_zd_2",
			"Land_HouseV2_03",
			"land_seb_nasypka",
			"land_seb_near_fac",
			"land_seb_residental",
			"land_seb_rozvodna",
			"land_seb_vod_vez",
			"land_senik",
			"Land_Shed_Ind02",
			"Land_Shed_W01",
			"land_sklad2",
			"land_st_vez",
			"Land_stodola_old_open",
			"Land_stodola_open",
			"land_syp_r",
			"Land_Nav_Boathouse",
			"Land_Nav_Boathouse_PierL",
			"Land_Nav_Boathouse_PierR",
			"Land_NAV_Lighthouse",
			"land_nav_pier_c",
			"land_nav_pier_c2",
			"land_nav_pier_c2_end",
			"land_nav_pier_c_90",
			"land_nav_pier_c_big",
			"Land_nav_pier_m_2",
			"land_nav_pier_m_end",
			"Land_ns_jbad_A_GeneralStore_01",
			"Land_ns_Jbad_A_Stationhouse",
			"Land_ns_jbad_hangar_2",
			"Land_ns_Jbad_Ind_Garage01",
			"Land_ns_Jbad_Ind_PowerStation",
			"Land_ns_Jbad_Mil_Barracks",
			"Land_ns_Jbad_Mil_ControlTower",
			"Land_ns_Jbad_Mil_Guardhouse",
			"Land_ns_Jbad_Mil_Guardhouse_winter",
			"Land_ns_Jbad_Mil_House",
			"land_p1_v1",
			"land_p1_v2",
			"land_panelova2",
			"land_panelova3",
			"land_part1",
			"land_part2",
			"land_part3",
			"land_plynom",
			"land_pozorovatelna",
			"land_provoz1",
			"land_provoz2",
			"Land_psi_bouda",
			"Land_Rail_Semafor",
			"Land_Rail_Zavora",
			"Land_repair_center",
			"land_rozvodna",
			"Land_ruin_01",
			"Land_sara_domek_ruina",
			"land_seb_bouda1",
			"land_seb_bouda3",
			"Land_seb_bouda_plech",
			"land_seb_main_fac",
			"land_seb_mine_main_opt",
			"land_seb_mine_maringotka",
			"land_seb_mine_near",
			"land_seb_mine_near_bordel",
			"land_seb_nadrze",
			"Land_vys_budova_p1",
			"land_Mi8_Crashed"		
			
       ];
 
   /*     // PREVENT BUILDING NEAR ROADS
        _NearRoad = (position player) nearRoads 15;
        _TooNearRoads = _NearRoad select 0;
        if (!isNil "_TooNearRoads") then { throw "ROAD"; };        
    */   
        // PREVENT BUILDING NEAR AI BASE
		
		if(worldName == 'Namalsk')then
        {
            _AIBasepos = [9120,21484,0]; // Location of AI Base Mission
            _MinRange = 150; // Min distance to AI Base
            _cantBuildDist = 150; // Min distance to military buildings
        };
		
        if(worldName == 'Altis')then
        {
            _AIBasepos = [9120,21484,0]; // Location of AI Base Mission
            _MinRange = 1250; // Min distance to AI Base
            _cantBuildDist = 200; // Min distance to military buildings
        };
        if(worldName == 'Chernarus_Winter')then
        {
            _AIBasepos = [1122,7616,0]; // Location of AI Base Mission
            _MinRange = 500; // Min distance to AI Base
            _cantBuildDist = 250; // Min distance to military buildings
        };
        if(worldName == 'Taviana')then
        {
            _AIBasepos = [22724,19610,0]; // Location of AI Base Mission
            _MinRange = 2000; // Min distance to AI Base
            _cantBuildDist = 500; // Min distance to military buildings
            if ((player distance [10629,17365,0]) < 500) then { throw "minimumDistanceToTraderZones"; };
            if ((player distance [2178,7040,0]) < 500) then { throw "minimumDistanceToTraderZones"; };
            if ((player distance [16666,11617,0]) < 500) then { throw "minimumDistanceToTraderZones"; };
        };     
           
        _nearAIBase = (getPosATL player) distance _AIBasepos;
        if (_nearAIBase < _MinRange) then { throw "AIBASE"; };     
        if ({typeOf _x in _cantBuildNear} count nearestObjects[player, _cantBuildNear, _cantBuildDist] > 0) then { throw "MILITARY"; };
       
       
        if(_itemClassName isEqualTo "Exile_Item_Flag") then
        {
            _maximumNumberOfTerritoriesPerPlayer = getNumber (missionConfigFile >> "CfgTerritories" >> "maximumNumberOfTerritoriesPerPlayer");
            _numberOfTerritories = player call ExileClient_util_territory_getNumberOfTerritories;
            if (_numberOfTerritories >= _maximumNumberOfTerritoriesPerPlayer) then
            {
                throw "MaximumNumberOfTerritoriesReached";
            };
            call ExileClient_gui_setupTerritoryDialog_show;
        }
        else
        {
            [_itemClassName] call ExileClient_construction_beginNewObject;
        };
    }
    catch
    {
        if(_exception isEqualTo "MILITARY")then { ['Whoops', ['You cannot build within 150m any structure']] call ExileClient_gui_notification_event_addNotification; };
        if(_exception isEqualTo "AIBASE")then { ['Whoops', ['You cannot build near the AI base']] call ExileClient_gui_notification_event_addNotification; };
 //       if(_exception isEqualTo "ROAD")then { ['Whoops', ['You cannot build too close to roads']] call ExileClient_gui_notification_event_addNotification; };
 //       [_exception] call ExileClient_gui_notification_event_addNotification;      
    };
};
true



      