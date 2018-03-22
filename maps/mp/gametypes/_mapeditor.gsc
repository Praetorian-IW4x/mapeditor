#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_mapedit;
#include maps\mp\gametypes\_mapeditorutilities;

init()
{		
	level thread maps\mp\gametypes\_mapedit::initMapEdit();	
}

onPlayerSpawned()
{
	self ResetPlayerHUD();
	self thread CoordsHUD();
	self thread AnglesHUD();
	self thread HelpHUD();
	self takeallweapons();
	self _clearPerks();
	self freezeControlsWrapper( false );

}

onPlayerConnected()
{	
	self initPlayerHUD();
	self initPlayerButtonMonitor();
	self thread godmode();
	self thread ufomode();
}