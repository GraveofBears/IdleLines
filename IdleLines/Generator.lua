--========================================================--
-- IdleLines - Generator (Story Mode + Dynamic Titles)
--========================================================--

local addonName, ns = ...

local Generator = {}
ns.Generator = Generator

------------------------------------------------------------
-- Title Templates (weighted by poem context)
------------------------------------------------------------

local titleTemplates = {
    -- General / Neutral
    general = {
        "Idle Thoughts",
        "A Moment's Rest",
        "Verses of Stillness",
        "The Wanderer's Pause",
        "Between Battles",
        "Silent Reflections",
        "The Quiet Hour",
        "Musings in Shadow",
        "A Breath Between",
        "Echoes of Calm",
        "The Still Path",
        "Words Unspoken",
        "Fragments of Peace",
        "The Resting Blade",
        "Whispers in Waiting",
    },
    
    -- Time-based
    morning = {
        "Dawn's First Light",
        "Morning Meditations",
        "The Waking Hour",
        "Sunrise Verses",
        "First Breath of Day",
    },
    
    day = {
        "Midday Musings",
        "Under Bright Skies",
        "The Sun's Witness",
        "Daylight Verses",
        "Noontime Reflections",
    },
    
    evening = {
        "Twilight Thoughts",
        "Dusk's Embrace",
        "Evening Verses",
        "The Fading Light",
        "Sunset Musings",
    },
    
    night = {
        "Midnight Verses",
        "Under Starlight",
        "The Night Watch",
        "Moonlit Musings",
        "Whispers in Darkness",
        "Stars and Silence",
    },
    
    -- Class-themed
    WARRIOR = {
        "The Warrior's Rest",
        "Steel and Silence",
        "Between Battles",
        "The Sword Sleeps",
    },
    
    PALADIN = {
        "Light's Vigil",
        "Sacred Silence",
        "The Faithful Rest",
        "Verses of Virtue",
    },
    
    HUNTER = {
        "The Hunter's Pause",
        "Wild Musings",
        "Beast and Bow",
        "Tracks in Silence",
    },
    
    ROGUE = {
        "Shadows at Rest",
        "The Silent Blade",
        "Between Strikes",
        "Whispers in Shadow",
    },
    
    PRIEST = {
        "Prayers Unspoken",
        "Divine Reflections",
        "The Quiet Faith",
        "Sacred Verses",
    },
    
    SHAMAN = {
        "Elemental Musings",
        "The Spirit's Voice",
        "Nature's Whispers",
        "Between the Winds",
    },
    
    MAGE = {
        "Arcane Verses",
        "The Mage's Meditation",
        "Between Spells",
        "Threads of Magic",
    },
    
    WARLOCK = {
        "Dark Contemplations",
        "The Warlock's Hour",
        "Between Pacts",
        "Shadow's Verses",
    },
    
    MONK = {
        "The Still Center",
        "Balance in Silence",
        "Verses of Serenity",
        "The Calm Within",
    },
    
    DRUID = {
        "Nature's Pause",
        "Wild Verses",
        "The Druid's Rest",
        "Green Silence",
    },
    
    DEMONHUNTER = {
        "The Watcher's Rest",
        "Between Hunts",
        "Fel and Silence",
        "Vengeance Waits",
    },
    
    DEATHKNIGHT = {
        "The Cold Rest",
        "Frost and Silence",
        "The Unliving's Verse",
        "Between Deaths",
    },
    
    EVOKER = {
        "Draconic Verses",
        "Threads of Time",
        "The Evoker's Pause",
        "Between Flights",
    },
    
    -- Zone-based
    forest = {
        "Among the Trees",
        "Forest Verses",
        "The Green Silence",
        "Woodland Musings",
    },
    
    desert = {
        "Desert Verses",
        "Under Hot Sun",
        "Sand and Silence",
        "The Barren Path",
    },
    
    stormwind = {
        "City of Lions",
        "Stormwind Verses",
        "The Harbor's Rest",
        "Alliance Musings",
    },
    
    orgrimmar = {
        "Valley of Strength",
        "Horde Verses",
        "Red Earth Musings",
        "The Warrior's City",
    },
    
    -- Seasonal
    winterveil = {
        "Winter's Verses",
        "Frost and Firelight",
        "The Long Night",
        "Snowy Musings",
    },
    
    hallowsend = {
        "Hollow Verses",
        "Between Worlds",
        "The Thin Veil",
        "Shadowed Musings",
    },
    
    lunar = {
        "Lunar Verses",
        "Moonlit Reflections",
        "Ancestral Musings",
        "The Silver Path",
    },
    
    midsummer = {
        "Summer Verses",
        "Fire and Light",
        "The Long Day",
        "Sun-Touched Musings",
    },
}

------------------------------------------------------------
-- Utility: Random From Table (No Repeats Per Poem)
------------------------------------------------------------

local function Pick(t, used)
    if not t or #t == 0 then return "" end

    -- Build list of unused lines
    local choices = {}
    for _, line in ipairs(t) do
        if not used[line] then
            table.insert(choices, line)
        end
    end

    -- If everything was used, reset memory
    if #choices == 0 then
        wipe(used)
        choices = t
    end

    local line = choices[math.random(1, #choices)]
    used[line] = true
    return line
end

------------------------------------------------------------
-- Generate Contextual Title (Content-Aware)
------------------------------------------------------------

local function GenerateTitle(context, poemLines)
    -- Analyze the poem content for keywords
    local poemText = table.concat(poemLines, " "):lower()
    
    local keywords = {
        -- Combat/Battle
        battle = {"blade", "steel", "armor", "battle", "war", "weapon", "strike", "charge", "fury", "rage", "victory"},
        light = {"light", "holy", "radiance", "blessed", "sacred", "prayer", "faith", "glow"},
        shadow = {"shadow", "dark", "void", "whisper", "fel", "demon", "corrupt"},
        nature = {"wild", "forest", "leaf", "tree", "root", "earth", "druid", "green", "growth"},
        arcane = {"arcane", "magic", "spell", "weave", "shimmer", "frost", "fire", "mage"},
        hunt = {"hunt", "track", "arrow", "companion", "beast", "bow", "wild", "prey"},
        death = {"grave", "frost", "undead", "scourge", "chill", "death", "cold", "bone"},
        storm = {"storm", "thunder", "lightning", "wind", "element", "totem", "spirit"},
        stealth = {"stealth", "dagger", "rogue", "silence", "vanish", "pick", "secret"},
        peace = {"peace", "calm", "still", "quiet", "rest", "breath", "serene", "gentle"},
        memory = {"remember", "memory", "echo", "linger", "past", "forgotten", "recall"},
        journey = {"path", "journey", "wander", "road", "travel", "horizon", "distance"},
        time = {"time", "moment", "age", "ancient", "eternal", "forever", "dawn", "dusk"},
        dream = {"dream", "vision", "sleep", "emerald", "nightmare"},
    }
    
    -- Count keyword matches
    local scores = {}
    for category, words in pairs(keywords) do
        scores[category] = 0
        for _, word in ipairs(words) do
            local _, count = poemText:gsub(word, word)
            scores[category] = scores[category] + count
        end
    end
    
    -- Find dominant theme
    local maxScore = 0
    local dominantTheme = "peace" -- default
    for category, score in pairs(scores) do
        if score > maxScore then
            maxScore = score
            dominantTheme = category
        end
    end
    
    -- Title templates based on poem content
    local contentTitles = {
        battle = {"Echoes of War", "Steel and Resolve", "The Warrior's Path", "Songs of Battle", "Armored Reflections"},
        light = {"Radiant Moments", "The Light's Embrace", "Sacred Stillness", "Blessed Quietude", "Holy Reflections"},
        shadow = {"Shadows Gather", "Whispers in Darkness", "The Void's Call", "Dark Musings", "Shadowed Thoughts"},
        nature = {"Among the Wilds", "Nature's Breath", "The Green Dream", "Roots and Branches", "Wild Reflections"},
        arcane = {"Arcane Musings", "The Weave Unravels", "Magical Moments", "Spellbound Thoughts", "Mystic Reflections"},
        hunt = {"The Hunter's Rest", "Tracks and Trails", "Wild Companions", "The Patient Aim", "Predator's Pause"},
        death = {"Grave Thoughts", "Frost and Memory", "The Cold Embrace", "Undying Reflections", "Beyond the Veil"},
        storm = {"Elemental Calm", "Storm's Eye", "Thunder's Echo", "The Shaman's Vision", "Spirits Whisper"},
        stealth = {"Shadows and Secrets", "The Rogue's Repose", "Silent Thoughts", "Veiled Moments", "Whispered Words"},
        peace = {"Peaceful Interlude", "Moments of Calm", "Quiet Contemplation", "Stillness Speaks", "Serene Thoughts"},
        memory = {"Echoes of Yesterday", "Memories Linger", "Fragments of Time", "The Past Whispers", "Remembered Moments"},
        journey = {"The Road Ahead", "Wanderer's Rest", "Paths Untraveled", "Journey's Pause", "Horizons Call"},
        time = {"Timeless Moments", "The Passage of Hours", "Ancient Echoes", "Eternal Reflections", "Dawn to Dusk"},
        dream = {"Dream's Edge", "The Emerald Reverie", "Visions Unfolding", "Sleeping Thoughts", "Dream Walker"},
    }
    
    -- Get title from dominant theme
    local titleList = contentTitles[dominantTheme] or contentTitles.peace
    local selectedTitle = titleList[math.random(1, #titleList)]
    
    -- Add contextual flavor if available
    if context.zone then
        local zoneInfluence = {
            ["Peace"] = selectedTitle,
            ["Orgrimmar"] = selectedTitle,
            ["Stormwind"] = selectedTitle,
        }
        selectedTitle = zoneInfluence[context.zone] or selectedTitle
    end
    
    return selectedTitle
end

------------------------------------------------------------
-- Utility: Recent Memory Freshness (5-minute decay)
------------------------------------------------------------

local function IsFresh(entry)
    if not entry or not entry.text then return false end
    return (GetTime() - entry.time) <= 300
end

------------------------------------------------------------
-- Template Sources (loaded at runtime)
------------------------------------------------------------

local function GetTemplates()
    return {
        general          = IdleLines_Templates_General        or {},
        classLines       = IdleLines_Templates_Class          or {},
        zoneLines        = IdleLines_Templates_Zone           or {},
        timeLines        = IdleLines_Templates_Time           or {},
        seasonalLines    = IdleLines_Templates_Seasonal       or {},
        classZoneLines   = IdleLines_Templates_ClassZone      or {},
        rareLines        = IdleLines_Templates_Rare           or {},

        recentKillLines        = IdleLines_Templates_RecentKill        or {},
        recentSpellLines       = IdleLines_Templates_RecentSpell       or {},
        recentLootLines        = IdleLines_Templates_RecentLoot        or {},
        recentEmoteLines       = IdleLines_Templates_RecentEmote       or {},
        recentSkillLines       = IdleLines_Templates_RecentSkill       or {},
        recentLevelLines       = IdleLines_Templates_RecentLevel       or {},
        recentAchievementLines = IdleLines_Templates_RecentAchievement or {},
        recentMountLines       = IdleLines_Templates_RecentMount       or {},
    }
end

------------------------------------------------------------
-- Debug: Check Template Loading
------------------------------------------------------------

function Generator:DebugTemplates()
    local t = GetTemplates()

    print("|cff88ccffIdleLines Template Debug:|r")
    print("General: " .. #t.general .. " lines")

    local function countKeys(tbl)
        local c = 0
        for _ in pairs(tbl) do c = c + 1 end
        return c
    end

    print("Class: " .. countKeys(t.classLines))
    print("Zone: " .. countKeys(t.zoneLines))
    print("Time: " .. countKeys(t.timeLines))
    print("Seasonal: " .. countKeys(t.seasonalLines))

    print("Rare: " .. #t.rareLines)
    print("RecentKill: " .. #t.recentKillLines)
    print("RecentSpell: " .. #t.recentSpellLines)
    print("RecentLoot: " .. #t.recentLootLines)
    print("RecentEmote: " .. #t.recentEmoteLines)
    print("RecentSkill: " .. #t.recentSkillLines)
    print("RecentLevel: " .. #t.recentLevelLines)
    print("RecentAchievement: " .. #t.recentAchievementLines)
    print("RecentMount: " .. #t.recentMountLines)

    print("|cffff8800Player Class:|r " .. (ns.playerClass or "UNKNOWN"))
    print("|cffff8800Current Zone:|r " .. (ns.currentZone or "UNKNOWN"))

    print("|cff88ccffGenerating test poem...|r")
    local poem, title = self:BuildPoem()
    print("|cff00ff00SUCCESS:|r " .. #poem .. " characters")
    print("|cff88ccffTitle:|r " .. title)
    print("|cff88ccffPreview:|r " .. poem:sub(1, 120))
end

------------------------------------------------------------
-- Time-of-Day Bucket
------------------------------------------------------------

local function GetTimeBucket()
    local hour = tonumber(date("%H"))
    if hour < 6 then return "night"
    elseif hour < 12 then return "morning"
    elseif hour < 18 then return "day"
    else return "evening" end
end

------------------------------------------------------------
-- Zone Key
------------------------------------------------------------

local function GetZoneKey()
    local zone = (ns.currentZone or ""):lower()

    if zone:find("forest") or zone:find("woods") then return "forest"
    elseif zone:find("desert") then return "desert"
    elseif zone:find("stormwind") then return "stormwind"
    elseif zone:find("orgrimmar") then return "orgrimmar"
    end

    return "generic"
end

------------------------------------------------------------
-- Seasonal Key
------------------------------------------------------------

local function GetSeasonKey()
    local month = tonumber(date("%m"))
    local day   = tonumber(date("%d"))

    if (month == 12 and day >= 16) or (month == 1 and day <= 2) then return "winterveil" end
    if (month == 10 and day >= 18) or (month == 11 and day <= 1) then return "hallowsend" end
    if month == 1 or month == 2 then return "lunar" end
    if (month == 6 and day >= 21) or (month == 7 and day <= 5) then return "midsummer" end

    return nil
end

------------------------------------------------------------
-- Adders (each adds lines to the poem)
------------------------------------------------------------

local function AddClassLine(poem, classKey, t, used)
    if t.classLines[classKey] then
        table.insert(poem, Pick(t.classLines[classKey], used))
    end
end

local function AddZoneLine(poem, zoneKey, t, used)
    if t.zoneLines[zoneKey] then
        table.insert(poem, Pick(t.zoneLines[zoneKey], used))
    end
end

local function AddTimeLine(poem, timeKey, t, used)
    if t.timeLines[timeKey] then
        table.insert(poem, Pick(t.timeLines[timeKey], used))
    end
end

local function AddSeasonLine(poem, seasonKey, t, used)
    if seasonKey and t.seasonalLines[seasonKey] then
        table.insert(poem, Pick(t.seasonalLines[seasonKey], used))
    end
end

local function AddClassZoneCombo(poem, classKey, zoneKey, t, used)
    if t.classZoneLines[classKey] and t.classZoneLines[classKey][zoneKey] then
        table.insert(poem, Pick(t.classZoneLines[classKey][zoneKey], used))
    end
end

local function AddRecentEvents(poem, r, t, used)
    local function add(entry, list)
        if IsFresh(entry) and #list > 0 then
            local template = Pick(list, used)
            table.insert(poem, template:format(entry.text))
        end
    end

    add(r.lastKill,        t.recentKillLines)
    add(r.lastSpell,       t.recentSpellLines)
    add(r.lastLoot,        t.recentLootLines)
    add(r.lastEmote,       t.recentEmoteLines)
    add(r.lastSkill,       t.recentSkillLines)
    add(r.lastLevel,       t.recentLevelLines)
    add(r.lastAchievement, t.recentAchievementLines)
    add(r.lastMount,       t.recentMountLines)
end

local function AddGeneralFiller(poem, t, used)
    if #t.general > 0 then
        table.insert(poem, Pick(t.general, used))
        if math.random() < 0.5 then
            table.insert(poem, Pick(t.general, used))
        end
    end
end

local function AddRareLine(poem, t, used)
    if t.rareLines and #t.rareLines > 0 and math.random() < 0.01 then
        table.insert(poem, Pick(t.rareLines, used))
    end
end

------------------------------------------------------------
-- BuildPoem() - Returns poem AND title
------------------------------------------------------------

function Generator:BuildPoem()
    local t = GetTemplates()

    local classKey  = ns.playerClass or "WARRIOR"
    local zoneKey   = GetZoneKey()
    local timeKey   = GetTimeBucket()
    local seasonKey = GetSeasonKey()
    local r         = ns.recent or {}

    local poem = {}
    local used = {}

    --------------------------------------------------------
    -- Line count control
    --------------------------------------------------------
    local lineCount = 0
    local maxLines  = (ns.db and ns.db.poemLength) or 40

    local function safe(fn)
        if lineCount < maxLines then
            fn()
            lineCount = lineCount + 1
        end
    end

    --------------------------------------------------------
    -- Layer definitions
    --------------------------------------------------------
    local layers = {
        { chance = 1.0, fn = function() safe(function() AddClassLine(poem, classKey, t, used) end) end },
        { chance = 1.0, fn = function() safe(function() AddZoneLine(poem, zoneKey, t, used) end) end },
        { chance = 1.0, fn = function() safe(function() AddTimeLine(poem, timeKey, t, used) end) end },
        { chance = 0.7, fn = function() safe(function() AddSeasonLine(poem, seasonKey, t, used) end) end },
        { chance = 0.6, fn = function() safe(function() AddClassZoneCombo(poem, classKey, zoneKey, t, used) end) end },
        { chance = 0.8, fn = function() safe(function() AddRecentEvents(poem, r, t, used) end) end },
        { chance = 1.0, fn = function() safe(function() AddGeneralFiller(poem, t, used) end) end },
        { chance = 0.01, fn = function() safe(function() AddRareLine(poem, t, used) end) end },
    }

    --------------------------------------------------------
    -- STORY MODE: Run layers twice
    --------------------------------------------------------
    for pass = 1, 2 do
        for _, layer in ipairs(layers) do
            if lineCount >= maxLines then break end
            if math.random() < layer.chance then

                -- Add 2 guaranteed lines
                safe(layer.fn)
                safe(layer.fn)

                -- Add 1–2 more lines with weighted chances
                if math.random() < 0.7 then safe(layer.fn) end
                if math.random() < 0.4 then safe(layer.fn) end

                ------------------------------------------------
                -- Structured stanza breaks every 4–6 lines
                ------------------------------------------------
                if lineCount > 0 and lineCount % math.random(4, 6) == 0 then
                    if poem[#poem] ~= "" then
                        table.insert(poem, "")
                    end
                end
            end
        end
        if lineCount >= maxLines then break end
    end

    --------------------------------------------------------
    -- Remove trailing blank line
    --------------------------------------------------------
    if poem[#poem] == "" then
        table.remove(poem, #poem)
    end

    --------------------------------------------------------
    -- Generate title AFTER poem is built (content-aware)
    --------------------------------------------------------
    local title = GenerateTitle({
        class = classKey,
        zoneKey = zoneKey,
        timeKey = timeKey,
        seasonKey = seasonKey,
        zone = ns.currentZone,
    }, poem)

    return table.concat(poem, "\n"), title
end

------------------------------------------------------------
-- Module Init Hook
------------------------------------------------------------

function Generator:OnInit()
    ns:Debug("Generator module initialized.")
end