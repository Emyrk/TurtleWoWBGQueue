BuildTWBGQueueMenu = function ()
	local info

	if UIDROPDOWNMENU_MENU_LEVEL == 2 then
		info = UIDropDownMenu_CreateInfo()
		info.text = ARENA_QUEUE_RATED.." (2v2)"
		info.func = JoinArenaQueue
		info.arg1 = 1
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)

		info = UIDropDownMenu_CreateInfo()
		info.text = ARENA_QUEUE_RATED.." (3v3)"
		info.func = JoinArenaQueue
		info.arg1 = 2
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)

		info = UIDropDownMenu_CreateInfo()
		info.text = ARENA_QUEUE_RATED.." (5v5)"
		info.func = JoinArenaQueue
		info.arg1 = 3
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)

		info = UIDropDownMenu_CreateInfo()
		info.text = ""
		info.disabled = true
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)

		info = UIDropDownMenu_CreateInfo()
		info.text = ARENA_QUEUE_SKIRMISH
		info.func = JoinArenaQueue
		info.arg1 = 0
		info.notCheckable = 1
		UIDropDownMenu_AddButton(info, UIDROPDOWNMENU_MENU_LEVEL)
		return
	end

	info = UIDropDownMenu_CreateInfo()
	info.text = BATTLEFIELDS
	info.isTitle = true
	UIDropDownMenu_AddButton(info)

	info = UIDropDownMenu_CreateInfo()
	info.text = ""
	info.disabled = true
	UIDropDownMenu_AddButton(info)

	local arenaQueued = false
	local warsongQueued = false
	local arathiQueued = false
	local thornGorgeQueued = false
	local alteracQueued = false

	for i = 1, MAX_BATTLEFIELD_QUEUES do
		local a, b = GetBattlefieldStatus(i)
		if a == "queued" then
			if b == ARENA then
				arenaQueued = true
			elseif b == MINIMAP_BATTLEGROUND_WARSONG then
				warsongQueued = true
			elseif b == MINIMAP_BATTLEGROUND_ARATHI then
				arathiQueued = true
			elseif b == MINIMAP_BATTLEGROUND_THORNGORGE then
				thornGorgeQueued = true
			elseif b == MINIMAP_BATTLEGROUND_ALTERAC then
				alteracQueued = true
			end
		end
	end

	info = UIDropDownMenu_CreateInfo()
	info.text = ARENA
	info.disabled = arenaQueued
	info.checked = arenaQueued
	info.hasArrow = not arenaQueued
	UIDropDownMenu_AddButton(info)

	info = UIDropDownMenu_CreateInfo()
	info.text = MINIMAP_BATTLEGROUND_WARSONG
	info.tooltipTitle = MINIMAP_BATTLEGROUND_WARSONG
	info.tooltipText = MINIMAP_BATTLEGROUND_WARSONG_TOOLTIP
	info.disabled = warsongQueued
	info.checked = warsongQueued
	info.func = JoinBattlegroundQueue
	info.arg1 = "Warsong"
	UIDropDownMenu_AddButton(info)

	if UnitLevel("player") >= 1 then
		info = UIDropDownMenu_CreateInfo()
		info.text = MINIMAP_BATTLEGROUND_ARATHI
		info.tooltipTitle = MINIMAP_BATTLEGROUND_ARATHI
		info.tooltipText = MINIMAP_BATTLEGROUND_ARATHI_TOOLTIP
		info.disabled = arathiQueued
		info.checked = arathiQueued
		info.func = JoinBattlegroundQueue
		info.arg1 = "Arathi"
		UIDropDownMenu_AddButton(info)
	end

	if UnitLevel("player") >= 51 then
		info = UIDropDownMenu_CreateInfo()
		info.text = MINIMAP_BATTLEGROUND_ALTERAC
		info.tooltipTitle = MINIMAP_BATTLEGROUND_ALTERAC
		info.tooltipText = MINIMAP_BATTLEGROUND_ALTERAC_TOOLTIP
		info.disabled = alteracQueued
		info.checked = alteracQueued
		info.func = JoinBattlegroundQueue
		info.arg1 = "Alterac"
		UIDropDownMenu_AddButton(info)
	end

	if UnitLevel("player") >= 31 then
		info = UIDropDownMenu_CreateInfo()
		info.text = MINIMAP_BATTLEGROUND_THORNGORGE
		info.tooltipTitle = MINIMAP_BATTLEGROUND_THORNGORGE
		info.tooltipText = MINIMAP_BATTLEGROUND_THORNGORGE_TOOLTIP
		info.disabled = thornGorgeQueued
		info.checked = thornGorgeQueued
		info.func = JoinBattlegroundQueue
		info.arg1 = "ThornGorge"
		UIDropDownMenu_AddButton(info)
	end
end
