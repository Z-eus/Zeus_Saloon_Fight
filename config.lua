Config = {}

Config.FightRestrictionDuration = 60000 -- 60 Sec

Config.FightNotification = {
    title = "~e~Notification",
    message = "~t~Saloon Fight Begins!",
    duration = 4000 -- 4 Sec
}

Config.DiscordWebhook = {
    url = "DISCORD_WEBHOOK_URL",
    wmessage = "Saloon Fight Started by\n**First Name:** %s\n**Last Name:** %s\n**Steam Hex:** (%s)"
}

Config.FightLocations = {
    {
        location = vector3(-308.2415, 802.7709, 118.9795), -- VALENTINE SMITHFIELD'S SALOON
        radius = 15.0 -- Default 15.0
    },
    {
        location = vector3(-242.1040, 770.1430, 118.0850), -- VALENTINE KEANE'S SALOON
        radius = 8.0 -- Default 8.0
    },
    {
        location = vector3(-818.6770, -1319.0707, 43.6791), -- BLACKWATER SALOON
        radius = 15.0 -- Default 15.0
    },
	{
        location = vector3(1343.9465, -1375.1681, 80.4807), --  RHODES SALOON
        radius = 20.0 -- Default 20.0
    },
	{
        location = vector3(2634.3408, -1227.3563, 53.3804), -- SAINT DENIS BASTILLE SALOON
        radius = 20.0 -- Default 20.0
    },
	{
        location = vector3(2795.5203, -1166.3646, 47.9280), -- SAINT DENIS DOYLE'S TAVERN
        radius = 10.0 -- Default 10.0
    },
	{
        location = vector3(2943.9114, 523.4112, 45.4248), -- VAN HORN OLD LIGHT SALOON
        radius = 10.0 -- Default 10.0
    },
	{
        location = vector3(-3703.8132, -2592.3972, -13.3198), -- ARMADILLO SALOON
        radius = 20.0 -- Default 20.0
    },
	{
        location = vector3(-5513.8164, -2909.5059, -1.7513), -- TUMBLEWEED SALOON
        radius = 10.0 -- Default 8.0
    }
}