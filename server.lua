Citizen.CreateThread(function()
    for k, v in ipairs(Config.Triggerlist) do
        RegisterServerEvent(v)
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
                    ["text"] = os.date("%c")
                },
                ["author"] = {
                    ["name"] = "Trigger-Logger",
                    ["icon_url"] = "https://forum.cfx.re/user_avatar/forum.cfx.re/kattrigerkatta/45/693796_2.png"
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
