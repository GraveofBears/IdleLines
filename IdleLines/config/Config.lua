--========================================================--
-- IdleLines - Unified Configuration (Modern Blizzard API)
--========================================================--

local addonName, ns = ...
local Config = {}
ns.Config = Config

------------------------------------------------------------
-- Local references
------------------------------------------------------------

local db -- assigned on ADDON_LOADED

------------------------------------------------------------
-- Create Main Settings Panel
------------------------------------------------------------

function Config:CreatePanel()
    local panel = CreateFrame("Frame", "IdleLinesConfigPanel", UIParent)
    panel.name = "IdleLines"

    -- Title
    panel.title = panel:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    panel.title:SetPoint("TOPLEFT", 16, -16)
    panel.title:SetText("IdleLines")

    return panel
end

------------------------------------------------------------
-- Create Scrollable Container
------------------------------------------------------------

local function CreateScrollContainer(parent)
    local scroll = CreateFrame("ScrollFrame", nil, parent, "UIPanelScrollFrameTemplate")
    scroll:SetPoint("TOPLEFT", parent.title, "BOTTOMLEFT", 0, -20)
    scroll:SetPoint("BOTTOMRIGHT", -30, 10)

    local container = CreateFrame("Frame", nil, scroll)
    container:SetSize(scroll:GetWidth() - 20, 1)
    scroll:SetScrollChild(container)

    parent.content = container
    return container
end

------------------------------------------------------------
-- Helper: Create Section Header
------------------------------------------------------------

local function CreateSection(container, label, yOffset)
    local header = container:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    header:SetPoint("TOPLEFT", container, "TOPLEFT", 10, yOffset)
    header:SetText(label)
    return header
end

------------------------------------------------------------
-- Helper: Create Checkbox
------------------------------------------------------------

local function CreateCheckbox(parent, label, initial, onChanged)
    local cb = CreateFrame("CheckButton", nil, parent, "InterfaceOptionsCheckButtonTemplate")
    cb.Text:SetText(label)
    cb:SetChecked(initial)

    cb:SetScript("OnClick", function(self)
        onChanged(self:GetChecked())
    end)

    return cb
end

------------------------------------------------------------
-- Helper: Create Slider
------------------------------------------------------------

local function CreateSlider(parent, label, minVal, maxVal, step, initial, onChanged)
    local slider = CreateFrame("Slider", nil, parent, "OptionsSliderTemplate")
    slider:SetWidth(260)
    slider:SetMinMaxValues(minVal, maxVal)
    slider:SetValueStep(step)
    slider:SetObeyStepOnDrag(true)
    slider:SetValue(initial)

    slider.Text:SetText(label)
    slider.Low:SetText(minVal)
    slider.High:SetText(maxVal)

    slider:SetScript("OnValueChanged", function(_, value)
        onChanged(value)
    end)

    return slider
end

------------------------------------------------------------
-- Custom Modern Dropdown 
------------------------------------------------------------

local function CreateModernDropdown(parent, label, items, initialIndex, onSelect)
    local container = CreateFrame("Frame", nil, parent)
    container:SetSize(220, 50)

    -- Label
    local title = container:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    title:SetPoint("TOPLEFT", 0, 0)
    title:SetText(label)

    --------------------------------------------------------
    -- Main button
    --------------------------------------------------------
    local button = CreateFrame("Button", nil, container, "UIPanelButtonTemplate")
    button:SetPoint("TOPLEFT", title, "BOTTOMLEFT", -2, -6)
    button:SetSize(180, 24)

    local current = items[initialIndex] or items[1]
    button:SetText(current)

    --------------------------------------------------------
    -- Dropdown menu frame
    --------------------------------------------------------
    local menu = CreateFrame("Frame", nil, button, "BackdropTemplate")
    menu:SetPoint("TOPLEFT", button, "BOTTOMLEFT", 0, -2)
    menu:SetSize(180, (#items * 20) + 10)
    menu:SetBackdrop({
        bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        edgeSize = 12,
        insets = { left = 3, right = 3, top = 3, bottom = 3 }
    })
    menu:Hide()

    --------------------------------------------------------
    -- Menu items
    --------------------------------------------------------
    local function SelectItem(index)
        button:SetText(items[index])
        onSelect(index, items[index])
        menu:Hide()
    end

    for i, name in ipairs(items) do
        local item = CreateFrame("Button", nil, menu)
        item:SetPoint("TOPLEFT", 5, -((i - 1) * 20) - 5)
        item:SetSize(170, 20)

        item.text = item:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        item.text:SetPoint("LEFT", 0, 0)
        item.text:SetText(name)

        item:SetScript("OnClick", function()
            SelectItem(i)
        end)

        item:SetScript("OnEnter", function(self)
            self.text:SetTextColor(1, 1, 0)
        end)

        item:SetScript("OnLeave", function(self)
            self.text:SetTextColor(1, 1, 1)
        end)
    end

    --------------------------------------------------------
    -- Toggle menu
    --------------------------------------------------------
    button:SetScript("OnClick", function()
        if menu:IsShown() then
            menu:Hide()
        else
            menu:Show()
        end
    end)

    return container
end


------------------------------------------------------------
-- Frame Mover Overlay
------------------------------------------------------------

local function CreateMover()
    local mover = CreateFrame("Frame", "IdleLinesMoverFrame", UIParent, "BackdropTemplate")
    mover:SetSize(360, 300)
    mover:SetPoint("CENTER")
    mover:SetFrameStrata("FULLSCREEN_DIALOG")
    mover:Hide()

    mover:SetBackdrop({
        bgFile = "Interface\\Buttons\\WHITE8x8",
        edgeFile = "Interface\\Buttons\\WHITE8x8",
        edgeSize = 1,
    })
    mover:SetBackdropColor(0, 0.4, 1, 0.25)
    mover:SetBackdropBorderColor(0, 0.6, 1, 0.8)

    mover.text = mover:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    mover.text:SetPoint("CENTER")
    mover.text:SetText("Drag to Move IdleLines Frame")

    mover:EnableMouse(true)
    mover:SetMovable(true)
    mover:RegisterForDrag("LeftButton")
    mover:SetScript("OnDragStart", mover.StartMoving)
    mover:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()

        local point, _, relPoint, x, y = self:GetPoint()
        ns.db.framePos = { point = point, relPoint = relPoint, x = x, y = y }

        if ns.UI and ns.UI.frame then
            local f = ns.UI.frame
            f:ClearAllPoints()
            f:SetPoint(point, UIParent, relPoint, x, y)
        end
    end)

    return mover
end

------------------------------------------------------------
-- Reset Confirmation Popup
------------------------------------------------------------

StaticPopupDialogs["IDLELINES_RESET_CONFIRM"] = {
    text = "Reset all IdleLines settings to defaults?",
    button1 = "Yes",
    button2 = "Cancel",
    OnAccept = function()
        IdleLinesDB = nil
        ReloadUI()
    end,
    timeout = 0,
    whileDead = true,
    hideOnEscape = true,
    preferredIndex = 3,
}

------------------------------------------------------------
-- Slash Commands
------------------------------------------------------------

local function RegisterSlashCommands()
    SLASH_IDLELINES1 = "/idle"

    SlashCmdList["IDLELINES"] = function(msg)
        msg = msg:lower()

        if msg == "" then
            Settings.OpenToCategory(ns.settingsCategory.ID)
            return
        end

        if msg == "test" then
            if ns.Generator and ns.UI then
                ns.UI:ShowPoem(ns.Generator:BuildPoem())
            end
            return
        end

        if msg == "hide" then
            if ns.UI then ns.UI:HidePoem() end
            return
        end

        if msg == "reset" then
            StaticPopup_Show("IDLELINES_RESET_CONFIRM")
            return
        end

        print("|cff88ccffIdleLines Commands:")
        print("|cffffff00/idle|r - Open configuration")
        print("|cffffff00/idle test|r - Show a test poem")
        print("|cffffff00/idle hide|r - Hide the poem")
        print("|cffffff00/idle reset|r - Reset settings")
    end
end

------------------------------------------------------------
-- Build Full Config Panel
------------------------------------------------------------

function Config:Build(panel)
    local content = CreateScrollContainer(panel)
    local y = -10

    --------------------------------------------------------
    -- GENERAL SECTION
    --------------------------------------------------------

    local general = CreateSection(content, "General", y)
    y = y - 40

    local enableCB = CreateCheckbox(content, "Enable IdleLines", db.enabled ~= false, function(v)
        db.enabled = v
    end)
    enableCB:SetPoint("TOPLEFT", general, "BOTTOMLEFT", 10, -10)
    y = y - 40

    local delaySlider = CreateSlider(content, "Delay Before Showing Poem (seconds)", 0, 30, 1, db.delay or 0, function(v)
        db.delay = v
    end)
    delaySlider:SetPoint("TOPLEFT", enableCB, "BOTTOMLEFT", 0, -30)
    y = y - 60

    local fadeInSlider = CreateSlider(content, "Fade-In Duration", 0, 3, 0.1, db.fadeIn or 0.3, function(v)
        db.fadeIn = v
    end)
    fadeInSlider:SetPoint("TOPLEFT", delaySlider, "BOTTOMLEFT", 0, -30)
    y = y - 60

    local fadeOutSlider = CreateSlider(content, "Fade-Out Duration", 0, 3, 0.1, db.fadeOut or 0.3, function(v)
        db.fadeOut = v
    end)
    fadeOutSlider:SetPoint("TOPLEFT", fadeInSlider, "BOTTOMLEFT", 0, -30)
    y = y - 60

    local fadeCB = CreateCheckbox(content, "Enable Fade Animations", db.fadeEnabled ~= false, function(v)
        db.fadeEnabled = v
    end)
    fadeCB:SetPoint("TOPLEFT", fadeOutSlider, "BOTTOMLEFT", 0, -20)
    y = y - 50

    --------------------------------------------------------
    -- APPEARANCE SECTION
    --------------------------------------------------------

    local appearance = CreateSection(content, "Appearance", y)
    y = y - 40

    -- Theme Dropdown
    local themeNames = {}
    local themeDescriptions = {}
    if ns.UI and ns.UI.Themes then
        for i, theme in ipairs(ns.UI.Themes) do
            themeNames[i] = theme.name
            themeDescriptions[i] = theme.description
        end
    end

    local initialThemeIndex = db.theme or 1
    
    -- Theme description text (create BEFORE dropdown so callback can access it)
    local themeDesc = content:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    themeDesc:SetPoint("TOPLEFT", appearance, "BOTTOMLEFT", 30, -60)
    themeDesc:SetWidth(400)
    themeDesc:SetJustifyH("LEFT")
    themeDesc:SetTextColor(0.7, 0.7, 0.7, 1)
    if themeDescriptions[initialThemeIndex] then
        themeDesc:SetText(themeDescriptions[initialThemeIndex])
    end
    
    local themeDropdown = CreateModernDropdown(content, "Theme", themeNames, initialThemeIndex, function(index, name)
        db.theme = index
        if ns.UI and ns.UI.ApplyTheme then
            ns.UI:ApplyTheme()
        end
        -- Update description when theme changes
        if themeDescriptions[index] then
            themeDesc:SetText(themeDescriptions[index])
        end
    end)
    themeDropdown:SetPoint("TOPLEFT", appearance, "BOTTOMLEFT", 10, -10)
    y = y - 80
    
    y = y - 30

    -- Modern dropdown
    local fontItems = { "Quest Font", "Game Font Normal", "Game Font Highlight", "Game Font Large", "Fancy Book Font", "Dialog Font" }
    local fontFiles = {
        ["Quest Font"] = "QuestFont",
        ["Game Font Normal"] = "GameFontNormal",
        ["Game Font Highlight"] = "GameFontHighlight",
        ["Game Font Large"] = "GameFontNormalLarge",
        ["Fancy Book Font"] = "Fancy22Font",
        ["Dialog Font"] = "DialogButtonNormalText",
    }

    local initialIndex = 1
    for i, name in ipairs(fontItems) do
        if db.font == fontFiles[name] then
            initialIndex = i
        end
    end

    local fontDropdown = CreateModernDropdown(content, "Font", fontItems, initialIndex, function(index, name)
        db.font = fontFiles[name]
        if ns.UI and ns.UI.frame and ns.UI.frame.text then
            ns.UI.frame.text:SetFontObject(db.font)
        end
    end)
    fontDropdown:SetPoint("TOPLEFT", themeDesc, "BOTTOMLEFT", -10, -10)
    y = y - 80

    local fontSizeSlider = CreateSlider(content, "Font Size", 8, 48, 1, db.fontSize or 18, function(v)
        db.fontSize = v
        if ns.UI then 
            ns.UI:ApplyFontSettings()
        end
    end)
    fontSizeSlider:SetPoint("TOPLEFT", fontDropdown, "BOTTOMLEFT", 12, -20)
    y = y - 60

    local alphaSlider = CreateSlider(content, "Frame Transparency (0% = Invisible, 100% = Solid)", 0, 1, 0.05, db.frameAlpha or 1.0, function(v)
        db.frameAlpha = v
        if ns.UI then ns.UI:ApplySettings() end
    end)
    alphaSlider:SetPoint("TOPLEFT", fontSizeSlider, "BOTTOMLEFT", 0, -20)
    y = y - 60

    --------------------------------------------------------
    -- ANIMATION SECTION
    --------------------------------------------------------

    local anim = CreateSection(content, "Animation", y)
    y = y - 40

    local soundCB = CreateCheckbox(content, "Enable Writing Sound", db.soundEnabled ~= false, function(v)
        db.soundEnabled = v
    end)
    soundCB:SetPoint("TOPLEFT", anim, "BOTTOMLEFT", 10, -10)
    y = y - 40

    local speedSlider = CreateSlider(content, "Letter Speed (seconds per character)", 0.01, 0.2, 0.005, db.writeSpeed or 0.05, function(v)
        db.writeSpeed = v
        if ns.UI then ns.UI:ApplySettings() end
    end)
    speedSlider:SetPoint("TOPLEFT", soundCB, "BOTTOMLEFT", 0, -30)
    y = y - 60

    --------------------------------------------------------
    -- EXPORT SECTION
    --------------------------------------------------------

    --------------------------------------------------------
    -- FRAME POSITION SECTION
    --------------------------------------------------------

    local moverSection = CreateSection(content, "Frame Position", y)
    y = y - 40

    local scaleSlider = CreateSlider(content, "Frame Scale", 0.5, 2.0, 0.05, db.frameScale or 1.0, function(v)
        db.frameScale = v
        if ns.UI then ns.UI:ApplySettings() end
    end)
    scaleSlider:SetPoint("TOPLEFT", moverSection, "BOTTOMLEFT", 10, -10)
    y = y - 60

    local unlockBtn = CreateFrame("Button", nil, content, "UIPanelButtonTemplate")
    unlockBtn:SetSize(180, 26)
    unlockBtn:SetPoint("TOPLEFT", scaleSlider, "BOTTOMLEFT", 2, -20)
    unlockBtn:SetText("Unlock Frame")

    local lockBtn = CreateFrame("Button", nil, content, "UIPanelButtonTemplate")
    lockBtn:SetSize(180, 26)
    lockBtn:SetPoint("TOPLEFT", unlockBtn, "BOTTOMLEFT", 0, -10)
    lockBtn:SetText("Lock Frame")

    local mover
    unlockBtn:SetScript("OnClick", function()
        if not mover then mover = CreateMover() end

        if ns.UI and ns.UI.frame then
            local f = ns.UI.frame
            local point, _, relPoint, x, y = f:GetPoint()
            mover:ClearAllPoints()
            mover:SetPoint(point, UIParent, relPoint, x, y)
        end

        mover:Show()
    end)

    lockBtn:SetScript("OnClick", function()
        if mover then mover:Hide() end
    end)
    y = y - 100

    --------------------------------------------------------
    -- RESET SECTION
    --------------------------------------------------------

    local reset = CreateSection(content, "Reset", y)
    y = y - 40

    local resetBtn = CreateFrame("Button", nil, content, "UIPanelButtonTemplate")
    resetBtn:SetSize(180, 26)
    resetBtn:SetPoint("TOPLEFT", reset, "BOTTOMLEFT", 10, -10)
    resetBtn:SetText("Reset to Defaults")
    resetBtn:SetScript("OnClick", function()
        StaticPopup_Show("IDLELINES_RESET_CONFIRM")
    end)
    y = y - 60

    --------------------------------------------------------
    -- Final container height
    --------------------------------------------------------

    content:SetHeight(math.abs(y) + 50)
end

------------------------------------------------------------
-- Initialization
------------------------------------------------------------

local function OnAddonLoaded()
    db = ns.db

    local panel = Config:CreatePanel()
    Config:Build(panel)

    local category = Settings.RegisterCanvasLayoutCategory(panel, "IdleLines")
    Settings.RegisterAddOnCategory(category)
    ns.settingsCategory = category

    RegisterSlashCommands()
end

local f = CreateFrame("Frame")
f:RegisterEvent("ADDON_LOADED")
f:SetScript("OnEvent", function(_, _, arg)
    if arg == addonName then
        OnAddonLoaded()
    end
end)