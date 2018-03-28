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
	self takeallweapons();
	self _clearPerks();
	self startlistenNonMenuEvents();
	self startlistenPermanentEvents();
	self freezeControlsWrapper( false );
}

onPlayerConnected()
{	
	self initPlayerHUD();
	self initPlayerButtonMonitor();
	self godmode();
	self Help();
	self initCordsAnglesHUD();
	self initMenu();
	SetDvar("player_sprintUnlimited", "1");
}