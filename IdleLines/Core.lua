--========================================================--
-- IdleLines - Core (Clean Modern Version)
--========================================================--

local addonName, ns = ...
IdleLines = ns  -- global-ish namespace for convenience

------------------------------------------------------------
-- Saved Variables
------------------------------------------------------------

local defaults = {
    enabled = true,

    -- UI behavior
    frameScaleX     = 1.0,  -- Horizontal scale
    frameScaleY     = 1.0,  -- Vertical scale
    frameAlpha      = 1.0,  -- Frame transparency (0.0 = invisible, 1.0 = opaque)
    fadeEnabled     = true,
    fadeIn          = 0.3,
    fadeOut         = 0.3,
    soundEnabled    = true,
    theme           = 1,  -- Default to "Classic Parchment"
    delay           = 0,  -- Delay before showing poem (seconds)
    font            = "Fonts\\FRIZQT__.TTF",
    fontSize        = 18,
    poemLength      = 40, -- Maximum lines in poem (5-44 range)

    -- Theme color overrides (indexed by theme number)
    themeOverrides = {},

    -- Position
    framePos = {},
}

------------------------------------------------------------
-- Utility: Deep Copy
------------------------------------------------------------

local function CopyDefaults(src, dest)
    if type(src) ~= "table" then return {} end
    if type(dest) ~= "table" then dest = {} end

    for k, v in pairs(src) do
        if type(v) == "table" then
            dest[k] = CopyDefaults(v, dest[k])
        elseif dest[k] == nil then
            dest[k] = v
        end
    end

    return dest
end

------------------------------------------------------------
-- Addon Initialization
------------------------------------------------------------

local core = CreateFrame("Frame")
ns.core = core

-- Recent event memory (text + timestamp)
ns.recent = {
    lastKill        = { text = nil, time = 0 },
    lastSpell       = { text = nil, time = 0 },
    lastLoot        = { text = nil, time = 0 },
    lastEmote       = { text = nil, time = 0 },
    lastSkill       = { text = nil, time = 0 },
    lastLevel       = { text = nil, time = 0 },
    lastAchievement = { text = nil, time = 0 },
    lastMount       = { text = nil, time = 0 },
}

core:RegisterEvent("ADDON_LOADED")
core:RegisterEvent("PLAYER_LOGIN")

core:SetScript("OnEvent", function(self, event, ...)
    if event == "ADDON_LOADED" then
        local loaded = ...
        if loaded == addonName then

            -- Initialize saved variables
            IdleLinesDB = CopyDefaults(defaults, IdleLinesDB)
            ns.db = IdleLinesDB

            -- Global init
            if ns.OnInit then
                ns:OnInit()
            end

            -- Module-specific init hooks
            if ns.Generator and ns.Generator.OnInit then
                ns.Generator:OnInit()
            end
            if ns.UI and ns.UI.OnInit then
                ns.UI:OnInit()
            end
            if ns.events and ns.events.OnInit then
                ns.events:OnInit()
            end
        end

    elseif event == "PLAYER_LOGIN" then

        -- Global login hook
        if ns.OnLogin then
            ns:OnLogin()
        end

        -- Apply UI settings once frame exists
        if ns.UI and ns.UI.ApplySettings then
            ns.UI:ApplySettings()
        end
    end
end)

------------------------------------------------------------
-- Module Initialization Hooks
------------------------------------------------------------

function ns:OnInit()
    -- Register slash commands
    if ns.ConfigCommands and ns.ConfigCommands.Register then
        ns.ConfigCommands:Register()
    end

    -- Ensure framePos exists
    ns.db.framePos = ns.db.framePos or {}
end

function ns:OnLogin()
    -- Restore frame position if UI exists
    if ns.UI and ns.UI.frame and ns.db.framePos.point then
        local pos = ns.db.framePos
        ns.UI.frame:ClearAllPoints()
        ns.UI.frame:SetPoint(pos.point, UIParent, pos.relPoint, pos.x, pos.y)
    end
end

------------------------------------------------------------
-- Public API
------------------------------------------------------------

function ns:Enable()
    ns.db.enabled = true
end

function ns:Disable()
    ns.db.enabled = false
end

function ns:IsEnabled()
    return ns.db.enabled
end

------------------------------------------------------------
-- Debug Helper
------------------------------------------------------------

function ns:Debug(msg)
    -- Uncomment to enable debug output
    -- print("|cff88ccffIdleLines:|r " .. tostring(msg))
end