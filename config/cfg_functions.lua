local Locales = require("config.cfg_locales")

--- Toggles the HUD visibility.
--- @param state boolean Whether to enable or disable the HUD
local function ToggleHud(state)
	DisplayHud(state)
	DisplayRadar(state)
end

--- Sends a notification to the client.
--- @param data {title: string, description: string, type: string}
local function ClientNotify(data)
	lib.notify({
		title = data.title,
		description = data.description,
		type = data.type,

		duration = 5000,
		position = "top",
		style = { backgroundColor = "#1E1E1E" },
	})
end

--- Sends a notification from the server to a specific client.
--- @param source number Player source ID
--- @param data {title: string, description: string, type: string}
local function ServerNotify(source, data)
	TriggerClientEvent("ox_lib:notify", source, {
		title = data.title,
		description = data.description,
		type = data.type,

		duration = 5000,
		position = "top",
		style = { backgroundColor = "#1E1E1E" },
	})
end

--- Displays a help text.
--- @param msg string The message to display
local function HelpText(msg)
	AddTextEntry("HelpText", msg)
	DisplayHelpTextThisFrame("HelpText", false)
end

--- Displays floating help text near an entity or specific coordinates.
--- @param entity? number The entity ID (optional)
--- @param coords? vector3 The coordinates (required if entity is nil)
--- @param msg string The message to display
local function FloatingHelpText(entity, coords, msg)
	AddTextEntry("FloatingHelpText", msg)
	SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
	BeginTextCommandDisplayHelp("FloatingHelpText")
	EndTextCommandDisplayHelp(2, false, false, -1)

	if entity then
		local entityCoords = GetEntityCoords(entity)
		SetFloatingHelpTextWorldPosition(1, entityCoords.x, entityCoords.y, entityCoords.z + 0.85)
	elseif coords then
		SetFloatingHelpTextWorldPosition(1, coords.x, coords.y, coords.z)
	end
end

--- Creates a target zone for interacting with a shop.
--- @param location string The shop location key
--- @param data {Interaction: {Target: {BoxZoneSize: vector3, DrawSprite: boolean, Distance: number}}}
--- @param coords vector4 The coordinates for the target zone
local function AddTarget(location, data, coords)
	exports.ox_target:addBoxZone({
		coords = coords,
		size = data.Interaction.Target.BoxZoneSize,
		drawSprite = data.Interaction.Target.DrawSprite,
		options = {
			icon = Locales.Interaction.Target.Icon,
			label = Locales.Interaction.Target.Label,
			onSelect = function()
				Interaction.OpenMenu(location)
			end,
			distance = data.Interaction.Target.Distance,
			canInteract = function()
				return not IsPedInAnyVehicle(cache.ped, false)
			end,
		},
	})
end

return {
	ToggleHud = ToggleHud,
	Notify = {
		Client = ClientNotify,
		Server = ServerNotify,
	},
	Interact = {
		HelpText = HelpText,
		FloatingHelpText = FloatingHelpText,
		AddTarget = AddTarget,
	},
}
