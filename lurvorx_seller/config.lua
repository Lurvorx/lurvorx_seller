Config = {}

-- The webhook link for you logs
Config.Webhook = "https://discord.com/api/webhooks/1233569487039496235/OOqCOpIodCEcBBsqdXOqP7lwJPMiKBUtwx__VGHmZOBFXfE5VY_RNJNu8LS7vIF4Mtc-"

-- For how long the notification will be shown
Config.NotificationTime = 5000

-- Here you can config your blip
Config.Blip = {
    ShowBlip = true,
    BlipName = "Item sell",
    BlipCoords = {x = 1361.0126, y = 3615.8086, z = 34.8913},
    BlipType = 280, -- https://docs.fivem.net/docs/game-references/blips/
    BlipScale = 1.0,
    BlipColour = 2 -- https://docs.fivem.net/docs/game-references/blips/
}

-- Here you can config your ped
Config.Ped = {
    ShowPed = true,
    PedModel = "a_m_y_soucent_02", -- https://docs.fivem.net/docs/game-references/ped-models/
    PedCoords = {x = 1361.0126, y = 3615.8086, z = 33.8913},
    PedHeading = 23.8649
}

-- Here you can config your text
Config.Text = {
    TextCoords = {x = 1361.0126, y = 3615.8086, z = 34.8913},
    TextScale = 0.5,
    Text = "To open the item sell menu"
}

-- Here you can config your menu
Config.Menu = {
    ControlToOpenMenu = 38, -- https://docs.fivem.net/docs/game-references/controls/
    MenuName = "Item sell menu",
    MenuAlign = "center"
}

-- Here you can config the items
-- lable = Text on item players can sell
-- type = The type of the element (DON'T TOUCH)
-- value = How many of the items you can sell per click
-- price = How much money you get from selling the item
-- item = What item you can sell
Config.Items = {
    {label = "Sell Weed - $50", type = "range", value = 1, price = 50, item = "cannabis"},
    {label = "Sell Phone - $100", type = "range", value = 1, price = 100, item = "phone"}
}

-- Here you can config your locale
Config.Locale = {
    Notification = {
        soldItem = "You have sold",
        noItem = "You do not have"
    }
}