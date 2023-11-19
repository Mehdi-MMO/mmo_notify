function notification(icon, appname, title, message, time, sound)
	if GetResourceKvpString('notifications') == "true" then
		if not appname then appname = "" end
		if not title then title = "" end
		if not message then message = "" end
		if not time then time = 8000 end
		if not sound then sound = "default" end

		if not icon then icon = 'far fa-keyboard text-primary'
		elseif icon == "s" then icon = "far fa-check-circle text-success" sound = "not2"
		elseif icon == "e" then icon = "fas fa-exclamation-circle text-danger" sound = "not1"
		elseif icon == "i" then icon = "far fa-envelope-open text-info" end

		if GetResourceKvpString('notificationSounds') == "true" then sound = "false" end

		SendNUIMessage({ 
			action = 'open',
			sound = sound,
			icon = icon,
			title = title,
			message = message,
			time = time,
			appname = appname
		})
	end
end

RegisterNetEvent('notification:show')
AddEventHandler('notification:show', function(icon, appname, title, message, time, sound)
	notification(icon, appname, title, message, time, sound)
end)

RegisterCommand("+-toggleNotifications", function(source, args, rawCommand) 
	if GetResourceKvpString('notifications') == 'true' then
		notification("s", "Disabled Notifications")
	  	SetResourceKvp('notifications', 'false')
	else
		SetResourceKvp('notifications', 'true')
		notification("s", "Enabled Notifications")
	end
end, false)

RegisterCommand("+-toggleNotificationsSounds", function(source, args, rawCommand) 
	if GetResourceKvpString('notificationSounds') == 'true' then
		notification("s", "Disabled Notifications Sounds")
	  	SetResourceKvp('notificationSounds', 'false')
	else
		notification("s", "Enabled Notifications Sounds")
	  	SetResourceKvp('notificationSounds', 'true')
	end
end, false)

--[[
	color : https://getbootstrap.com/docs/4.0/utilities/colors/
	icon : https://fontawesome.com/v5.15/icons/keyboard

	exprts['mmo-notify']:notification('ICON COLOR',appname,title, message , time ,sound)
]]