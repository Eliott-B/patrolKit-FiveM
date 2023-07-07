function HintToDisplay(text, bool)
    BeginTextCommandDisplayHelp("STRING")
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, bool, -1)
end

function IsInMarker(ped, marker)
    local pedCoords = GetEntityCoords(ped)
    local x = math.abs(math.abs(pedCoords.x) - math.abs(marker[1]))
    local y = math.abs(math.abs(pedCoords.y) - math.abs(marker[2]))
    local z = math.abs(math.abs(pedCoords.z) - math.abs(marker[3]))
    if (x < 2 and y < 2 and z < 2) then
        return true
    end
    return false
end

CreateThread(function()
	while true do
		Wait(0)
        local marker = Config.Marker
		DrawMarker(20, marker[1], marker[2], marker[3], 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 66, 108, 245, 50, false, true, 2, nil, nil, false)
        local ped = PlayerPedId()
        if (IsInMarker(ped, marker)) then
            HintToDisplay("Press E to pick up your patrol kit.")
        end
	end
end)

RegisterCommand("patrolkitweapon", function()
    local marker = Config.Marker
    local ped = PlayerPedId()
    if (IsInMarker(ped, marker)) then
        PatrolKit()
    end
end)

RegisterKeyMapping('patrolkitweapon', 'Get the patrolkit', 'keyboard', 'e')