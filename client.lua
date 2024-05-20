local VORPcore = exports.vorp_core:GetCore()

function ShowFightMessage()
    ClearPedTasks(PlayerPedId())
    VORPcore.NotifySimpleTop(Config.FightNotification.title, Config.FightNotification.message, Config.FightNotification.duration)
end

local isTriggered = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        if IsControlJustReleased(0, 0xD8F73058) and IsControlPressed(0, 0xF84FA74F) then  -- U & RMOUSE CLICK
            isTriggered = true
        end

        if isTriggered and IsPedShooting(PlayerPedId()) then
            CheckForFire()
        end
    end
end)

function CheckForFire()
    for _, fightLocation in ipairs(Config.FightLocations) do
        local playerPos = GetEntityCoords(PlayerPedId())
        local location = fightLocation.location
        local radius = fightLocation.radius

        if Vdist(playerPos.x, playerPos.y, playerPos.z, location.x, location.y, location.z) < radius then
            TriggerServerEvent('startSaloonFight', GetPlayerServerId(PlayerId()), location, radius)
        end
    end

    isTriggered = false
end

RegisterNetEvent('showFightMessage')
AddEventHandler('showFightMessage', function()
    ShowFightMessage()
end)

RegisterNetEvent('applyFightRestrictions')
AddEventHandler('applyFightRestrictions', function()
    local WEAPON_AVAILABLE_AGAIN_TIME = GetGameTimer() + Config.FightRestrictionDuration

    CreateThread(function()
        while true do
            if GetGameTimer() > WEAPON_AVAILABLE_AGAIN_TIME then
                return
            end
            DisablePlayerFiring(PlayerId(), true) -- Disable Player Firing
            DisableControlAction(0, 0xC1989F95, true) -- I / Disable Inventory
            DisableControlAction(0, 0x8FFC75D6, true) -- Sprint
            DisableControlAction(0, 0xD9D0E1C0, true) -- Jump
            Wait(0)
        end
    end)
end)