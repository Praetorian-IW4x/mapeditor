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
	
	//angles
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
	
	
	//Left Center HUD
	a = 0.85;
	b = 0;
	s = 15;
	i = 0;
	x = 0;
	
	//help help
	self.playerhud_help = NewClientHudElem( self );
	self.playerhud_help.alignX = "left";
	self.playerhud_help.alignY = "middle";
	self.playerhud_help.horzAlign = "left";
	self.playerhud_help.vertAlign = "middle";
	self.playerhud_help.x = x;
	self.playerhud_help.y = b + (s * i);
	self.playerhud_help.foreground = true;
	self.playerhud_help.fontScale = .45;
	self.playerhud_help.font = "hudbig";
	self.playerhud_help.alpha = a;
	
	i++;
	
	//help ufo
	self.playerhud_helpufo = NewClientHudElem( self );
	self.playerhud_helpufo.alignX = "left";
	self.playerhud_helpufo.alignY = "middle";
	self.playerhud_helpufo.horzAlign = "left";
	self.playerhud_helpufo.vertAlign = "middle";
	self.playerhud_helpufo.x = x;
	self.playerhud_helpufo.y = b + (s * i);
	self.playerhud_helpufo.foreground = true;
	self.playerhud_helpufo.fontScale = .45;
	self.playerhud_helpufo.font = "hudbig";
	self.playerhud_helpufo.alpha = a;
	
	i++;
	
	//help menu
	self.playerhud_helpmenu = NewClientHudElem( self );
	self.playerhud_helpmenu.alignX = "left";
	self.playerhud_helpmenu.alignY = "middle";
	self.playerhud_helpmenu.horzAlign = "left";
	self.playerhud_helpmenu.vertAlign = "middle";
	self.playerhud_helpmenu.x = x;
	self.playerhud_helpmenu.y = b + (s * i);
	self.playerhud_helpmenu.foreground = true;
	self.playerhud_helpmenu.fontScale = .45;
	self.playerhud_helpmenu.font = "hudbig";
	self.playerhud_helpmenu.alpha = a;
}

//resets the Player HUD info to default values on spawn
ResetPlayerHUD()
{

}

Menu()
{
	self.menuopen = 0;
	self.menu_currentpage = 0;
	self.menu_currentselection = 0;
	
	while(1)
	{
		self waittill("+actionslot 1");
		
		if(self.menuopen == 0)
		{
			self notify("menuopen");
			self.menuopen = 1;
			self freezeControls(true);
			self setBlurForPlayer(10.3,0.1);
			self VisionSetNakedForPlayer("ac130_inverted",0.01);
			startlistenMenuEvents();
			self drawMenu();
		}
		else if(self.menuopen == 1)
		{
			self notify("menuclose");
			self.menuopen = 0;
			self destroyMenu();
			self freezeControls(false);
			self setBlurForPlayer(0,0.5);
			self VisionSetNakedForPlayer(getDvar("mapname"),0.5);
			//self thread ufomode(0);
		}
		wait .1;
	}
}

initMenu()
{
	//Menupage, Slotnumber, Name / Function
	level.menu[2][14][0] = [];
	level NullMenuArray();
	level LoadMenuData();

	
	
	
	/*
	menu[0][0][0] = "name";
	menu[0][0][1] = ::Test;		
	*/
	/*
	menu[0][0][0] = "000";
	menu[0][0][1] = "001";
	menu[0][0][2] = "002";
	
	iprintln("000: " + menu[0][0][0]);
	iprintln("001: " + menu[0][0][1]);
	iprintln("002: " + menu[0][0][2]);
	*/

	/*
	self SayAll("Size" + menu.size);
	self SayAll("Size[0]" + menu[0].size);
	self SayAll("Size[0][0]" + menu[0][0].size);
	self SayAll("Size[0][0][0]" + menu[0][0][0].size);
	*/
}

NullMenuArray()
{
	for(i = 0; i <= 2; i++)
	{
		for(c = 0; c <= 14; c++)
		{
			level.menu[i] = 0;
			level.menu[i][c] = 0;
			level.menu[i][c][0] = 0;
		}
	}
}

destroyMenu()
{
	iprintln("Destroy");
	self.centerTitle destroy();
	self.leftTitle destroy();
	self.rightTitle destroy();
}

drawMenu()
{	
	self endon("menuclose");
	
	iprintln("Draw Menu");
	
	self.rightTitle = self createFontString("hudbig",0.8);
	self.rightTitle setPoint( "CENTER", "TOP", 240, 17 );
	
	self.leftTitle = createFontString("hudbig",0.8);
	self.leftTitle setPoint( "CENTER", "TOP", -240, 17 );
	
	self.centerTitle = createFontString("hudbig",0.8);
	self.centerTitle setPoint( "CENTER", "TOP", 0, 17 );	
	
	//self.centerTitle setText("Text");
	//self.centerTitle setText(level.menu[0]);
	//self.centerTitle setText(level.menu[self.menu_currentpage]);
	
	
		//iprintln("CurrentPage: " + self.menu_currentpage);
		/*
		iprintln("Menu Size: " + level.menu.size);
		wait 2;
		iprintln("Menu 0 Size: " + level.menu[0].size);
		iprintln("Menu 00 Size: " + level.menu[0][0].size);
		
		for(counter = 0; counter <= level.menu.size; counter++)
		{
			iprintln("Menu[" + counter + "]: " + level.menu[counter]);
			wait 1;
		}
		*/
		
		//Draw Titles		
		switch(level.menu.size)
		{
			case 0:
				iprintln("Case 0");
				self.centerTitle setText(level.menu[self.menu_currentpage]);
			break;
			
			case 1:
				iprintln("Case 1");
				self.centerTitle setText(level.menu[self.menu_currentpage]);
				
				if(self.menu_currentpage ==  1)
				{
					self.leftTitle setText(level.menu[self.menu_currentpage - 1]);
					self.rightTitle setText(level.menu[self.menu_currentpage - 1]);
				}
				else
				{
					self.leftTitle setText(level.menu[self.menu_currentpage + 1]);
					self.rightTitle setText(level.menu[self.menu_currentpage + 1]);
				}
			break;
			
			default:
				iprintln("Case Default");
				self.centerTitle setText("< " + level.menu[self.menu_currentpage] + " >");
				
				if(self.menu_currentpage >=  1)
				{
					self.leftTitle setText(level.menu[self.menu_currentpage - 1]);
				}
				else if(self.menu_currentpage == 0)
				{
					self.leftTitle setText(level.menu[level.menu.size - 1]);
				}
				
				//Right Title
				if(self.menu_currentpage <= level.menu.size - 2)
				{
					self.rightTitle setText(level.menu[self.menu_currentpage + 1]);	
				}
				else if(self.menu_currentpage == level.menu.size - 1)
				{
					self.rightTitle setText(level.menu[0]);
				}	
			break;
		}
		//waittill ("draw");

}

LoadMenuData()
{
	//Menu 0
	level.menu[0] = "Menu 0";
	level.menu[1] = "Menu 1";
	level.menu[2] = "Menu 2";
	/*
	level.menu[0][0] = "Name 1";
	level.menu[0][1] = "Name 2";
	level.menu[0][2] = "Name 3";
	level.menu[0][3] = "Name 4";
	level.menu[0][4] = "Name 5";
	level.menu[0][5] = "Name 6";
	level.menu[0][6] = "Name 7";
	level.menu[0][7] = "Name 8";
	level.menu[0][8] = "Name 9";
	level.menu[0][9] = "Name 10";
	level.menu[0][10] = "Name 11";
	level.menu[0][11] = "Name 12";
	level.menu[0][12] = "Name 13";
	level.menu[0][13] = "Name 14";
	level.menu[0][14] = "Name 15";
	level.menu[0][15] = "Name 16";
	*/
	/*
	//Menu 1
	level.menu[1] = "Menu 1";
	level.menu[1][0] = "Name 1";
	level.menu[1][1] = "Name 2";
	level.menu[1][2] = "Name 3";
	level.menu[1][3] = "Name 4";
	level.menu[1][4] = "Name 5";
	level.menu[1][5] = "Name 6";
	level.menu[1][6] = "Name 7";
	level.menu[1][7] = "Name 8";
	level.menu[1][8] = "Name 9";
	level.menu[1][9] = "Name 10";
	level.menu[1][10] = "Name 11";
	level.menu[1][11] = "Name 12";
	level.menu[1][12] = "Name 13";
	level.menu[1][13] = "Name 14";
	level.menu[1][14] = "Name 15";
	level.menu[1][15] = "Name 16";
	
	//Menu 2
	level.menu[2] = "Menu 2";
	level.menu[2][0] = "Name 1";
	level.menu[2][1] = "Name 2";
	level.menu[2][2] = "Name 3";
	level.menu[2][3] = "Name 4";
	level.menu[2][4] = "Name 5";
	level.menu[2][5] = "Name 6";
	level.menu[2][6] = "Name 7";
	level.menu[2][7] = "Name 8";
	level.menu[2][8] = "Name 9";
	level.menu[2][9] = "Name 10";
	level.menu[2][10] = "Name 11";
	level.menu[2][11] = "Name 12";
	level.menu[2][12] = "Name 13";
	level.menu[2][13] = "Name 14";
	level.menu[2][14] = "Name 15";
	level.menu[2][15] = "Name 16";
	*/
}

startlistenMenuEvents()
{
	self thread listenMenuEvent(::MenuNavigation, "cycleLeft", "+actionslot 3");	//3
	self thread listenMenuEvent(::MenuNavigation, "cycleRight", "+smoke");			//4
	self thread listenMenuEvent(::MenuNavigation, "scrollup", "+actionslot 2");		//5
	self thread listenMenuEvent(::MenuNavigation, "scrolldown", "+actionslot 4");	//6
	self thread listenMenuEvent(::MenuNavigation, "select" , "+gostand");			//Spacebar
}

//event listener that executes function on event
listenMenuEvent(function, command, event)
{
	self endon ("menuclose");
	
	while(1)
	{
		self waittill(event);
		self thread [[function]](command);
	}
}

MenuNavigation(command)
{
	switch(command)
	{
		case "cycleLeft":
			self iprintln("cycleLeft");
			
			if(self.menu_currentpage == 0)
			{
				self.menu_currentpage = level.menu.size - 1;
			}
			else
			{
				self.menu_currentpage--;
			}
			 
		break;
		
		case "cycleRight":
			self iprintln("cycleRight");
			
			if(self.menu_currentpage == level.menu.size - 1)
			{
				self.menu_currentpage = 0;
			}
			else
			{
				self.menu_currentpage++;
			}

		break;
		
		case "scrollup":
			self iprintln("scrollup");
		break;

		case "scrolldown":
			self iprintln("scrolldown");
		break;

		case "select":
			self iprintln("select");
		break;		
		
		default:
		break;
	}
	self destroyMenu();
	self drawMenu();
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

ufomode(currentstate)
{	
	//self endon ("menuopen");
	maps\mp\gametypes\_spectating::setSpectatePermissions();
	self.ufomode = currentstate;
		
	while(1)
	{
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
		self waittill("+gostand");
		wait .05;
	}
}

HelpHUD()
{
	self.help = 0;
	
	while(1)
	{
		if(self.help == 0)
		{
			self.playerhud_help setText("Press [{+melee}] to toggle help");
			self.playerhud_helpufo setText("Press [{+gostand}] to toggle ufomode");
			self.playerhud_helpmenu setText("Press [{+actionslot 1}] to toggle menu");
			
			self.help = 1;	
		}
		else if(self.help == 1)
		{
			self.playerhud_help setText("");
			self.playerhud_helpufo setText("");
			self.playerhud_helpmenu setText("");
			
			self.help = 0;
		}		
		wait .1;
		self waittill("+melee");
	}
}

CoordsHUD()
{	
	cords[1][3] = [];

	while(1)
	{		
		cords[0] = self GetOrigin();
		self.playerhud_cords setText("Cords (x, y, z): ( " + int(cords[0][0]) + " , " + int(cords[0][1]) + " , " + int(cords[0][2]) + " )");
		wait 1;
	}
}

AnglesHUD()
{
	angles[1][3] = [];
	
	while(1)
	{		
		angles[0] = self GetPlayerAngles();
		self.playerhud_angles setText("Angles: (x, y): ( " + int(angles[0][0]) + " , " + int(angles[0][1]) + " )");			
		wait 1;
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
	self.buttonAction[24]="+actionslot 1";		//N		
	
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