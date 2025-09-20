-- Configuration
local Config = require("config.main")

-- Locales
local locales = lib.loadJson(("locales.%s"):format(Config.Locale))

--- Toggles the HUD visibility
--- @param state boolean -- Whether to enable or disable the HUD
local function toggleHud(state)
    if state then
        TriggerEvent("qbx_hud:client:showHud")
    else
        TriggerEvent("qbx_hud:client:hideHud")
    end
end

--- Sends a notification to the client
--- @param data {title: string, description: string, type: string}
local function clientNotify(data)
    lib.notify({
        title = data.title,
        description = data.description,
        type = data.type,
        duration = 5000,
    })
end

--- Sends a notification from the server to a specific client
--- @param source number -- Player source ID
--- @param data {title: string, description: string, type: string}
local function serverNotify(source, data)
    TriggerClientEvent("ox_lib:notify", source, {
        title = data.title,
        description = data.description,
        type = data.type,
        duration = 5000,
        position = "top",
        style = { backgroundColor = "#1E1E1E" },
    })
end

--- Displays a help text
--- @param msg string -- The message to display
local function helpText(msg)
    AddTextEntry("helpText", msg)
    DisplayHelpTextThisFrame("helpText", false)
end

--- Displays floating help text near an entity or specific coordinates
--- @param msg string -- The message to display
--- @param entity? number -- The entity ID (optional)
--- @param coords? vector3 -- The coordinates (required if entity is nil)
local function floatingHelpText(msg, entity, coords)
    AddTextEntry("floatingHelpText", msg)
    SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
    BeginTextCommandDisplayHelp("floatingHelpText")
    EndTextCommandDisplayHelp(2, false, false, -1)

    if entity then
        local entityCoords = GetEntityCoords(entity)
        SetFloatingHelpTextWorldPosition(1, entityCoords.x, entityCoords.y, entityCoords.z + 0.85)
    elseif coords then
        SetFloatingHelpTextWorldPosition(1, coords.x, coords.y, coords.z)
    end
end

--- Creates a target zone for interacting with a shop
--- @param shopKey string -- The shop location key
--- @param shopData {Interaction: {Target: {boxZoneSize: vector3, drawSprite: boolean, distance: number}}}
--- @param shopCoords vector4 -- The coordinates for the target zone
--- @param openFunction function -- The function to open the shop
local function addTarget(shopKey, shopData, shopCoords, openFunction)
    exports.sleepless_interact:addCoords(vec3(shopCoords.x, shopCoords.y, shopCoords.z), {
        icon = locales.interaction.target.icon,
        label = locales.interaction.target.label,
        distance = 5.0,
        onSelect = function(data)
            openFunction(shopKey, shopData)
        end,
        canInteract = function(entity, distance, coords, name)
            return distance <= shopData.Interaction.Target.distance and not cache.vehicle
        end
    })
end

return {
    ToggleHud = toggleHud,
    Notify = {
        Client = clientNotify,
        Server = serverNotify,
    },
    Interact = {
        HelpText = helpText,
        FloatingHelpText = floatingHelpText,
        AddTarget = addTarget,
    },
}
