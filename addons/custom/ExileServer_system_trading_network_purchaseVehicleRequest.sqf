/**
 * ExileServer_system_trading_network_purchaseVehicleRequest
 *
 * Exile Mod
 * www.exilemod.com
 * � 2015 Exile Mod Team
 *
 * This work is licensed under the Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
 * To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-nd/4.0/.
 */
 
private["_sessionID","_parameters","_vehicleClass","_pinCode","_playerObject","_salesPrice","_playerMoney","_position","_vehicleObject","_responseCode"];
_sessionID = _this select 0;
_parameters = _this select 1;
_vehicleClass = _parameters select 0;
_pinCode = _parameters select 1;
try
{
    _playerObject = _sessionID call ExileServer_system_session_getPlayerObject;
    if (isNull _playerObject) then
    {
        throw 1;
    };
    if !(alive _playerObject) then
    {
        throw 2;
    };
    if (_playerObject getVariable ["ExileMutex",false]) then
    {
        throw 12;
    };
    _playerObject setVariable ["ExileMutex", true];
    if !(isClass (missionConfigFile >> "CfgExileArsenal" >> _vehicleClass) ) then
    {
        throw 3;
    };
    _salesPrice = getNumber (missionConfigFile >> "CfgExileArsenal" >> _vehicleClass >> "price");
    if (_salesPrice <= 0) then
    {
        throw 4;
    };
    _playerMoney = _playerObject getVariable ["ExileMoney", 0];
    if (_playerMoney < _salesPrice) then
    {
        throw 5;
    };
    if !((count _pinCode) isEqualTo 4) then
    {
        throw 11;
    };
    if (_vehicleClass isKindOf "Ship") then
    {
        _position = [(getPosATL _playerObject), 80, 10] call ExileClient_util_world_findWaterPosition;
        _vehicleObject = [_vehicleClass, _position, (random 360), true, _pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
    }
    else
    {
        _position = (getPos _playerObject) findEmptyPosition [10, 175, _vehicleClass];
        if (_position isEqualTo []) then
        {
            throw 13;
        };
        _vehicleObject = [_vehicleClass, _position, (random 360), true, _pinCode] call ExileServer_object_vehicle_createPersistentVehicle;
    }; 
    _vehicleObject setVariable ["ExileOwnerUID", (getPlayerUID _playerObject)];
    _vehicleObject setVariable ["ExileIsLocked",0];
    _vehicleObject lock 0;
    _vehicleObject call ExileServer_object_vehicle_database_insert;
    _vehicleObject call ExileServer_object_vehicle_database_update;
    _playerMoney = _playerMoney - _salesPrice;
    _playerObject setVariable ["ExileMoney", _playerMoney];
    format["setAccountMoney:%1:%2", _playerMoney, (getPlayerUID _playerObject)] call ExileServer_system_database_query_fireAndForget;
    [_sessionID, "purchaseVehicleResponse", [0, netId _vehicleObject, str _playerMoney]] call ExileServer_system_network_send_to;
    _vehiclePurchaseLog = format ["PLAYER: %1:%5 BOUGHT VEH: %4 FOR %2 POPTABS | PLAYER TOTAL MONEY: %3",_playerObject,_salesPrice,_playerMoney,_vehicleClass,(getPlayerUID _playerObject)];
    'ARMA_LOG' callExtension format['A3_EXILE_VEHPURCHASELOG:%1',_vehiclePurchaseLog];
}
catch
{
    _responseCode = _exception;
    [_sessionID, "purchaseVehicleResponse", [_responseCode, "", ""]] call ExileServer_system_network_send_to;
};
if !(isNull _playerObject) then
{
    _playerObject setVariable ["ExileMutex", false];
};
true