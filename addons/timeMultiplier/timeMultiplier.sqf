// Time Multiplier
// CRE4MPIE
// Creds to A3W, LouD for help

if (!isServer) exitWith {};

while {true} do
{
	if (daytime >= 19 || daytime < 5) then
	{
		setTimeMultiplier 30;
	}
	else
	{
		setTimeMultiplier 10;
	};

	uiSleep 30;
};