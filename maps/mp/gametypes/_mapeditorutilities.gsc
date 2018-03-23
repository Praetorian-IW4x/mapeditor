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
	self.menu_previouspage = 0;
	self.menu_currentselection = 1;
	
	while(1)
	{
		self waittill("+actionslot 1");
		
		if(self.menuopen == 0)
		{
			self notify("menuopen");
			self.menuopen = 1;
			self freezeControls(true);
			self setBlurForPlayer(10.3,0.1);
			startlistenMenuEvents();
			self thread drawMenu();
		}
		else if(self.menuopen == 1)
		{
			self notify("menuclose");
			self destroyMenu();
			self.menuopen = 0;
			self freezeControls(false);
			self setBlurForPlayer(0,0.5);
		}
		wait .1;
	}
}

initMenu()
{
	//Menupage, Slotnumber, Name / Function
	level.menu[2][15][2][20] = [];
	level LoadMenuData();
}


destroyMenu()
{
	self iprintln("Destroy");
	self.centerTitle destroy();
	self.leftTitle destroy();
	self.rightTitle destroy();
	
	//destroys previous menuoptions
	for(i = 1; i < level.menu[self.menu_previouspage].size; i++)
	{
		self.menuoption[i] destroy();
	}

	//destroys current menuoptions
	for(i = 1; i < level.menu[self.menu_currentpage].size; i++)
	{
		self.menuoption[i] destroy();
	}		
}

//initializes HUD Menu elements
initDrawMenu()
{	
	self.rightTitle = self createFontString("hudbig", 1);
	self.rightTitle setPoint( "CENTER", "TOP", 240, 17 );
	self.rightTitle setText("");
	
	self.leftTitle = createFontString("hudbig", 1);
	self.leftTitle setPoint( "CENTER", "TOP", -240, 17 );
	self.leftTitle setText("");
	
	self.centerTitle = createFontString("hudbig", 1);
	self.centerTitle setPoint( "CENTER", "TOP", 0, 17 );	
	self.centerTitle setText("");	
	
	self.menuoptions[level.menu[self.menu_currentpage].size] = [];
	
	for(i = 1; i <= level.menu[self.menu_currentpage].size - 1; i++)
	{
		self.menuoption[i] = createFontString("hudbig",0.8);
		self.menuoption[i] setPoint( "CENTER", "TOP", 0, 30 + i * 20 );
	}
}

drawMenu()
{	
	self endon("menuclose");
		
	while(1)
	{
		self initDrawMenu();
		//self thread destroyMenu();
		
		iprintln("Draw Menu");
		
		//Draw Titles		
		switch(level.menu.size)
		{
			case 0:
				iprintln("Case 0");
				self.centerTitle setText("< " + level.menu[self.menu_currentpage][0][0] + " >");
			break;
			
			case 1:
				iprintln("Case 1");
				self.centerTitle setText("< " + level.menu[self.menu_currentpage][0][0] + " >");
				
				if(self.menu_currentpage ==  1)
				{
					self.leftTitle setText(level.menu[self.menu_currentpage - 1][0][0]);
					self.rightTitle setText(level.menu[self.menu_currentpage - 1][0][0]);
				}
				else
				{
					self.leftTitle setText(level.menu[self.menu_currentpage + 1][0][0]);
					self.rightTitle setText(level.menu[self.menu_currentpage + 1][0][0]);
				}
			break;
			
			default:
				iprintln("Case Default");
				//iprintln("Current Page: " + self.menu_currentpage);
				self.centerTitle setText("< " + level.menu[self.menu_currentpage][0][0] + " >");
				
				if(self.menu_currentpage >=  1)
				{
					self.leftTitle setText(level.menu[self.menu_currentpage - 1][0][0]);
				}
				else if(self.menu_currentpage == 0)
				{
					self.leftTitle setText(level.menu[level.menu.size - 1][0][0]);
				}
				
				//Right Title
				if(self.menu_currentpage <= level.menu.size - 2)
				{
					self.rightTitle setText(level.menu[self.menu_currentpage + 1][0][0]);	
				}
				else if(self.menu_currentpage == level.menu.size - 1)
				{
					self.rightTitle setText(level.menu[0][0][0]);
				}	
			break;
		}
		
		//Draw Menuoptions
		for(i = 1; i <= level.menu[self.menu_currentpage].size - 1; i++)
		{
			//self.menuoption[i] setText("Piece");
			self.menuoption[i] setText(level.menu[self.menu_currentpage][i][0]);
			
			if(i == self.menu_currentselection)
			{
			self.menuoption[i].alpha = 1;
			self.menuoption[i].glowAlpha = 1;
			self.menuoption[i].glowColor = (0,255,0);
			}
		}
		self waittill("draw_menu");	
		destroyMenu();
	}
}

LoadMenuData()
{	
	level.menu[0][0][0] = "Menu 0";	
	level.menu[0][1][0] = "Name 01";
	level.menu[0][2][0] = "Name 02";
	level.menu[0][3][0] = "Name 03";
	level.menu[0][4][0] = "Name 04";
	level.menu[0][5][0] = "Name 05";
	
	level.menu[1][0][0] = "Menu 1";
	level.menu[1][1][0] = "Name 11";
	level.menu[1][2][0] = "Name 12";
	level.menu[1][3][0] = "Name 13";
	level.menu[1][4][0] = "Name 14";
	level.menu[1][5][0] = "Name 15";
	level.menu[1][6][0] = "Name 16";
	level.menu[1][7][0] = "Name 17";
	level.menu[1][8][0] = "Name 18";
	level.menu[1][9][0] = "Name 19";
	level.menu[1][10][0] = "Name 110";
	
	level.menu[2][0][0] = "Menu 2";
	level.menu[2][1][0] = "Name 21";
	level.menu[2][2][0] = "Name 22";
	level.menu[2][3][0] = "Name 23";
	level.menu[2][4][0] = "Name 24";
	level.menu[2][5][0] = "Name 25";	
	level.menu[2][6][0] = "Name 26";
	level.menu[2][7][0] = "Name 27";
	level.menu[2][8][0] = "Name 28";
	level.menu[2][9][0] = "Name 29";
	level.menu[2][10][0] = "Name 210";
	level.menu[2][11][0] = "Name 211";
	level.menu[2][12][0] = "Name 212";
	level.menu[2][13][0] = "Name 213";
	level.menu[2][14][0] = "Name 214";
	level.menu[2][15][0] = "Name 215";

}

startlistenMenuEvents()
{
	self thread listenMenuEvent(::MenuNavigation, "cycleLeft", "+actionslot 3");	//3
	self thread listenMenuEvent(::MenuNavigation, "cycleRight", "+smoke");			//4
	self thread listenMenuEvent(::MenuNavigation, "scrollup", "+actionslot 2");		//5
	self thread listenMenuEvent(::MenuNavigation, "scrolldown", "+actionslot 4");	//6
	self thread listenMenuEvent(::MenuNavigation, "select" , "+gostand");			//Spacebar
}

startlistenEvents()
{
	//self thread listenMenuEvent(::MenuNavigation, "cycleLeft", "+actionslot 3");	//3

}

//event listener that executes function on event
listenMenuEvent(function, command, event)
{
	self endon ("menuclose");
	
	while(1)
	{
		self waittill(event);
		self [[function]](command);
	}
}

MenuNavigation(command)
{
	switch(command)
	{
		case "cycleLeft":
			self iprintln("cycleLeft");
			self.menu_previouspage = self.menu_currentpage;
			self.menu_currentselection = 1;
			
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
			self.menu_currentselection = 1;
			
			self.menu_previouspage = self.menu_currentpage;
			
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
			
			if(self.menu_currentselection == 1)
			{
				self.menu_currentselection = level.menu[self.menu_currentpage].size - 1;
			}
			else
			{
				self.menu_currentselection--;
			}
		break;

		case "scrolldown":
			self iprintln("scrolldown");
			
			if(self.menu_currentselection == level.menu[self.menu_currentpage].size - 1)
			{
				self.menu_currentselection = 1;
			}
			else
			{
				self.menu_currentselection++;
			}			
		break;

		case "select":
			self iprintln("select");
		break;		
		
		default:
		break;
	}
	//work with notifies
	self notify("destroy_menu");
	self notify("draw_menu");
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
		self.playerhud_cords setText("Cords ( x, y, z ): ( " + int(cords[0][0]) + " , " + int(cords[0][1]) + " , " + int(cords[0][2]) + " )");
		wait 1;
	}
}

AnglesHUD()
{
	angles[1][3] = [];
	
	while(1)
	{		
		angles[0] = self GetPlayerAngles();
		self.playerhud_angles setText("Angles: ( x, y ) : " + int(angles[0][0]) + " , " + int(angles[0][1]) + " )");			
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