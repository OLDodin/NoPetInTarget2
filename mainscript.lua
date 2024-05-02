local function OnTargetChanged()
	local unitID = avatar.GetTarget()
	if unitID then
		local unitName = object.GetName(unitID)
		local needUnselectTarget = true
		for _, ignoreName in ipairs(IgnoreList) do
			if ignoreName == userMods.FromWString(unitName) then
				needUnselectTarget = false
			end
		end
		for _, additionalTargetName in ipairs(TargetList) do
			if additionalTargetName == userMods.FromWString(unitName) then
				if needUnselectTarget then
					avatar.UnselectTarget()
					return
				end
			end
		end
		if IgnoreAllPet == 1 then
			if unit.IsPet(unitID) then
				if needUnselectTarget then
					avatar.UnselectTarget()
				end
			end
		end
	end
end

local function Init()
	common.RegisterEventHandler( OnTargetChanged, "EVENT_AVATAR_TARGET_CHANGED" )
end


Init()