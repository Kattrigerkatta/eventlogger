Citizen.CreateThread(function()
    for k, v in ipairs(Config.Triggerlist) do
        AddEventHandler(v, function()
            DCLog(v.whook, v.event, v.event.." wurde von " .. GetPlayerName(source) .. "[" ..source.. "] ausgelöst")
        end)
    end
end)  

function DCLog(webhook, eventname, message)
    if webhook ~= nil then
        local connect = {
            {
                ["color"] = 13632027,
                ["footer"] = {
                    ["text"] = os.date("%c").. " | discord.gg/anticheat" 
                },
                ["author"] = {
                    ["name"] = "Trigger-Logger",
                    ["url"] = "https://pornhub.com",
                    ["icon_url"] = "https://cdn.discordapp.com/avatars/650785409290469412/e1cbfb3cba6508e86221954c499a4313.png?size=128"
                },
                ["fields"] = {
                    {
                        ["name"] = "Info:",
                        ["value"] =  message,
                        ["inline"] = false
                    },
                }
            }
        }
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = 'Event-Logger', embeds = connect}), { ['Content-Type'] = 'application/json' })
    end
end