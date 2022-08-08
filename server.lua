local QBCore = exports['qb-core']:GetCoreObject()


RegisterNetEvent('tc-pawnshop-sv-sellItems', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local hasItem = nil
    for k, v in pairs(Config.Items) do


        local name = v.itemName
        local money = math.random(v.MinSellPrice,v.MaxSellPrice)
         

    
        if Player.Functions.GetItemByName(name) ~= nil then
            hasItem = true
            local amt = Player.Functions.GetItemByName(name).amount
            local pay = money * amt
            Player.Functions.AddMoney('cash', pay)
            Player.Functions.RemoveItem(name, amt)
        end

    end

    if hasItem then
        TriggerClientEvent('QBCore:Notify', src, 'The Dealer Likes Your Items', 'success')
    end

    if not hasItem then
        TriggerClientEvent('QBCore:Notify', src, 'None Of The Items Are In The Dealers Value', 'error')
    end

end)




