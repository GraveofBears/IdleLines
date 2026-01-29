--========================================================--
-- IdleLines - UI (Magical Tome Edition, Fade-In Per Line)
--========================================================--

local addonName, ns = ...

local UI = {}
ns.UI = UI

------------------------------------------------------------
-- Theme Presets (Background + Text Colors)
------------------------------------------------------------

UI.Themes = {
    {
        name = "Classic Parchment",
        description = "Warm beige paper with dark brown ink",
        bgFile = "Interface\\HELPFRAME\\Tileable-Parchment",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
        tileSize = 512,
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.82, 0.72, 0.50, 1},   -- warmer gold
        textColor = {0.20, 0.15, 0.10, 1},     -- deeper brown
        titleColor = {0.28, 0.20, 0.10, 1},    -- richer header brown
    },

    {
        name = "Faded Parchment",
        description = "Light paper with soft brown ink",
        bgFile = "Interface\\Glues\\CREDITS\\Parchment6",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
        tileSize = 512,
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.78, 0.68, 0.48, 1},   -- muted gold
        textColor = {0.30, 0.22, 0.15, 1},     -- softer brown
        titleColor = {0.30, 0.22, 0.14, 1},    -- warm header
    },

    {
        name = "Dark Sandstone",
        description = "Dark sandstone with crisp silver text",
        bgFile = "Interface\\HELPFRAME\\DarkSandstone-Tile",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tileSize = 512,
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.70, 0.70, 0.75, 1},   -- cooler silver-gray
        textColor = {0.88, 0.88, 0.95, 1},     -- strong contrast
        titleColor = {0.75, .75, 0.80, 1},    -- slightly brighter header
    },

    {
        name = "Mahogany Wood",
        description = "Rich dark red wood with golden text",
        bgFile = "Interface\\Garrison\\GarrisonUIBackground",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
        tileSize = 512,
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.92, 0.80, 0.45, 1},   -- deeper gold
        textColor = {0.95, 0.85, 0.55, 1},     -- warm parchment-gold
        titleColor = {1.0, 0.92, 0.70, 1},     -- bright header
    },

    {
        name = "Dark Marble",
        description = "Deep stone with silver text",
        bgFile = "Interface\\FrameGeneral\\UI-Background-Marble",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tileSize = 512,
        edgeSize = 32,
        bgColor = {0.28, 0.28, 0.33, 1},       -- cooler stone
        borderColor = {0.62, 0.62, 0.72, 1},   -- refined silver
        textColor = {0.88, 0.88, 0.95, 1},     -- soft silver-white
        titleColor = {0.98, 0.98, 1.0, 1},     -- bright silver header
    },

    {
        name = "Rough Stone",
        description = "Rough stone finish with silver text",
        bgFile = "Interface\\Collections\\CollectionsBackgroundTile",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        tileSize = 512,
        edgeSize = 32,
        bgColor = {0.36, 0.36, 0.40, 1},       -- lighter stone
        borderColor = {0.68, 0.68, 0.78, 1},   -- cooler silver
        textColor = {0.90, 0.90, 0.96, 1},     -- brighter silver
        titleColor = {1.0, 1.0, 1.0, 1},       -- crisp white header
    },

    ------------------------------------------------------------
    -- NEW THEME 1: Bank Ledger Parchment
    ------------------------------------------------------------
    {
        name = "Bank Ledger Parchment",
        description = "Soft parchment used in bank ledgers",
        bgFile = "Interface\\BankFrame\\Bank-Background",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
        tileSize = 512,
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.85, 0.75, 0.55, 1},   -- warm ledger gold
        textColor = {0.20, 0.14, 0.08, 1},     -- classic ink brown
        titleColor = {0.75, 0.75, 0.80, 1},    -- deeper ledger header
    },

    ------------------------------------------------------------
    -- NEW THEME 2: Mission Table Parchment
    ------------------------------------------------------------
    {
        name = "Mission Table Parchment",
        description = "Warm parchment from the Garrison mission table",
        bgFile = "Interface\\Garrison\\GarrisonMissionParchment",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
        tileSize = 512,
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.88, 0.78, 0.52, 1},   -- mission-table gold
        textColor = {0.90, 0.80, 0.50, 1},     -- warm readable brown
        titleColor = {0.95, 0.85, 0.55, 1},    -- strong parchment header
    },
}

local function GetDB()
    return ns.db or {}
end

------------------------------------------------------------
-- Create Frame
------------------------------------------------------------

function UI:CreateFrame()
    if self.frame then return self.frame end

    local db = GetDB()

    --------------------------------------------------------
    -- Main Frame (Custom Magical Tome)
    --------------------------------------------------------

    local frame = CreateFrame("Frame", "IdleLinesFrame", UIParent, "BackdropTemplate")
    self.frame = frame

    frame:SetSize(700, 650)
    frame:SetPoint("CENTER")
    frame:SetFrameStrata("DIALOG")
    frame:SetClampedToScreen(true)
    frame:Hide()

    --------------------------------------------------------
    -- Apply Theme
    --------------------------------------------------------
    
    self:ApplyTheme()

    --------------------------------------------------------
    -- Additional Parchment Overlay (for more texture)
    --------------------------------------------------------

    local parchmentOverlay = frame:CreateTexture(nil, "BACKGROUND")
    frame.parchmentOverlay = parchmentOverlay
    parchmentOverlay:SetAllPoints(true)
    parchmentOverlay:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble")
    parchmentOverlay:SetAlpha(0.2)
    parchmentOverlay:SetVertexColor(0.95, 0.87, 0.69)

    --------------------------------------------------------
    -- Optional: Vignette for aged edges
    --------------------------------------------------------

    local vignette = frame:CreateTexture(nil, "BORDER")
    frame.vignette = vignette
    vignette:SetAllPoints(true)
    vignette:SetTexture("Interface\\GLUES\\CHARACTERCREATE\\UI-CharacterCreate-Factions")
    vignette:SetTexCoord(0, 1, 0.5, 1)
    vignette:SetAlpha(0.08)
    vignette:SetVertexColor(0.4, 0.3, 0.2)

    --------------------------------------------------------
    -- Title
    --------------------------------------------------------

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
    frame.title = title
    title:SetPoint("TOP", 0, -20)
    title:SetText("IdleLines")

    --------------------------------------------------------
    -- Close Button
    --------------------------------------------------------

    local close = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
    frame.closeButton = close
    close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -6, -6)
    close:SetScale(1.2)

    close:SetScript("OnClick", function()
        UI:HidePoem()
    end)

    --------------------------------------------------------
    -- Export Button (bottom of frame)
    --------------------------------------------------------

    local exportBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
    frame.exportButton = exportBtn
    exportBtn:SetSize(120, 24)
    exportBtn:SetPoint("BOTTOM", frame, "BOTTOM", 0, 10)
    exportBtn:SetText("Copy Poem")
    
    exportBtn:SetScript("OnClick", function()
        UI:ExportCurrentPoem()
    end)

    --------------------------------------------------------
    -- Text Container
    --------------------------------------------------------

    local container = CreateFrame("Frame", nil, frame)
    frame.container = container
    container:SetPoint("TOPLEFT", 35, -55)
    container:SetPoint("BOTTOMRIGHT", -35, 30)
    container:SetSize(1, 1)

    --------------------------------------------------------
    -- Poem Text
    --------------------------------------------------------

    local text = container:CreateFontString(nil, "OVERLAY", "QuestFont")
    frame.text = text

    text:SetPoint("TOPLEFT", 0, 0)
    text:SetPoint("TOPRIGHT", 0, 0)
    text:SetJustifyH("CENTER")
    text:SetJustifyV("TOP")
    text:SetWordWrap(true)
    text:SetText("")
    text:SetAlpha(1)
    
    -- Add shadow for readability
    text:SetShadowOffset(1, -1)
    text:SetShadowColor(0, 0, 0, 0.6)

    --------------------------------------------------------
    -- Scaling
    --------------------------------------------------------

    frame:SetScale(db.frameScale or 1.0)

    --------------------------------------------------------
    -- Movable Frame
    --------------------------------------------------------

    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:RegisterForDrag("LeftButton")

    frame:SetScript("OnDragStart", frame.StartMoving)

    frame:SetScript("OnDragStop", function(self)
        self:StopMovingOrSizing()

        local point, _, relPoint, x, y = self:GetPoint()
        ns.db.framePos = {
            point = point,
            relPoint = relPoint,
            x = x,
            y = y,
        }
    end)

    return frame
end

------------------------------------------------------------
-- Apply Theme
------------------------------------------------------------

function UI:ApplyTheme()
    if not self.frame then return end
    
    local frame = self.frame
    local db = GetDB()
    
    -- Get theme index (default to 1 - Classic Parchment)
    local themeIndex = db.theme or 1
    local theme = self.Themes[themeIndex]
    
    if not theme then
        theme = self.Themes[1]
    end
    
    -- Apply backdrop
    frame:SetBackdrop({
        bgFile   = theme.bgFile,
        edgeFile = theme.edgeFile,
        tile     = true,
        tileSize = theme.tileSize,
        edgeSize = theme.edgeSize,
        insets   = { left = 11, right = 12, top = 12, bottom = 11 },
    })
    
    -- Apply colors (with full opacity - transparency applied later in ApplySettings)
    local bgColor = theme.bgColor
    frame:SetBackdropColor(bgColor[1], bgColor[2], bgColor[3], 1.0)
    
    local borderColor = theme.borderColor
    frame:SetBackdropBorderColor(borderColor[1], borderColor[2], borderColor[3], 1.0)
    
    -- Apply title color
    if frame.title then
        frame.title:SetTextColor(unpack(theme.titleColor))
    end
    
    -- Apply text color (static text)
    if frame.text then
        frame.text:SetTextColor(unpack(theme.textColor))
    end
    
    -- Store theme for FadeInLines to use
    self.currentTheme = theme
end

------------------------------------------------------------
-- Fade-In Per Line Logic
------------------------------------------------------------

function UI:FadeInLines(poem)
    local frame = self.frame or self:CreateFrame()
    local container = frame.container

    -- Clear old lines
    if container.lines then
        for _, fs in ipairs(container.lines) do
            fs:Hide()
        end
    end

    container.lines = {}

    -- Measurement FontString (hidden)
    if not frame.measureFS then
        frame.measureFS = container:CreateFontString(nil, "OVERLAY", "QuestFont")
        frame.measureFS:Hide()
    end
    
    -- Apply current font settings to measurement FS
    local db = GetDB()
    local fontObjectName = db.font or "QuestFont"
    local fontSize = db.fontSize or 18
    
    -- Get the font object and extract font file
    local fontObj = _G[fontObjectName] or QuestFont
    local fontFile, _, fontFlags = fontObj:GetFont()
    
    frame.measureFS:SetFont(fontFile, fontSize, fontFlags)

    -- Split poem into lines
    local lines = {}
    for line in poem:gmatch("[^\n]+") do
        table.insert(lines, line)
    end

    local yOffset = 0
    local delay = 0

    for _, line in ipairs(lines) do

        -- Measure height using hidden FS
        frame.measureFS:SetText(line)
        local h = frame.measureFS:GetStringHeight()

        -- Create visible FS
        local fs = container:CreateFontString(nil, "OVERLAY", "QuestFont")
        fs:SetPoint("TOPLEFT", 0, -yOffset)
        fs:SetPoint("TOPRIGHT", 0, -yOffset)
        fs:SetJustifyH("CENTER")
        fs:SetJustifyV("TOP")
        fs:SetWordWrap(true)
        fs:SetText(line)
        
        -- Apply font settings with proper font file
        fs:SetFont(fontFile, fontSize, fontFlags)
        
        -- Apply theme text color
        local theme = self.currentTheme or self.Themes[1]
        fs:SetTextColor(unpack(theme.textColor))
        fs:SetAlpha(0)
        
        -- Add shadow for readability
        fs:SetShadowOffset(1, -1)
        fs:SetShadowColor(0, 0, 0, 0.6)

        table.insert(container.lines, fs)

        -- Fade in this line only
        C_Timer.After(delay, function()
            UIFrameFadeIn(fs, 0.6, 0, 1)
            -- Ensure text stays fully opaque after fade
            C_Timer.After(0.6, function()
                fs:SetAlpha(1.0)
            end)
        end)

        yOffset = yOffset + h + 4
        delay = delay + 0.55
    end
end

------------------------------------------------------------
-- Public: ShowPoem
------------------------------------------------------------

function UI:ShowPoem(poem, title)
    if not ns:IsEnabled() then return end

    local frame = self.frame or self:CreateFrame()

    -- Cancel any pending fade-out from a previous hide
    if self.fadeOutTimer then
        self.fadeOutTimer:Cancel()
        self.fadeOutTimer = nil
    end

    -- Ensure frame is fully visible
    frame:SetAlpha(1)
    frame:Show()

    -- Store current poem and title for export
    frame.currentPoem = poem
    frame.currentTitle = title or "Untitled"

    -- Update title if provided
    if title and frame.title then
        frame.title:SetText(title)
    end

    -- Re-enable mouse for dragging
    frame:EnableMouse(true)

    self:FadeInLines(poem)
end

------------------------------------------------------------
-- Public: HidePoem
------------------------------------------------------------

function UI:HidePoem()
    if not self.frame then return end
    local frame = self.frame
    local db = GetDB()

    frame:EnableMouse(false)
    
    -- Reset AFK state tracker to prevent re-triggering
    if ns.events then
        ns.events.isCurrentlyAFK = false
    end

    -- Cancel any existing fade-out timer
    if self.fadeOutTimer then
        self.fadeOutTimer:Cancel()
        self.fadeOutTimer = nil
    end

    if db.fadeEnabled ~= false and (db.fadeOut or 0) > 0 then
        UIFrameFadeOut(frame, db.fadeOut, frame:GetAlpha(), 0)

        self.fadeOutTimer = C_Timer.NewTimer(db.fadeOut, function()
            frame:Hide()
            frame:SetAlpha(1) -- IMPORTANT: reset alpha
            self.fadeOutTimer = nil
        end)
    else
        frame:Hide()
        frame:SetAlpha(1)
    end
end

------------------------------------------------------------
-- Public: ApplySettings
------------------------------------------------------------

function UI:ApplySettings()
    if not self.frame then return end
    local frame = self.frame
    local db = GetDB()

    frame:SetScale(db.frameScale or 1.0)
    self:ApplyTheme()
    self:ApplyFontSettings()
    
    -- Apply transparency to specific elements only
    local alpha = db.frameAlpha or 1.0
    
    -- Apply alpha to backdrop by adjusting backdrop alpha channel
    local r, g, b = frame:GetBackdropColor()
    frame:SetBackdropColor(r, g, b, alpha)
    
    local br, bg, bb = frame:GetBackdropBorderColor()
    frame:SetBackdropBorderColor(br, bg, bb, alpha)
    
    -- Apply alpha to overlays
    if frame.parchmentOverlay then
        frame.parchmentOverlay:SetAlpha(0.2 * alpha)
    end
    if frame.vignette then
        frame.vignette:SetAlpha(0.08 * alpha)
    end
    
    -- Apply alpha to buttons
    if frame.closeButton then
        frame.closeButton:SetAlpha(alpha)
    end
    if frame.exportButton then
        frame.exportButton:SetAlpha(alpha)
    end
    
    -- Text always stays fully opaque
    if frame.title then
        frame.title:SetAlpha(1.0)
    end
    
    -- Container lines stay fully opaque
    if frame.container and frame.container.lines then
        for _, fs in ipairs(frame.container.lines) do
            fs:SetAlpha(1.0)
        end
    end
end

------------------------------------------------------------
-- Public: ApplyFontSettings
------------------------------------------------------------

function UI:ApplyFontSettings()
    if not self.frame then return end
    local frame = self.frame
    local db = GetDB()
    
    local fontObjectName = db.font or "QuestFont"
    local fontSize = db.fontSize or 18
    
    -- Get the font object
    local fontObject = _G[fontObjectName]
    if not fontObject then
        fontObject = QuestFont -- Fallback
    end
    
    -- Get font file, size, and flags from the font object
    local fontFile, _, fontFlags = fontObject:GetFont()
    
    -- Apply to all dynamic poem lines
    if frame.container and frame.container.lines then
        for _, fs in ipairs(frame.container.lines) do
            fs:SetFont(fontFile, fontSize, fontFlags)
        end
    end
    
    -- Apply to measurement font string
    if frame.measureFS then
        frame.measureFS:SetFont(fontFile, fontSize, fontFlags)
    end
end

------------------------------------------------------------
-- Public: Export Current Poem
------------------------------------------------------------

function UI:ExportCurrentPoem()
    if not self.frame then return end
    
    local poem = self.frame.currentPoem or "No poem to export"
    local title = self.frame.currentTitle or "Untitled"
    
    -- Create export popup if it doesn't exist
    if not self.exportPopup then
        self.exportPopup = CreateFrame("Frame", "IdleLinesExportPopup", UIParent, "BasicFrameTemplateWithInset")
        local popup = self.exportPopup
        
        popup:SetSize(500, 400)
        popup:SetPoint("CENTER")
        popup:SetFrameStrata("DIALOG")
        popup:SetClampedToScreen(true)
        popup:Hide()
        
        popup.TitleText:SetText("Copy Poem")
        
        -- Scroll frame
        local scroll = CreateFrame("ScrollFrame", nil, popup, "UIPanelScrollFrameTemplate")
        scroll:SetPoint("TOPLEFT", 20, -40)
        scroll:SetPoint("BOTTOMRIGHT", -40, 40)
        
        -- Edit box
        local editBox = CreateFrame("EditBox", nil, scroll)
        editBox:SetMultiLine(true)
        editBox:SetFontObject(ChatFontNormal)
        editBox:SetWidth(420)
        editBox:SetAutoFocus(true)
        editBox:SetScript("OnEscapePressed", function() popup:Hide() end)
        
        scroll:SetScrollChild(editBox)
        popup.editBox = editBox
        
        -- Close button
        local close = CreateFrame("Button", nil, popup, "UIPanelButtonTemplate")
        close:SetSize(120, 24)
        close:SetPoint("BOTTOM", 0, 10)
        close:SetText("Close")
        close:SetScript("OnClick", function() popup:Hide() end)
    end
    
    -- Format with title at top
    local fullText = title .. "\n" .. string.rep("=", #title) .. "\n\n" .. poem
    
    self.exportPopup.editBox:SetText(fullText)
    self.exportPopup.editBox:HighlightText()
    self.exportPopup:Show()
    self.exportPopup.editBox:SetFocus()
end

------------------------------------------------------------
-- Module Init Hook
------------------------------------------------------------

function UI:OnInit()
    self:CreateFrame()
    self:ApplySettings()
    ns:Debug("UI module initialized.")
end