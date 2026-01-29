--========================================================--
-- IdleLines - Events (Midnight Safe, Updated)
--========================================================--

local addonName, ns = ...

local events = CreateFrame("Frame")
ns.events = events

------------------------------------------------------------
-- Cached player info
------------------------------------------------------------

ns.playerClass = select(2, UnitClass("player"))
ns.playerName  = UnitName("player")
ns.currentZone = GetZoneText()

------------------------------------------------------------
-- Event Registration
------------------------------------------------------------

-- ONLY track AFK state changes
events:RegisterEvent("PLAYER_FLAGS_CHANGED")

-- Track zone for poem generation (but don't trigger showing/hiding)
events:RegisterEvent("ZONE_CHANGED")
events:RegisterEvent("ZONE_CHANGED_NEW_AREA")
events:RegisterEvent("PLAYER_ENTERING_WORLD")

-- Recent event tracking (Midnight-safe)
events:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
events:RegisterEvent("CHAT_MSG_LOOT")
events:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
events:RegisterEvent("CHAT_MSG_SKILL")

-- New recent events
events:RegisterEvent("PLAYER_LEVEL_UP")
events:RegisterEvent("ACHIEVEMENT_EARNED")
events:RegisterEvent("PLAYER_MOUNT_DISPLAY_CHANGED")

-- Optional kill tracking (no CLEU)
events:RegisterEvent("UNIT_COMBAT")

------------------------------------------------------------
-- Internal Helpers
------------------------------------------------------------

events.isCurrentlyAFK = false  -- Track AFK state (accessible to other modules)
local delayTimer = nil  -- Timer for delayed poem showing

local function HandleAFKState()
    if not ns:IsEnabled() then return end
    
    local nowAFK = UnitIsAFK("player")
    
    -- Only act on state CHANGE
    if nowAFK == events.isCurrentlyAFK then
        return  -- No change, do nothing
    end
    
    events.isCurrentlyAFK = nowAFK
    
    if nowAFK then
        -- Just became AFK - show poem after delay
        local delay = (ns.db and ns.db.delay) or 0
        
        if delay > 0 then
            -- Cancel any existing timer
            if delayTimer then
                delayTimer:Cancel()
            end
            
            -- Create delayed timer
            delayTimer = C_Timer.NewTimer(delay, function()
                delayTimer = nil
                -- Double-check still AFK after delay
                if UnitIsAFK("player") and ns.UI and ns.UI.ShowPoem and ns.Generator then
                    local poem, title = ns.Generator:BuildPoem()
                    ns.UI:ShowPoem(poem, title)
                end
            end)
        else
            -- No delay, show immediately
            if ns.UI and ns.UI.ShowPoem and ns.Generator then
                local poem, title = ns.Generator:BuildPoem()
                ns.UI:ShowPoem(poem, title)
            end
        end
    else
        -- No longer AFK - cancel any pending timer and hide poem
        if delayTimer then
            delayTimer:Cancel()
            delayTimer = nil
        end
        
        if ns.UI and ns.UI.HidePoem then
            ns.UI:HidePoem()
        end
    end
end

local function HandleZoneChange()
    local newZone = GetZoneText()
    if newZone ~= ns.currentZone then
        ns.currentZone = newZone
    end
end

------------------------------------------------------------
-- Recent Event Memory Helper
------------------------------------------------------------

local function StoreRecent(key, text)
    if not ns.recent[key] then return end
    ns.recent[key].text = text
    ns.recent[key].time = GetTime()
end

------------------------------------------------------------
-- Mount Name Helper (safe + accurate)
------------------------------------------------------------

local function GetCurrentMountName()
    if not IsMounted() then return nil end

    local mountIDs = C_MountJournal.GetMountIDs()
    for _, id in ipairs(mountIDs) do
        local name, _, _, active = C_MountJournal.GetMountInfoByID(id)
        if active then
            return name
        end
    end

    return "a mount"
end

------------------------------------------------------------
-- Event Dispatcher
------------------------------------------------------------

events:SetScript("OnEvent", function(self, event, ...)

    if event == "PLAYER_FLAGS_CHANGED" then
        HandleAFKState()

    elseif event == "ZONE_CHANGED" or event == "ZONE_CHANGED_NEW_AREA" then
        HandleZoneChange()

    elseif event == "PLAYER_ENTERING_WORLD" then
        ns.currentZone = GetZoneText()

	elseif event == "UNIT_SPELLCAST_SUCCEEDED" then
		local unit, _, spellID = ...
		if unit == "player" then
			local info = C_Spell.GetSpellInfo(spellID)
			local name = info and info.name or "a spell"
			StoreRecent("lastSpell", name)
		end

    elseif event == "CHAT_MSG_LOOT" then
        local msg = ...
        StoreRecent("lastLoot", msg)

    elseif event == "CHAT_MSG_TEXT_EMOTE" then
        local msg = ...
        StoreRecent("lastEmote", msg)

    elseif event == "CHAT_MSG_SKILL" then
        local msg = ...
        StoreRecent("lastSkill", msg)

    elseif event == "PLAYER_LEVEL_UP" then
        local level = ...
        StoreRecent("lastLevel", tostring(level))

    elseif event == "ACHIEVEMENT_EARNED" then
        local id = ...
        local link = GetAchievementLink(id) or ("Achievement " .. id)
        StoreRecent("lastAchievement", link)

    elseif event == "PLAYER_MOUNT_DISPLAY_CHANGED" then
        local name = GetCurrentMountName()
        if name then
            StoreRecent("lastMount", name)
        end

    elseif event == "UNIT_COMBAT" then
        local unit, action = ...
        if unit == "player" and action == "KILL" then
            StoreRecent("lastKill", "an enemy")
        end
    end
end)

------------------------------------------------------------
-- Lifecycle Hooks
------------------------------------------------------------

function ns:OnLogin()
    ns:Debug("Events module initialized.")
end