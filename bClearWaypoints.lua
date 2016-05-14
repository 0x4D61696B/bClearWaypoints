-- =============================================================================
--  bClearWaypoints
--    by: BurstBiscuit
-- =============================================================================

require "math"
require "table"
require "unicode"

require "lib/lib_ChatLib"
require "lib/lib_Slash"


-- =============================================================================
--  Functions
-- =============================================================================

function Notification(message)
    ChatLib.Notification({text = "[bClearWaypoints] " .. tostring(message)})
end

function OnSlashCommand(args)
    local argument = unicode.lower(args.text)

    if (unicode.match(argument, "^a")) then
        Notification("Removing ALL waypoints")
        Game.ClearWayPoint()
        Component.GenerateEvent("MY_PERSONAL_WAYPOINT_CHANGED", {})
        Squad.ClearWayPoint()
        Platoon.ClearWayPoint()

    elseif (unicode.match(argument, "^[gps]")) then
        Notification("Removing group waypoint")
        Squad.ClearWayPoint()
        Platoon.ClearWayPoint()

    else
        Notification("Removing personal waypoint")
        Game.ClearWayPoint()
        Component.GenerateEvent("MY_PERSONAL_WAYPOINT_CHANGED", {})
    end
end


-- =============================================================================
--  Events
-- =============================================================================

function OnComponentLoad()
    LIB_SLASH.BindCallback({
        slash_list  = "bclearwaypoints, bcwp",
        description = "bClearWaypoints",
        func        = OnSlashCommand
    })
end
