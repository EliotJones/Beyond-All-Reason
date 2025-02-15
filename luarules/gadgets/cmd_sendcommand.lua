
function gadget:GetInfo()
	return {
		name    = "Send Command",
		desc	= 'execute a console command for any player',
		author	= 'Floris',
		date	= 'march 2021',
		license	= 'GNU GPL, v2 or later',
		layer	= 1,
		enabled	= true
	}
end

-- usage: /luarules cmd playername disticon 900

local cmdname = 'cmd'
local PACKET_HEADER = "$c$"
local PACKET_HEADER_LENGTH = string.len(PACKET_HEADER)

if gadgetHandler:IsSyncedCode() then

	local startPlayers = {}
	function checkStartPlayers()
		for _,playerID in ipairs(Spring.GetPlayerList()) do -- update player infos
			local playername,_,spec = Spring.GetPlayerInfo(playerID,false)
			if not spec then
				startPlayers[playername] = true
			end
		end
	end
	function gadget:Initialize()
		checkStartPlayers()
	end
	function gadget:GameStart()
		checkStartPlayers()
	end
	function gadget:PlayerChanged(playerID)
		checkStartPlayers()
	end

	function explode(div,str) -- credit: http://richard.warburton.it
		if (div=='') then return false end
		local pos,arr = 0,{}
		-- for each divider found
		for st,sp in function() return string.find(str,div,pos,true) end do
			table.insert(arr,string.sub(str,pos,st-1)) -- Attach chars left of current divider
			pos = sp + 1 -- Jump past current divider
		end
		table.insert(arr,string.sub(str,pos)) -- Attach chars right of last divider
		return arr
	end

	function gadget:RecvLuaMsg(msg, playerID)
		if string.sub(msg, 1, PACKET_HEADER_LENGTH) ~= PACKET_HEADER then
			return
		end
		local playername, _, spec = Spring.GetPlayerInfo(playerID,false)
		local authorized = false
		if _G.permissions.give[playername] then
			authorized = true
		end
		if authorized == nil then
			Spring.SendMessageToPlayer(playerID, "You are not authorized to send commands for a player")
			return
		end
		if not spec then
			Spring.SendMessageToPlayer(playerID, "You arent allowed to send commands when playing")
			return
		end
		if startPlayers[playername] ~= nil then
			Spring.SendMessageToPlayer(playerID, "You arent allowed to send commands when you have been a player")
			return
		end
		local params = explode(':', msg)
		SendToUnsynced("execCmd", params[2], params[3])
		return true
	end

else	-- UNSYNCED

	local authorizedPlayers = SYNCED.permissions.cmd

	local function execCmd(_, playername, cmd)
		if playername == select(1, Spring.GetPlayerInfo(Spring.GetMyPlayerID())) then
			Spring.SendCommands(cmd)
		end
	end

	function gadget:Initialize()
		gadgetHandler:AddChatAction(cmdname, RequestCmd)
		gadgetHandler:AddSyncAction("execCmd", execCmd)
	end

	function gadget:Shutdown()
		gadgetHandler:RemoveChatAction(cmdname)
		gadgetHandler:AddSyncAction("execCmd")
	end

	function RequestCmd(cmd, line, words, playerID)
		local playername = Spring.GetPlayerInfo(Spring.GetMyPlayerID(),false)
		local authorized = false
		if authorizedPlayers[playername] then
			authorized = true
		end
		if authorized then
			if words[1] ~= nil and words[2] ~= nil then
				local command = words[2]
				if #words > 2 then
					for k, v in ipairs(words) do
						if k >= 3 then
							command = command .. ' ' .. v
						end
					end
				end
				Spring.SendLuaRulesMsg(PACKET_HEADER..':'..words[1]..':'..command)
			else
				Spring.SendMessageToPlayer(playerID, "failed to execute, check syntax")
			end
		end
	end
end

