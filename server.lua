local VORPcore = exports.vorp_core:GetCore()

RegisterServerEvent('startSaloonFight')
AddEventHandler('startSaloonFight', function(playerId, location, radius)
    local user = VORPcore.getUser(playerId)
    local character = user.getUsedCharacter
    local firstName = character.firstname
    local lastName = character.lastname
    local steamHex = GetPlayerIdentifier(playerId, 0)

    -- Radius Check
    local players = GetPlayersInRadius(location, radius)
    for _, player in ipairs(players) do
        TriggerClientEvent('showFightMessage', player)
        TriggerClientEvent('applyFightRestrictions', player)
    end

    -- Discord Webhook
    local webhookMessage = string.format(Config.DiscordWebhook.wmessage, firstName, lastName, steamHex)
    TriggerDiscordWebhook(webhookMessage)
end)

function GetPlayersInRadius(location, radius)
    local playersInRadius = {}
    for _, playerId in ipairs(GetPlayers()) do
        local playerPed = GetPlayerPed(playerId)
        local playerPos = GetEntityCoords(playerPed)
        if GetDistanceBetweenCoords(playerPos, location) < radius then
            table.insert(playersInRadius, playerId)
        end
    end
    return playersInRadius
end

function GetDistanceBetweenCoords(pos1, pos2)
    local dx = pos1.x - pos2.x
    local dy = pos1.y - pos2.y
    local dz = pos1.z - pos2.z
    return math.sqrt(dx * dx + dy * dy + dz * dz)
end

function TriggerDiscordWebhook(message)
    PerformHttpRequest(Config.DiscordWebhook.url, function(err, text, headers) end, 'POST', json.encode({content = message}), { ['Content-Type'] = 'application/json' })
end