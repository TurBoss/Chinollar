function gadget:GetInfo()
  return {
    name      = "NpcSpawner",
    desc      = "Spawn NPC's",
    author    = "TurBoss",
    date      = "16-07-14",
    license   = "GNU GPL v2 or later",
    layer     = 0,
    enabled   = true,  --  loaded by default?
  }
end
mineralID = {}

SpawnTimer = {}
SpawnTimer.__index = SpawnTimer

local gaiaTeamID = Spring.GetGaiaTeamID()

-- synced only

if (not gadgetHandler:IsSyncedCode()) then
	return false
end

function SpawnTimer.create(timeToSpawn)
	local tim = {}             -- our new object
	setmetatable(tim,SpawnTimer)  -- make NpcTimer handle lookup
	
	--tim.npc = npc      -- initialize our object
	tim.enabled = false
	tim.spawnTime = timeToSpawn
	tim.startTime = 0
	return tim
end

function SpawnTimer:set_timer()
	--Spring.Echo("Timer " .. self.npc)
	self.startTime, _ = Spring.GetGameFrame() 
	self.enabled = true
end

function SpawnTimer:check()
	return self.enabled
end

function SpawnTimer:update(gameFrame)

	local gameFrame = gameFrame

	if gameFrame - self.startTime >= self.spawnTime and self.enabled then
		self.enabled = false
		return true
	else
		return false
	end
end

function gadget:Initialize ()	
	if Game.gameName ~= "Jauria RTS"	then
		Spring.Echo ("PLAY WITH Jauria RTS!!")
		gadgetHandler:RemoveGadget()
		return
	end
	timer1 = SpawnTimer.create(8000) --timer dramon
	timer2 = SpawnTimer.create(8000)
	timer3 = SpawnTimer.create(8000)
	timer4 = SpawnTimer.create(8000)
	timerc5 = SpawnTimer.create(9000) --timer cofre
	timerc6 = SpawnTimer.create(9000)
	timerc7 = SpawnTimer.create(9000)
end

function gadget:GameStart()
	timerc5:set_timer()
	timerc6:set_timer()
	timerc7:set_timer()
	spawnNPC(1)
	spawnNPC(2)
	spawnNPC(3)
	spawnNPC(4)
	spawnTurrets1()
	spawnTurrets2()
	--unselectableTurrents()
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
	if unitID == 10600 then
		timer1:set_timer()
	elseif unitID == 10601 then
		timer2:set_timer()
	elseif unitID == 10602 then
		timer3:set_timer()
	elseif unitID == 10603 then
		timer4:set_timer()
	end
end

function gadget:GameFrame(n)
	if timer1:update(n) then spawnNPC(1) end
	if timer2:update(n) then spawnNPC(2) end
	if timer3:update(n) then spawnNPC(3) end
	if timer4:update(n) then spawnNPC(4) end
	if timerc5:update(n) then spawnFeature(1) end
	if timerc6:update(n) then spawnFeature(2) end
	if timerc7:update(n) then spawnFeature(3) end
	checkFeatures(1)
	checkFeatures(2)
	checkFeatures(3)
end

--checkFeatures

function checkFeatures(i)
	if i == 1 then
		if timerc5:check() ~= true and Spring.ValidFeatureID(mineralID[i]) ~= true then
			timerc5:set_timer()
		end
	elseif i == 2 then
		if timerc6:check() ~= true and Spring.ValidFeatureID(mineralID[i]) ~= true then
			timerc6:set_timer()
		end
	elseif i == 3 then
		if timerc7:check() ~= true and Spring.ValidFeatureID(mineralID[i]) ~= true then
			timerc7:set_timer()
		end
	end
end

--spawn features

function spawnFeature(i)
	--Spring.Echo("torreloca")
	feature = {
		{name="cofre1",x=2070,z=2040,rot="south",},
		{name="cofre2",x=450,z=450,rot="south",},
		{name="cofre2",x=3600,z=3600,rot="south",},
	}
	
		local yPlacement	= Spring.GetGroundHeight(feature[i].x,feature[i].z)+500
		mineralID[i] = Spring.CreateFeature(feature[i].name, feature[i].x, yPlacement, feature[i].z, feature[i].rot)
		--Spring.Echo(mineralID[i])
end


--spawn npcs

function spawnNPC(i)
	--Spring.Echo("Spawn Npc " .. i)
	npc = {
		{x=2575,name="gusano",z=3211,unitID=10600,rot="south",},
		{x=1561,name="gusano",z=903,unitID=10601,rot="north",},
		{x=3380,name="destructor",z=2030,unitID=10602,rot="west",},
		{x=715,name="destructor",z=2030,unitID=10603,rot="east",},
	}
	Spring.CreateUnit (npc[i].name, npc[i].x, 0, npc[i].z, npc[i].rot, gaiaTeamID, false, true, npc[i].unitID)
end

function spawnTurrets1()
	--Spring.Echo("Spawns Turrents 1")
	npc = {
		{x=975,name="torreta",z=3226,unitID=10500,rot="east",},
		{x=450,name="torreta",z=2660,unitID=10501,rot="east",},
		{x=1400,name="torreta",z=3765,unitID=10502,rot="east",},
		
		{x=2946,name="torreta",z=3725,unitID=10503,rot="east",},
		{x=370,name="torreta",z=1163,unitID=10504,rot="east",},
		{x=1567,name="torreta",z=2537,unitID=10505,rot="east",},
	}
	for i=1, #npc do
		Spring.CreateUnit (npc[i].name, npc[i].x, 0, npc[i].z, npc[i].rot, 0, false, true, npc[i].unitID)
	end
end

function spawnTurrets2()
	--Spring.Echo("Spawns Turrents 2")
	npc = {
		{x=3093,name="torreta",z=884,unitID=10506,rot="west",},
		{x=2730,name="torreta",z=330,unitID=10507,rot="west",},
		{x=3712,name="torreta",z=1425,unitID=10508,rot="west",},
		
		{x=1152,name="torreta",z=371,unitID=10509,rot="west",},
		{x=3723,name="torreta",z=2903,unitID=10510,rot="west",},
		{x=2537,name="torreta",z=1562,unitID=10511,rot="west",},
	}
	for i=1, #npc do
		Spring.CreateUnit (npc[i].name, npc[i].x, 0, npc[i].z, npc[i].rot, 1, false, true, npc[i].unitID)
	end
end

function unselectableTurrents()
	Spring.SetUnitNoSelect(10500, true)
	Spring.SetUnitNoSelect(10501, true)
	Spring.SetUnitNoSelect(10502, true)
	Spring.SetUnitNoSelect(10503, true)
	Spring.SetUnitNoSelect(10504, true)
	Spring.SetUnitNoSelect(10505, true)
	Spring.SetUnitNoSelect(10506, true)
	Spring.SetUnitNoSelect(10507, true)
	Spring.SetUnitNoSelect(10508, true)
	Spring.SetUnitNoSelect(10509, true)
end
