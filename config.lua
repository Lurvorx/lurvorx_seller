Config = {}

-- Your discord webhook for the item seller logs.
Config.Webhook = "https://discord.com/api/webhooks/1233569487039496235/OOqCOpIodCEcBBsqdXOqP7lwJPMiKBUtwx__VGHmZOBFXfE5VY_RNJNu8LS7vIF4Mtc-"

-- For how long the notification time wil be shown for (in seconds).
Config.NotificationTime = 5

-- Config the blip under.
-- Find information about blips here: https://docs.fivem.net/docs/game-references/blips/
Config.Blip = {

    ShowBlip = true,
    BlipName = "Item sell",
    BlipCoords = {x = 1361.0126, y = 3615.8086, z = 34.8913},
    BlipType = 280,
    BlipScale = 1.0,
    BlipColour = 2

}

-- Config the ped under.
-- Find information about peds here: https://docs.fivem.net/docs/game-references/ped-models/
Config.Ped = {
    ShowPed = true,
    PedModel = "a_m_y_soucent_02",
    PedCoords = {x = 1361.0126, y = 3615.8086, z = 33.8913},
    PedHeading = 23.8649
}

-- Config your text under.
Config.Text = {
    TextCoords = {x = 1361.0126, y = 3615.8086, z = 34.8913},
    TextScale = 0.5,
    Text = "~INPUT_CONTEXT~ To open the item sell menu"
}

-- Here you can config your menu.
-- Find information about controls here: https://docs.fivem.net/docs/game-references/controls/
Config.Menu = {
    ControlToOpenMenu = 38,
    MenuName = "Item sell menu",
    MenuAlign = "center"
}

-- Here you can config the items.
-- lable = Text on item players can sell
-- type = The type of the element (DON'T TOUCH)
-- value = How many of the items you can sell per click
-- price = How much money you get from selling the item (price of ONE item)
-- item = What item you can sell
Config.Items = {

    {label = "Sell Weed - $50", type = "range", value = 5, price = 50, item = "cannabis"},
    {label = "Sell Phone - $100", type = "range", value = 1, price = 100, item = "phone"}

}

-- Config the language you want to use.
Config.Strings = {

    -- The language for the notifications.
    Notification = {
        soldItem = "You have sold",
        soldItemColor = "~g~",
        noItem = "You do not have ~r~"
    }

}
