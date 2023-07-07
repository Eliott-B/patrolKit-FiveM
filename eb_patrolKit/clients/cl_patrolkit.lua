function Notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

function PatrolKit()
    local weapons = Config.Weapons
    local components = Config.Components
    local playerPed = PlayerPedId()
    for i = 1, #weapons do
        local weapon = weapons[i]
        GiveWeaponToPed(playerPed, weapon, 999, false, false)
        local componentsWeapon = components[weapon]
        if (componentsWeapon ~= nil) then
            for i = 1, #componentsWeapon do
                GiveWeaponComponentToPed(playerPed, weapon, componentsWeapon[i])
            end
        end
    end
    Notify("[PATROL KIT] ~g~Gived")
end

RegisterCommand("patrolkit", function()
    PatrolKit()
end)