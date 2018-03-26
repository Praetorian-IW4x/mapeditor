#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_forge;

//creates the player hud
initPlayerHUD()
{
	//Right Top HUD
	b = 0;
	s = 15;
	i = 0;
	
	//ufomode
	self.playerhud_ufo = NewClientHudElem( self );
	self.playerhud_ufo.alignX = "right";
	self.playerhud_ufo.alignY = "top";
	self.playerhud_ufo.horzAlign = "right";
	self.playerhud_ufo.vertAlign = "top";
	self.playerhud_ufo.y = b + (s * i);
	self.playerhud_ufo.foreground = true;
	self.playerhud_ufo.fontScale = .45;
	self.playerhud_ufo.font = "hudbig";

	i++;
	
	//godmode
	self.playerhud_god = NewClientHudElem( self );
	self.playerhud_god.alignX = "right";
	self.playerhud_god.alignY = "top";
	self.playerhud_god.horzAlign = "right";
	self.playerhud_god.vertAlign = "top";
	self.playerhud_god.y = b + (s * i);
	self.playerhud_god.foreground = true;
	self.playerhud_god.fontScale = .45;
	self.playerhud_god.font = "hudbig";
	
	
	//Left Top HUD
	b = 0;
	s = 15;
	i = 0;
	
	//coordinates
	self.playerhud_cords = NewClientHudElem( self );
	self.playerhud_cords.alignX = "left";
	self.playerhud_cords.alignY = "top";
	self.playerhud_cords.horzAlign = "left";
	self.playerhud_cords.vertAlign = "top";
	self.playerhud_cords.y = b + (s * i);
	self.playerhud_cords.foreground = true;
	self.playerhud_cords.fontScale = .45;
	self.playerhud_cords.font = "hudbig";
	
	i++;
	
	//angles
	self.playerhud_angles = NewClientHudElem( self );
	self.playerhud_angles.alignX = "left";
	self.playerhud_angles.alignY = "top";
	self.playerhud_angles.horzAlign = "left";
	self.playerhud_angles.vertAlign = "top";
	self.playerhud_angles.y = b + (s * i);
	self.playerhud_angles.foreground = true;
	self.playerhud_angles.fontScale = .45;
	self.playerhud_angles.font = "hudbig";
	
	
	//Left Center HUD
	b = 0;
	s = 15;
	i = 0;
	
	//help help
	self.playerhud_help = NewClientHudElem( self );
	self.playerhud_help.alignX = "left";
	self.playerhud_help.alignY = "middle";
	self.playerhud_help.horzAlign = "left";
	self.playerhud_help.vertAlign = "middle";
	self.playerhud_help.y = b + (s * i);
	self.playerhud_help.foreground = true;
	self.playerhud_help.fontScale = .45;
	self.playerhud_help.font = "hudbig";
	
	i++;
	
	//help ufo
	self.playerhud_helpufo = NewClientHudElem( self );
	self.playerhud_helpufo.alignX = "left";
	self.playerhud_helpufo.alignY = "middle";
	self.playerhud_helpufo.horzAlign = "left";
	self.playerhud_helpufo.vertAlign = "middle";
	self.playerhud_helpufo.y = b + (s * i);
	self.playerhud_helpufo.foreground = true;
	self.playerhud_helpufo.fontScale = .45;
	self.playerhud_helpufo.font = "hudbig";
	
	i++;
	
	//help menu
	self.playerhud_helpmenu = NewClientHudElem( self );
	self.playerhud_helpmenu.alignX = "left";
	self.playerhud_helpmenu.alignY = "middle";
	self.playerhud_helpmenu.horzAlign = "left";
	self.playerhud_helpmenu.vertAlign = "middle";
	self.playerhud_helpmenu.y = b + (s * i);
	self.playerhud_helpmenu.foreground = true;
	self.playerhud_helpmenu.fontScale = .45;
	self.playerhud_helpmenu.font = "hudbig";
	
	i++;
	
	//help cordsangles
	self.playerhud_cordsangles = NewClientHudElem( self );
	self.playerhud_cordsangles.alignX = "left";
	self.playerhud_cordsangles.alignY = "middle";
	self.playerhud_cordsangles.horzAlign = "left";
	self.playerhud_cordsangles.vertAlign = "middle";
	self.playerhud_cordsangles.y = b + (s * i);
	self.playerhud_cordsangles.foreground = true;
	self.playerhud_cordsangles.fontScale = .45;
	self.playerhud_cordsangles.font = "hudbig";
	
	i++;
	
	//help build cords notification dismiss
	self.playerhud_builddismiss = NewClientHudElem( self );
	self.playerhud_builddismiss.alignX = "left";
	self.playerhud_builddismiss.alignY = "middle";
	self.playerhud_builddismiss.horzAlign = "left";
	self.playerhud_builddismiss.vertAlign = "middle";
	self.playerhud_builddismiss.y = b + (s * i);
	self.playerhud_builddismiss.foreground = true;
	self.playerhud_builddismiss.fontScale = .45;
	self.playerhud_builddismiss.font = "hudbig";	
	
	
	//Center Bottom HUD
	b = 0;
	s = 25;
	i = 0;
	
	//Build Info 1
	self.playerhud_build1 = NewClientHudElem( self );
	self.playerhud_build1.alignX = "center";
	self.playerhud_build1.alignY = "bottom";
	self.playerhud_build1.horzAlign = "center";
	self.playerhud_build1.vertAlign = "bottom";
	self.playerhud_build1.y = b + (s * i);
	self.playerhud_build1.foreground = true;
	self.playerhud_build1.fontScale = .8;
	self.playerhud_build1.font = "hudbig";

	i++;
	
	//Build Info 2
	self.playerhud_build2 = NewClientHudElem( self );
	self.playerhud_build2.alignX = "center";
	self.playerhud_build2.alignY = "bottom";
	self.playerhud_build2.horzAlign = "center";
	self.playerhud_build2.vertAlign = "middle";
	self.playerhud_build2.y = b + (s * i);
	self.playerhud_build2.foreground = true;
	self.playerhud_build2.fontScale = .8;
	self.playerhud_build2.font = "hudbig";

	
	//Center Center Aimpoint
	self.playerhud_aimpoint = NewClientHudElem( self );
	self.playerhud_aimpoint.alignX = "center";
	self.playerhud_aimpoint.alignY = "bottom";
	self.playerhud_aimpoint.horzAlign = "center";
	self.playerhud_aimpoint.vertAlign = "middle";
	self.playerhud_aimpoint.y = -7;
	self.playerhud_aimpoint.foreground = true;
	self.playerhud_aimpoint.fontScale = 2;
	self.playerhud_aimpoint.font = "small";
	self.playerhud_aimpoint SetText(".");
	
}

Menu()
{
	if(self.menuopen == 0)
	{
		self notify("menuopen");
		self notify("CordsAnglesHUDstop");
		self.menuopen = 1;
		self Help();
		self freezeControls(true);
		self setBlurForPlayer(10.3,0.1);
		startlistenMenuEvents();
		self.playerhud_aimpoint SetText("");
		self dismissBuildNotification();
		self thread drawMenu();
	}
	else if(self.menuopen == 1)
	{
		self destroyMenu();		
		startlistenNonMenuEvents();
		self freezeControls(false);
		self setBlurForPlayer(0,0.5);
		self.menuopen = 0;
		self Help();
		self.playerhud_aimpoint SetText(".");
		if(self.DisplayCordsAnglesHUD == 1)
			self thread CordsAnglesHUD();
		self notify("menuclose");
	}
}

NullMenuArray()
{
	for(i = 0; i < self.menu.size - 1; i++)
	{
		for(c = 0; c < self.menu[i].size - 1; c++)
		{
			for(h = 0; h < self.menu[i][h].size - 1; h++)
			{
				self.menu[i][c][h] = 0;
				self.menu[i][c][h] = 0;
				self.menu[i][c][h] = 0;
				self.menu[i][c][h] = 0;				
			}
		}
	}
}

initMenu()
{
	//Menupage, Slotnumber, Name / Function
	self.menu[3][15][3][30] = [];
	self NullMenuArray();
	self LoadMenuData();
	self.menuopen = 0;
	self.menu_currentpage = 0;
	self.menu_previouspage = 0;
	self.menu_currentselection = 1;
}


destroyMenu()
{
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
		
		//Draw Titles		
		switch(level.menu.size)
		{
			case 0:
				self.centerTitle setText("< " + level.menu[self.menu_currentpage][0][0] + " >");
			break;
			
			case 1:
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
			if(i == self.menu_currentselection)
			{
				self.menuoption[i].alpha = 1;
				self.menuoption[i].glowAlpha = 1;
				self.menuoption[i].glowColor = (0,255,0);
				self.menuoption[i] setText("[ " + level.menu[self.menu_currentpage][i][0] + " ]");
			}
			else
			{
				self.menuoption[i] setText(level.menu[self.menu_currentpage][i][0]);
			}
		}
		self waittill("draw_menu");	
		destroyMenu();
	}
}

LoadMenuData()
{	
	level.menu[0][0][0] = "Forge Menu";	
	level.menu[0][1][0] = "Build Wall";
	level.menu[0][1][2] = ::buildWall;
	
	level.menu[0][2][0] = "Build Ramp";
	level.menu[0][2][2] = ::buildRamp;	

	level.menu[0][3][0] = "Build Grid";
	level.menu[0][3][2] = ::buildGrid;	
	
	level.menu[0][4][0] = "Build Teleporter";
	level.menu[0][4][2] = ::buildTeleporter;	
	
	level.menu[1][0][0] = "Test Menu";	
	
	level.menu[1][1][0] = "Build Crate";
	level.menu[1][1][2] = ::buildCrate;		
	
	level.menu[1][2][0] = "Build Collision Object";
	level.menu[1][2][2] = ::spawnTestCrate;
	
	
	MapMenuData();		
}

MapMenuData()
{
	level.mapmenu = level.menu.size;
	
	switch(getDvar("mapname"))
	{
		case "mp_estate":
			level.menu[level.menu.size][0][0] = "Map Estate";
			LoadMapMenuData("Small generator", "machinery_generator", ::CallBuildModel, 0);
			LoadMapMenuData("White pickup", "vehicle_pickup_destructible_mp", ::CallBuildModel, 0);
			LoadMapMenuData("Small white car", "vehicle_coupe_white_destructible", ::CallBuildModel, 0);
			LoadMapMenuData("Big black car", "vehicle_suburban_destructible_dull", ::CallBuildModel, 0);
			LoadMapMenuData("Small black car", "vehicle_luxurysedan_2008_destructible", ::CallBuildModel, 0);
			LoadMapMenuData("Large electrical transformer", "com_electrical_transformer_large_dam", ::CallBuildModel, 0);
			LoadMapMenuData("Oxygen tank orange", "machinery_oxygen_tank01", ::CallBuildModel, 0);
			LoadMapMenuData("File cabinet", "com_filecabinetblackclosed", ::CallBuildModel, 0);
			LoadMapMenuData("Flatscreen TV", "ma_flatscreen_tv_on_wallmount_02", ::CallBuildModel, 0);		
		break;
		
		default: 
		break;
	}
}

LoadMapMenuData(displayname, modelname, functioncallname, height)
{
	m = level.mapmenu;
	s = level.menu[m].size;
	level.menu[m][s][0] = displayname;
	level.menu[m][s][1] = modelname;
	level.menu[m][s][2] = functioncallname;
	level.menu[m][s][3] = height;	
}

CallBuildModel()
{
	//BuildModel(displayname, modelname, height)
	self BuildModel( level.menu[self.menu_currentpage][self.menu_currentselection][0], level.menu[self.menu_currentpage][self.menu_currentselection][1], level.menu[self.menu_currentpage][self.menu_currentselection][3]);
}

startlistenMenuEvents()
{
	self thread listenMenuEvent(::MenuNavigation, "cycleLeft", "+actionslot 3");	//3
	self thread listenMenuEvent(::MenuNavigation, "cycleRight", "+smoke");			//4
	self thread listenMenuEvent(::MenuNavigation, "scrolldown", "+actionslot 2");	//5	
	self thread listenMenuEvent(::MenuNavigation, "scrollup", "+actionslot 4");		//6
	self thread listenMenuEvent(::MenuNavigation, "select" , "+gostand");			//Spacebar
}

startlistenNonMenuEvents()
{
	self thread listenEvent(::ufomode, "weapnext",  "menuopen");						//1/2
	self thread listenEvent(::dismissBuildNotification, "+actionslot 4", "menuopen");	//6
}

startpermanentlistenEvents()
{
	self thread listenEvent(::Help, "+melee", "disconnect");							//V	
	self thread listenEvent(::Menu, "+actionslot 1", "disconnect");						//N
	self thread listenEvent(::toggleCordsAnglesHUD, "+frag", "disconnect");				//G
	self thread listenEvent(::clearCordsAnglesHUD, "CordsAnglesHUDstop", "disconnect");
}

listenEvent(function, event, endon_event)
{
	if(endon_event != 0)
	{
		self endon (endon_event);
	}
	
	while(1)
	{
		self waittill(event);
		self [[function]]();
	}
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
			self.menu_previouspage = self.menu_currentpage;
			
			if(self.menu_currentpage == 0)
			{
				self.menu_currentpage = level.menu.size - 1;
			}
			else
			{
				self.menu_currentpage--;
			}
			
			//Reset menu_currentselection if the page changed
			if(self.menu_previouspage != self.menu_currentpage)
			{
				self.menu_currentselection = 1;
			}
			
			self notify("draw_menu");		
		break;
		
		case "cycleRight":
			
			self.menu_previouspage = self.menu_currentpage;
			
			if(self.menu_currentpage == level.menu.size - 1)
			{
				self.menu_currentpage = 0;
			}
			else
			{
				self.menu_currentpage++;
			}
			
			//Reset menu_currentselection if the page changed
			if(self.menu_previouspage != self.menu_currentpage)
			{
				self.menu_currentselection = 1;
			}
			
			self notify("draw_menu");
		break;
		
		case "scrollup":
			
			if(self.menu_currentselection == 1)
			{
				self.menu_currentselection = level.menu[self.menu_currentpage].size - 1;
			}
			else
			{
				self.menu_currentselection--;
			}
			self notify("draw_menu");
		break;

		case "scrolldown":
			
			if(self.menu_currentselection == level.menu[self.menu_currentpage].size - 1)
			{
				self.menu_currentselection = 1;
			}
			else
			{
				self.menu_currentselection++;
			}
			self notify("draw_menu");			
		break;

		case "select":
			
			if(level.menu[self.menu_currentpage][self.menu_currentselection][2] != 0)
			{
				self thread [[level.menu[self.menu_currentpage][self.menu_currentselection][2]]]();
				self Menu();
			}
		break;		
		
		default:
		break;
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

ufomode()
{	
	maps\mp\gametypes\_spectating::setSpectatePermissions();
		
	if(self.ufomode == 0 && self.menuopen == 0)
	{
		self.playerhud_ufo setText("Ufomode: Active");
		self allowSpectateTeam( "freelook", true );
		self.sessionstate = "spectator";
		self.ufomode = 1;
	}
	else if(self.ufomode == 1 && self.menuopen == 0)
	{
		self.playerhud_ufo setText("Ufomode: Inactive");
		self.sessionstate = "playing";
		self allowSpectateTeam( "freelook", false );
		self.ufomode = 0;
	}
}

Help()
{
	if(self.help == 0 && self.menuopen == 0)
	{
		self.playerhud_help setText("Press [{+melee}] to toggle help");
		self.playerhud_helpufo setText("Press [{weapnext}] to toggle ufomode");
		self.playerhud_helpmenu setText("Press [{+actionslot 1}] to toggle menu");
		self.playerhud_cordsangles setText("Press [{+frag}] to toggle cords/angles");	
		self.playerhud_builddismiss setText("Press [{+actionslot 4}] to dismiss build cords notification");
		self.help = 1;	
	}
	else if(self.help == 0 && self.menuopen == 1)
	{
		self.playerhud_help setText("Menu Help");
		self.playerhud_helpufo setText("");
		self.playerhud_helpmenu setText("");
		self.playerhud_cordsangles setText("");
		self.playerhud_builddismiss setText("");
		
		self.help = 1;		
	}
	else if(self.help == 1)
	{
		self.playerhud_help setText("");
		self.playerhud_helpufo setText("");
		self.playerhud_helpmenu setText("");
		self.playerhud_cordsangles setText("");
		self.playerhud_builddismiss setText("");
		
		self.help = 0;
	}		
}

dismissBuildNotification()
{
	self.playerhud_build1 SetText("");
	self.playerhud_build2 SetText("");
}

initCordsAnglesHUD()
{
	self.cords[1][3] = [];
	angles[1][3] = [];
}

CordsAnglesHUD()
{	
	self endon("CordsAnglesHUDstop");
	
	while(self.DisplayCordsAnglesHUD == 1)
	{
		self.cords[0] = self GetOrigin();
		angles[0] = self GetPlayerAngles();
		
		self.playerhud_cords setText("Cords ( x, y, z ): ( " + int(self.cords[0][0]) + " , " + int(self.cords[0][1]) + " , " + int(self.cords[0][2]) + " )");		
		self.playerhud_angles setText("Angles: ( x, y ) : ( " + int(angles[0][0]) + " , " + int(angles[0][1]) + " )");			

		wait 1;
	}
}

clearCordsAnglesHUD()
{
	self.playerhud_cords setText("");
	self.playerhud_angles setText("");
}

toggleCordsAnglesHUD()
{
	if(self.DisplayCordsAnglesHUD == 1)
	{
		self.DisplayCordsAnglesHUD = 0;
		self notify("CordsAnglesHUDstop");
		self clearCordsAnglesHUD();
	}
	else if(self.DisplayCordsAnglesHUD == 0)
	{
		self.DisplayCordsAnglesHUD = 1;
		self thread CordsAnglesHUD();
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