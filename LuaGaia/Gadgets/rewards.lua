function gadget:GetInfo()
  return {
    name      = "Rewards",
    desc      = "Reward players by killing npcs",
    author    = "TurBoss",
    date      = "16-07-14",
    license   = "GNU GPL v2 or later",
    layer     = 0,
    enabled   = true,  --  loaded by default?
  }
end

local gaiaTeamID = Spring.GetGaiaTeamID()

-- synced only

if (not gadgetHandler:IsSyncedCode()) then
	return false
end

function gadget:Initialize ()
	if Game.gameName ~= "Jauria RTS"	then
		Spring.Echo ("PLAY WITH Jauria RTS!!")
		gadgetHandler:RemoveGadget()
		return
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
	rewardTeam(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
end

function rewardTeam(unitID, unitDefID, unitTeam, attackerID, attackerDefID, attackerTeam)
	local unitName = UnitDefs[unitDefID].name
	--Spring.Echo(unitName)
	--Spring.Echo(Spring.GetPlayerInfo(0))
	local name = nil
	
	if unitTeam == gaiaTeamID and unitID == 10600 or unitID == 10601 or unitID == 10602 or unitID == 10603 then 
		Spring.AddTeamResource(attackerTeam, "m", 500)
	end
	
	if attackerTeam ~= nil then
		if attackerTeam ~= gaiaTeamID then
			if unitTeam ~= gaiaTeamID then
				if unitTeam ~= attackerTeam then
					if attackerID ~= 10500 and attackerID ~= 10501 and attackerID ~= 10502 and attackerID ~= 10503 and attackerID ~= 10504 and attackerID ~= 10505 and attackerID ~= 10506 and attackerID ~= 10507 and attackerID ~= 10508 and attackerID ~= 10509 and attackerID ~= 10510 and attackerID ~= 10511 and attackerID ~= 10512 and attackerID ~= 10513 and attackerID ~= 10514 and attackerID ~= 10515 and attackerID ~= 10516 and attackerID ~= 10517 and attackerID ~= 10518 and attackerID ~= 10519 and attackerID ~= 10520 and attackerID ~= 10521 and attackerID ~= 10522 and attackerID ~= 10523 then
						
						local name,_,_,_,_,_,_,_,_ = Spring.GetPlayerInfo(attackerTeam)
						if name == nil then
							name = "Bot"
						end
						
						if unitName == "cnm1" then
							Spring.Echo("NM-1 Eliminado dando 24 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 24)
						elseif unitName == "drk2" then
							Spring.Echo("RK-2 Eliminado dando 43 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 43)
						elseif unitName == "enk3" then
							Spring.Echo("NK-3 Eliminado dando 114 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 114)
						elseif unitName == "ftkt4" then
							Spring.Echo("TKT-4 Eliminado dando 336 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 336)
						elseif unitName == "glz5" then
							Spring.Echo("LZ-5 Eliminado dando 474 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 474)
						elseif unitName == "hdt6" then
							Spring.Echo("DT-6 Eliminado dando 825 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 825)
						elseif unitName == "arc" then
							Spring.Echo("RC Eliminado dando 96 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 96)
						elseif unitName == "bit0" then
							Spring.Echo("IT-0 Eliminado dando 84 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 84)
						elseif unitName == "torreta" then
							Spring.Echo("Torre Eliminada dando 700 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 700)
						elseif unitName == "torretapro" then
							Spring.Echo("Torre Pro Eliminada dando 1000 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 1000)
							
						--HEIKS--
						
						elseif unitName == "aheiker" then
							Spring.Echo("Heiker Eliminado dando 45 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 45)
						elseif unitName == "bheik" then
							Spring.Echo("Heik Eliminado dando 22 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 22)
						elseif unitName == "chaerik" then
							Spring.Echo("Haerik Eliminado dando 108 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 108)
						elseif unitName == "dhipso" then
							Spring.Echo("Hipso Eliminado dando 112 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 112)
						elseif unitName == "ehekor" then
							Spring.Echo("Hekor Eliminado dando 160 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 160)
						elseif unitName == "fhaek" then
							Spring.Echo("Haek Eliminado dando 210 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 210)
						elseif unitName == "gheiknado" then
							Spring.Echo("Heiknado Eliminado dando 345 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 345)
						elseif unitName == "hheibok" then
							Spring.Echo("Heibok Eliminado dando 655 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 655)
							
							--CAOS--
							
							elseif unitName == "aadept" then
							Spring.Echo("Adept Eliminado dando 55 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 55)
						elseif unitName == "braider" then
							Spring.Echo("Raider Eliminado dando 35 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 35)
						elseif unitName == "cmarauder" then
							Spring.Echo("Marauder Eliminado dando 45 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 45)
						elseif unitName == "dbesieger" then
							Spring.Echo("Besieger Eliminado dando 105 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 105)
						elseif unitName == "eputris" then
							Spring.Echo("Putris Eliminado dando 130 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 130)
						elseif unitName == "fdesolator" then
							Spring.Echo("Desolator Eliminado dando 190 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 190)
						elseif unitName == "gjuggernaut" then
							Spring.Echo("Juggernaut Eliminado dando 360 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 360)
						elseif unitName == "harchaon" then
							Spring.Echo("Archaon Eliminado dando 750 de metal a " .. name)
							Spring.AddTeamResource(attackerTeam, "m", 750)
						end
					end
				end
			end
		end
	end
end
