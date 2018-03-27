#include common_scripts\utility;
#include maps\mp\_utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_mapedit;


GetCords()
{	
	self.playerhud_build1 SetText("Press [{+actionslot 3}] to save start coordinate.");
	self waittill("+actionslot 3");
	self.startcord = self GetOrigin();
	self iPrintLn("Start coordinate saved!");
	
	/*
	self.start_cords[0] = self GetOrigin();
	self.start[0][0] = int(self.start_cords[0][0]);
	self.start[0][1] = int(self.start_cords[0][0]);
	self.start[0][2] = int(self.start_cords[0][0]);
	*/

	self.playerhud_build1 SetText("Press [{+actionslot 3}] to save end coordinate.");
	self waittill("+actionslot 3");
	self.endcord = self GetOrigin();
	/*
	self.end[0] = self GetOrigin();
	self.end[0][0] = int(self.start[0][0]);
	self.end[0][1] = int(self.start[0][1]);
	self.end[0][2] = int(self.start[0][2]);
	*/
	self iPrintLn("End coordinate saved!");
	self.playerhud_build1 SetText("");
}

buildCrate()
{
	self.playerhud_build1 SetText("Aim at a location and press [{+actionslot 3}] to build  crate");
	self waittill("+actionslot 3");
	self.pos = self GetCursorPos()+(0,0,0);
	
	//spawnTestCrate(self.start);
	CreateCrate(self.pos, 0);
	self iPrintLn("Crate created!");	
}

buildWall()
{
	self endon ("disconnect");
	self GetCords();
	self.playerhud_build1 SetText("Coordinates (Start/End): " + self.start + " " + self.end);
	CreateWalls(self.startcord, self.endcord);

}

buildTeleporter()
{
	self endon ("disconnect");	
	self GetCords();
	self.playerhud_build1 SetText("Coordinates (Start/End): " + self.start + " " + self.end);
	CreateElevator(self.startcord, self.endcord, 90);	
}

buildRamp()
{
	self endon ("disconnect");	
	self GetCords();
	self.playerhud_build1 SetText("Coordinates (Start/End): " + self.start + " " + self.end);
	CreateRamps(self.startcord, self.endcord);
}

buildGrid()
{
	self endon ("disconnect");	
	self GetCords();
	self.playerhud_build1 SetText("Coordinates (Start/End): " + self.start + " " + self.end);
	CreateGrids(self.startcord, self.endcord, 0);
}

ForgeSpawnCrate()
{
	vec=anglestoforward(self getPlayerAngles());
	end=(vec[0]*200,vec[1]*200,vec[2]*200);
	L=BulletTrace(self gettagorigin("tag_eye"),self gettagorigin("tag_eye")+end,0,self)["position"];
	c=spawn("script_model",L+(0,0,20));
	c CloneBrushmodelToScriptmodel(level.airDropCrateCollision);
	c setModel("com_plasticcase_friendly");
	c PhysicsLaunchServer((0,0,0),(0,0,0));
	c.angles=self.angles+(0,90,0);
}

ForgePickupCrate()
{
	self endon("stopforge");

	if(self.entityselection == 0)
	{
		self.entityselection = 1;
				
		vec=anglestoforward(self getPlayerAngles());
		end=(vec[0]*100,vec[1]*100,vec[2]*100);
		entity=BulletTrace(self gettagorigin("tag_eye"),self gettagorigin("tag_eye")+(vec[0]*100,vec[1]*100,vec[2]*100),0,self)["entity"];
		
		if(isdefined(entity.model))
		{
			self MoveCrate(entity);
		
			self.playerhud_build1 SetText("Crate (Cords , Angles): " + entity.origin + " , " + entity.angles);
		}
		
		self.entityselection = 0;
	}
}

MoveCrate(entity)
{
	self endon("+toggleads_throw");
	self endon("menuopen");
	
	while(1)
	{
		entity.angles=(self.entityx,self.entityy,self.entityz);
		vec=anglestoforward(self getPlayerAngles());
		end=(vec[0]*100,vec[1]*100,vec[2]*100);
		entity.origin=(self gettagorigin("tag_eye")+end);	
		//self.playerhud_builddismiss setText("Crate (Cords , Angles): " + entity.origin + " , " + entity.angles);
		
		wait 0.02;
	}
}

EntityManipulation(command)
{
	i = 45;
	if(self.entityselection == 1)
	{
		switch(command)
		{
			case "increaseY":
				self iPrintLn("increaseY");
				if(self.entityy != 180)
				{
					self.entityy = self.entityy + i;
				}
				else
				{
					self.entityy = -180 + i;
				}
				self iPrintLn("Y: " + self.entityy);
				break;
				
			case "decreaseY":
				self iPrintLn("decreaseY");
				if(self.entityy != -180)
				{
					self.entityy = self.entityy - i;
				}
				else
				{
					self.entityy = 180 - i;
				}
				self iPrintLn("Y: " + self.entityy);
				break;
				
			case "increaseX":
				self iPrintLn("increaseX");
				if(self.entityx != 180)
				{
					self.entityx = self.entityx + i;
				}
				else
				{
					self.entityx = -180 + i;
				}
				self iPrintLn("X: " + self.entityx);
				break;
				
			case "decreaseX":
				self iPrintLn("decreaseX");
				if(self.entityx != -180)
				{
					self.entityx = self.entityx - i;
				}
				else
				{
					self.entityx = 180 - i;
				}
				self iPrintLn("X: " + self.entityx);
				break;
			
			case "increaseZ":
				self iPrintLn("increaseZ");
				if(self.entityz != 180)
				{
					self.entityz = self.entityz + i;
				}
				else
				{
					self.entityz = -180 + i;
				}
				self iPrintLn("Z: " + self.entityz);
				break;	
				
			case "decreaseZ":
				self iPrintLn("decreaseZ");
				if(self.entityz != -180)
				{
					self.entityz = self.entityz - i;
				}
				else
				{
					self.entityz = 180 - i;
				}
				self iPrintLn("Z: " + self.entityz);
				break;
			
			default:
				break;
		}
	}
	else
	{
		self iPrintLn("Select a crate first!");
	}
}

BuildModel(displayname, modelname, height)
{
	self.playerhud_build1 SetText("Aim at a location and press [{+actionslot 3}] to build " + displayname);
	self waittill("+actionslot 3");
	
	self.pos = self GetCursorPos()+(0,0,height);
	SpawnModel(modelname, self.pos);
	
	self iPrintLn("Spawned " + displayname);
	self.playerhud_build1 SetText("");
}

SpawnModel(Model, Location)
{
	Object=spawn("script_model", Location);
	//Object PhysicsLaunchServer((0,0,0),(0,0,0));
	Object.angles=self.angles+(0,90,0);
	Object Solid();
	Object setModel(Model);
	
	//Object Hide();
	//Object Show();
	
	/*
	self.oldAirDropCrates = getEntArray( "airdrop_crate", "targetname" );
	
	if ( !self.airDropCrates.size )
	{	
		self.airDropCrates = self.oldAirDropCrates;
		
		assert( self.airDropCrates.size );
		
		self.airDropCrateCollision = getEnt( self.airDropCrates[0].target, "targetname" );
	}
	else
	{
		foreach ( crate in level.oldAirDropCrates ) 
			crate delete();
		
		level.airDropCrateCollision = getEnt( level.airDropCrates[0].target, "targetname" );
		level.oldAirDropCrates = getEntArray( "airdrop_crate", "targetname" );
	}
	*/
	//level.airDropCrates = getEntArray( "care_package", "targetname" );
	//level.airDropCrateCollision = getEnt( level.airDropCrates[0].target, "targetname" );	
	/*
	Object CloneBrushmodelToScriptmodel(level.airDropCrateCollision);	
	
	iPrintLn("airDropCrateCollision: " + level.airDropCrateCollision);
	iPrintLn("airDropCrateCollision: " + level.airDropCrateCollision[0]);
	iPrintLn("airDropCrateCollision: " + level.airDropCrateCollision[0].target);
	*/
	
	/*
	self.modelentarray = getEntArray( "care_package", "targetname" );
	self.modelcollision = getEnt( self.modelentarray[0].target, "targetname" );	
	Object CloneBrushmodelToScriptmodel(self.modelcollision);		
	*/
	/*
	level.airDropCrates = getEntArray( "care_package", "targetname" );
	level.airDropCrateCollision = getEnt( level.airDropCrates[0].target, "targetname" );	
	Object CloneBrushmodelToScriptmodel(level.airDropCrateCollision);	
	*/

	//Object_collision = getent( Model, "targetname" );
	//Object_collision linkto( level.airDropCrates[0].target );
	
	//level.destructibleSpawnedEnts[ level.destructibleSpawnedEnts.size ] = physicsObject;
	//physicsObject PhysicsLaunchClient( point, initial_velocity );
}

findScriptBrushModel()
{
	ents = getEntArray("script_brushmodel", "classname");
	suitableBrushModels = [];
	for (i = 0; i < ents.size; i++)
	{
		bmodel = ents[i];
		if (/*isDefined(bmodel.target) && */bmodel.script_modelname == "vehicle_pickup_destructible_mp")
		{
			suitableBrushModels[suitableBrushModels.size] = bmodel;
			iprintln("Found!");
		}
	}
	iprintlnbold("suitable bmodels: " + suitableBrushModels.size);
	return suitableBrushModels[0];	
	
	/*
	ents = getEntArray("script_brushmodel", "classname");
	suitableBrushModels = [];
	for (i = 0; i < ents.size; i++)
	{
		bmodel = ents[i];
		if (isDefined(bmodel.script_gameobjectname) && bmodel.script_gameobjectname == "bombzone")
		{
			suitableBrushModels[suitableBrushModels.size] = bmodel;
		}
	}
	iprintlnbold("suitable bmodels: " + suitableBrushModels.size);
	return suitableBrushModels[0];
	*/
}

spawnTestCrate()
{
	self.playerhud_build1 SetText("Press [{+actionslot 3}] to spawn crate");
	self waittill("+actionslot 3");
	position = self GetOrigin();
	
	crate = spawn("script_model", (position));
	crate.angles = (0, 0, 0);
	crateCollision = spawn("script_model", (position));
	crate setModel("vehicle_pickup_destructible_mp");
	//crate setModel("com_bomb_objective");
	coll = findScriptBrushModel();
	if (!isDefined(coll))
	{
		self iprintlnbold("Collision model not defined!");
		return;
	}
	crateCollision cloneBrushModelToScriptModel(coll);
	crateCollision.angles = (0, 0, 0); // map-related.
	crateCollision linkTo(crate);
	
	//mp_estate_load.ff w/ fastfile viewer?
	//yaw?
}


CreateCrate(pos,angles)
{
	crate=spawn("script_model",pos);
	crate setModel("com_plasticcase_friendly");
	crate.angles = angles;
}

GetCursorPos()
{
	f=self getTagOrigin("tag_eye");
	e=self Vector_Scal(anglestoforward(self getPlayerAngles()),1000000);
	l=BulletTrace(f,e,0,self)["position"];
	return l;
}

vector_scal(vec,scale)
{
	vec =(vec[0] * scale,vec[1] * scale,vec[2] * scale);
	return vec;
}