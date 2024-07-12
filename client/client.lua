ESX = nil
ESX = exports["es_extended"]:getSharedObject()

isindeal = false

Citizen.CreateThread(function()

    if Config.Blip.ShowBlip == true then
        blip = nil
        local blipcoords = Config.Blip.BlipCoords

        blip = AddBlipForCoord(blipcoords.x, blipcoords.y, blipcoords.z)
        SetBlipSprite(blip, Config.Blip.BlipType)
        SetBlipDisplay(blip, 2)
        SetBlipScale(blip, Config.Blip.BlipScale)
        SetBlipColour(blip, Config.Blip.BlipColour)
        AddTextEntry("ITEMSELLBLIP", Config.Blip.BlipName)
        BeginTextCommandSetBlipName("ITEMSELLBLIP")
        EndTextCommandSetBlipName(blip)
    end    

    if Config.Ped.ShowPed == true then
        local pedModel = GetHashKey(Config.Ped.PedModel)
        local pedCoords = Config.Ped.PedCoords
        local pedHeading = Config.Ped.PedHeading

        RequestModel(pedModel)

        while not HasModelLoaded(pedModel) do
            Citizen.Wait(10)
        end

        local itemSeller = CreatePed(2, pedModel, pedCoords.x, pedCoords.y, pedCoords.z, pedHeading, false, false)

        FreezeEntityPosition(itemSeller, true)
        SetEntityInvincible(itemSeller, true)
        SetBlockingOfNonTemporaryEvents(itemSeller, true)
    end

    while true do

        local sleep = 500

        if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId(), false), Config.Text.TextCoords.x, Config.Text.TextCoords.y, Config.Text.TextCoords.z) < 2.5 then
            sleep = 10
            ESX.ShowHelpNotification("~INPUT_CONTEXT~ " .. Config.Text.Text)
        end
        if IsControlJustPressed(0, Config.Menu.ControlToOpenMenu) then
            isindeal = true
            OpenItemSellMenu()
        end

        if isindeal == true then
			sleep = 10
        end
        
		if IsControlJustReleased(0, 73) then
			isindeal = false
	    end

    Citizen.Wait(sleep)
    end
end)

function OpenItemSellMenu()
    ESX.UI.Menu.Open(
        "default", GetCurrentResourceName(), Config.Menu.MenuName,
        {
            title = Config.Menu.MenuName,
            align = Config.Menu.MenuAlign,
            elements = Config.Items
        }, 
        function (data, menu)
            local name = data.current.item
            local amount = data.current.value
            local money = data.current.value * data.current.price

            TriggerServerEvent("lurvorx_seller:sellItem", name, amount, money)
        end,
        function(data, menu)
            menu.close()
            isindeal = false
        end
    )
end