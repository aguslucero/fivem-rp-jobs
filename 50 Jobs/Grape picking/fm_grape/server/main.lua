ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('fm_grape:pickedUpCannabis')
AddEventHandler('fm_grape:pickedUpCannabis', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem('grape_a')

	if xItem.limit ~= -1 and (xItem.count + 1) > xItem.limit then
		TriggerClientEvent('esx:showNotification', _source, _U('weed_inventoryfull'))
	else
		xPlayer.addInventoryItem(xItem.name, math.random(1,1))
	end
end)

ESX.RegisterServerCallback('fm_grape:canPickUp', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local xItem = xPlayer.getInventoryItem(item)

	if xItem.limit ~= -1 and xItem.count >= xItem.limit then
		cb(false)
	else
		cb(true)
	end
end)
