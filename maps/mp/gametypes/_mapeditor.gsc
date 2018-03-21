#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;


initMapEdit()
{
	self thread maps\mp\gametypes\_hud_message::hintMessage("^2Press [{+actionslot 3}] for UFO Mode");
	self thread godmode();
	self thread ufomode();
}


ufomode()
{
	self endon("death");
	self notifyOnPlayerCommand( "ufotoggle", "+actionslot 3" );
	maps\mp\gametypes\_spectating::setSpectatePermissions();
	self.ufomode = 0;
		
	while(1)
	{
		self waittill("ufotoggle");
		
		if(self.ufomode == 0)
		{
			self iprintln("^2UFO Mode Enabled");
			self allowSpectateTeam( "freelook", true );
			self.sessionstate = "spectator";
			self.ufomode = 1;
		}
		else if(self.ufomode == 1)
		{
			self iprintln("^1UFO Mode Disabled");
			self.sessionstate = "playing";
			self allowSpectateTeam( "freelook", false );
			self.ufomode = 0;
		}
	}
}

godmode()
{
	self iprintln("^2God Mode Enabled");
	self.maxhealth=90000;
	self.health=self.maxhealth;
	setDvar("bg_fallDamageMaxHeight",9999);
	setDvar("bg_fallDamageMinHeight",9998);
}
