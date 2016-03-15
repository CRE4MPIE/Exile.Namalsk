// Exile Ranks here ! by CRE4MPIE
uiSleep 2;
_respect = ExileClientPlayerScore;

switch (true) do 
{
    case (_respect > 2500 && _respect < 4999):
    {
	_rank = "Enforcer";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Greetings survivor %2! Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn 5,000 respect for the next rank!</t>",_rank,name player],0,0,10,0] spawn bis_fnc_dynamictext;

	};
	
    case (_respect > 5000 && _respect < 9999):
   {
	 _rank = "Slayer";     
	 [parseText format["<t size='0.6'font='OrbitronLight'>Greetings survivor %2! Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn 10,000 respect for the next rank!</t>",_rank,name player],0,0,10,0] spawn bis_fnc_dynamictext;
   };
   
	case (_respect > 9999 && _respect < 19999):
   {
	_rank = "Hit Man";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Greetings survivor %2! Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn 20,000 respect for the next rank!</t>",_rank,name player],0,0,10,0] spawn bis_fnc_dynamictext;
   };
   
    case (_respect > 19999 && _respect < 29999):
   {
	_rank = "Executioner";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Greetings survivor %2! Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn 30,000 respect for the next rank!</t>",_rank,name player],0,0,10,0] spawn bis_fnc_dynamictext;
   };
   
    case (_respect > 29999 && _respect < 39999):
   {

	_rank = "Tyrant";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Greetings survivor %2! Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn 40,000 respect for the next rank!</t>",_rank,name player],0,0,10,0] spawn bis_fnc_dynamictext;
   };
   
    case (_respect > 39999 && _respect < 49999):
   {
	_rank = "Triggerman";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Greetings survivor %2! Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn 500,00 respect for the next rank!</t>",_rank,name player],0,0,10,0] spawn bis_fnc_dynamictext;
   };
   
    case (_respect > 49999 && _respect < 69999):
   {
	_rank = "Trooper";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Greetings survivor %2! Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn 70,000 respect for the next rank!</t>",_rank,name player],0,0,10,0] spawn bis_fnc_dynamictext;
   };
   
    case (_respect > 69999 && _respect < 89999):
   {
	_rank = "High Executioner";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Greetings survivor %2! Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn 90,000 respect for the next rank!</t>",_rank,name player],0,0,10,0] spawn bis_fnc_dynamictext;
   };
   
     case (_respect > 89999 && _respect < 149999):
   {

	_rank = "Reaper";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Greetings survivor %2! Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn 150,000 respect for the next rank!</t>",_rank,name player],0,0,10,0] spawn bis_fnc_dynamictext;
   };

     case (_respect > 149999):
   {
	_rank = "Supreme Overlord";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Greetings survivor %2! Your Rank is %1</t><br/>",_rank,name player],0,0,10,0] spawn bis_fnc_dynamictext;
   };
    default
    {	
	_rank = "Scrub";  
	 [parseText format["<t size='0.6'font='OrbitronLight'>Greetings survivor %2! Your Rank is %1</t><br/><t size='0.5'font='OrbitronLight'>You need to earn 2,500 respect for the next rank!</t>",_rank,name player],0,0,10,0] spawn bis_fnc_dynamictext;
	};
};