#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;

//creates the player hud
initPlayerHUD()
{
	//Right Top HUD
	a = 0.85;
	b = 0;
	s = 15;
	i = 0;
	x = 0;
	
	//ufomode
	self.playerhud_ufo = NewClientHudElem( self );
	self.playerhud_ufo.alignX = "right";
	self.playerhud_ufo.alignY = "top";
	self.playerhud_ufo.horzAlign = "right";
	self.playerhud_ufo.vertAlign = "top";
	self.playerhud_ufo.x = x;
	self.playerhud_ufo.y = b + (s * i);
	self.playerhud_ufo.foreground = true;
	self.playerhud_ufo.fontScale = .45;
	self.playerhud_ufo.font = "hudbig";
	self.playerhud_ufo.alpha = a;

	i++;
	
	//godmode
	self.playerhud_god = NewClientHudElem( self );
	self.playerhud_god.alignX = "right";
	self.playerhud_god.alignY = "top";
	self.playerhud_god.horzAlign = "right";
	self.playerhud_god.vertAlign = "top";
	self.playerhud_god.x = x;
	self.playerhud_god.y = b + (s * i);
	self.playerhud_god.foreground = true;
	self.playerhud_god.fontScale = .45;
	self.playerhud_god.font = "hudbig";
	self.playerhud_god.alpha = a;
	
	
	//Left Top HUD
	a = 0.85;
	b = 0;
	s = 15;
	i = 0;
	x = 0;
	
	//coordinates
	self.playerhud_cords = NewClientHudElem( self );
	self.playerhud_cords.alignX = "left";
	self.playerhud_cords.alignY = "top";
	self.playerhud_cords.horzAlign = "left";
	self.playerhud_cords.vertAlign = "top";
	self.playerhud_cords.x = x;
	self.playerhud_cords.y = b + (s * i);
	self.playerhud_cords.foreground = true;
	self.playerhud_cords.fontScale = .45;
	self.playerhud_cords.font = "hudbig";
	self.playerhud_cords.alpha = a;
	
	i++;
	
	self.playerhud_angles = NewClientHudElem( self );
	self.playerhud_angles.alignX = "left";
	self.playerhud_angles.alignY = "top";
	self.playerhud_angles.horzAlign = "left";
	self.playerhud_angles.vertAlign = "top";
	self.playerhud_angles.x = x;
	self.playerhud_angles.y = b + (s * i);
	self.playerhud_angles.foreground = true;
	self.playerhud_angles.fontScale = .45;
	self.playerhud_angles.font = "hudbig";
	self.playerhud_angles.alpha = a;
	

}

//resets the Player HUD info to default values on spawn
ResetPlayerHUD()
{
	self.playerhud_ufo setText("Ufomode: Inactive");
}

ufomode()
{
	maps\mp\gametypes\_spectating::setSpectatePermissions();
	self.ufomode = 0;
		
	while(1)
	{
		self waittill("+gostand");
		
		if(self.ufomode == 0)
		{
			self.playerhud_ufo setText("Ufomode: Active");
			self.playerhud_ufo.glowColor = ( 0, 1, 0 );
			
			self allowSpectateTeam( "freelook", true );
			self.sessionstate = "spectator";
			self.ufomode = 1;
		}
		else if(self.ufomode == 1)
		{
			self.playerhud_ufo setText("Ufomode: Inactive");
			self.playerhud_ufo.glowColor = ( 1, 0, 0 );
			
			self.sessionstate = "playing";
			self allowSpectateTeam( "freelook", false );
			self.ufomode = 0;
		}
	}
}

godmode()
{
	self.playerhud_god setText("Godmode: Active");
	self.playerhud_god.glowColor = ( 0, 1, 0 );			
	
	self.maxhealth=90000;
	self.health=self.maxhealth;
	setDvar("bg_fallDamageMaxHeight",9999);
	setDvar("bg_fallDamageMinHeight",9998);
	self.godmode = 1;
}

//function that prints player cords and angle; uncomment function call in _rank to enable
//the middle number in Angles in the one necessary for SetSpawnPoint and SetSpawnZone
CollectSpawnCords()
{	
	angles[1] = [];
	cords[1] = [];

	while(1)
	{
		cords[0] = self GetOrigin();
		angles[0] = self GetPlayerAngles();
		
		self.playerhud_cords setText("Cords (x, y , z): (" + int(cords[0][0]) + " ," + int(cords[0][1]) + " ," + int(cords[0][2]) + ")");
		self.playerhud_angles setText("Angles: (x, y): (" + int(angles[0][0]) + " ," + int(angles[0][1]) + ")");
		
		wait 0.1;
		
		/*
		for(i = 0; i < angles.size; i++)
		{
			iPrintLn("Angles[" + i + "] " + angles[0][i]);
			wait 0.5;
		}
		*/
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