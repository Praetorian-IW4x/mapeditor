#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

ufomode()
{
	maps\mp\gametypes\_spectating::setSpectatePermissions();
	self.ufomode = 0;
		
	while(1)
	{
		self waittill("+gostand");
		
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
	self.godmode = 1;
	
	while(1)
	{
		self waittill("+frag");
		
		if(self.godmode == 0)
		{
			self iprintln("^2God Mode Enabled");
			self.maxhealth=90000;
			self.health=self.maxhealth;
			setDvar("bg_fallDamageMaxHeight",9999);
			setDvar("bg_fallDamageMinHeight",9998);
			self.godmode = 1;
		}
		else if(self.godmode == 1)
		{
			self iprintln("^1God Mode Disabled");
			self.maxhealth=100;
			self.health=self.maxhealth;
			setDvar("bg_fallDamageMaxHeight",500);
			setDvar("bg_fallDamageMinHeight",100);
			self.godmode = 0;
		}
	}
}

//function that prints player cords and angle; uncomment function call in _rank to enable
//the middle number in Angles in the one necessary for SetSpawnPoint and SetSpawnZone
CollectSpawnCords()
{
	while(1)
	{
		self iPrintLn("Coords: " + self getOrigin() + " Angles: " + self GetPlayerAngles());
		wait 1.5;
	}
}

initPlayerButtonMonitor()
{
	self.buttonAction = [];
	self.buttonAction[0]="weapnext";			// 1 / 2
	self.buttonAction[1]="+actionslot 3";		//3
	self.buttonAction[2]="+smoke";				//4
	self.buttonAction[3]="+actionslot 2";		//5
	self.buttonAction[4]="+actionslot 4";		//6
	self.buttonAction[5]="+moveleft";			//A
	self.buttonAction[6]="mp_QuickMessage";		//B
	self.buttonAction[7]="+togglecrouch";		//C
	self.buttonAction[8]="+moveright";			//D
	self.buttonAction[9]="+leanright";			//E
	self.buttonAction[10]="+activate";			//F
	self.buttonAction[11]="+frag";				//G
	self.buttonAction[12]="+leanleft";			//Q	
	self.buttonAction[13]="+reload";			//R
	self.buttonAction[14]="+back";				//S	
	self.buttonAction[15]="+chatmodepublic";	//T	
	self.buttonAction[16]="+melee";				//V	
	self.buttonAction[17]="+forward";			//W
	self.buttonAction[18]="+chatmodeteam";		//Y
	self.buttonAction[19]="+attack";			//LMB
	self.buttonAction[20]="+toggleads_throw";	//RMD
	self.buttonAction[21]="+gostand";			//Spacebar
	self.buttonAction[22]="toggleprone";		//Ctrl		
	self.buttonAction[23]="+breath_sprint";		//Shift		
	
	self.buttonPressed = [];
	for(i=0;i<self.buttonAction.size;i++)
	{
		self.buttonPressed[self.buttonAction[i]] = 0;
		self thread PlayerButtonMonitor( self.buttonAction[i] );
	}
}

PlayerButtonMonitor( buttonIndex )
{
	self endon ( "disconnect" );
	self notifyOnPlayerCommand( buttonIndex, buttonIndex );
	for (;;)
	{
		self waittill( buttonIndex );
		self.buttonPressed[ buttonIndex ] = 1;
		wait .1;
		self.buttonPressed[ buttonIndex ] = 0;
	}
}