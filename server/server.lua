ESX = nil
ESX = exports["es_extended"]:getSharedObject()

SendToDiscord = function(playerName, discordMessage)
    local embeds = {
        {
            ['type'] = 'rich',
            ['title'] = 'ITEM SELLER LOGS',
            ['description'] = discordMessage,
            ['color'] = 10092339,
            ['footer'] = {
                ['text'] = 'Lurvorx Scripts Logs | ' .. os.date(),
                ['icon_url'] = 'https://cdn.discordapp.com/attachments/1185300625320329296/1185630929847337000/Lurvorx-Scripts-Logga.jpg?ex=6675b4d9&is=66746359&hm=154e4c80ac278286f9b24f7e1b832fe2afcddad8d4801c62e7656d4b1a79da55&'
            }
        }
    }

    PerformHttpRequest(Config.Webhook, function(err, text, headers) end, 'POST', json.encode({ embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent("lurvorx_seller:sellItem")
AddEventHandler("lurvorx_seller:sellItem", function(item, amount, money)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerName = GetPlayerName(_source)
    local itemCount = xPlayer.hasItem(item)

    if itemCount and itemCount.count > 0 then
        xPlayer.removeInventoryItem(item, amount)
        local amountGettingMoney = xPlayer.addMoney(money)
        TriggerClientEvent("esx:showNotification", source, Config.Locale.Notification.soldItem .. " " .. amount .. " ~g~" .. item, "success", Config.NotificationTime)
    else
        TriggerClientEvent("esx:showNotification", source, Config.Locale.Notification.noItem .. " ~r~" .. item, "error", Config.NotificationTime)
        return
    end

    local discordid = string.gsub(GetPlayerIdentifier(_source, 1), "discord:", "") or "N/A"
    local fivem = GetPlayerIdentifier(_source, 2) or "N/A"
    local license = GetPlayerIdentifier(_source) or "N/A"
    local license2 = GetPlayerIdentifier(_source, 3) or "N/A"

    SendToDiscord(
        discordMessage, "**" .. playerName .. "** have sold **" .. amount .. "** item(s)." .. "\n\n`📃` **ITEM NAME:** `" .. item .. "`\n`📃` **ITEMS LEFT:** `" .. itemCount.count - amount .. "`\n\n`👤` **PLAYER:** `" .. playerName .. "`\n`🔢` **SERVER ID:** `" .. _source .. "`\n`💬` **DISCORD:** " .. "<@" .. discordid .. "> [||" .. discordid .. "||]" .. "\n`🎮` **FIVEM:** ||" .. fivem .. "||\n`💿` **LICENSE:** ||" .. license .. "||\n`📀` **LICENSE 2:** ||" .. license2 .. "||"
    )

end)