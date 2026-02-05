--========================================================--
-- IdleLines - UI 
--========================================================--

local addonName, ns = ...

local UI = {}
ns.UI = UI

------------------------------------------------------------
-- Theme Presets 
------------------------------------------------------------

UI.Themes = {

    ------------------------------------------------------------
    -- NIGHT FAE
    ------------------------------------------------------------
    {
        name = "Night Fae",
        description = "Soft blue parchment with fae magic tones",
        useAtlas = true,
        atlasName = "UI-Frame-NightFae-CardParchmentWider",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.55, 0.75, 1.0, 1},
        textColor = {0.65, 0.80, 1.00, 1},
        titleColor = {0.20, 0.30, 0.50, 1},
        outlineColor = {1, 1, 1, 1},
    },

    ------------------------------------------------------------
    -- KYRIAN
    ------------------------------------------------------------
    {
        name = "Kyrian",
        description = "Clean ascended parchment with blue-gold trim",
        useAtlas = true,
        atlasName = "UI-Frame-Kyrian-CardParchmentWider",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.70, 0.85, 1.0, 1},
        textColor = {0.20, 0.25, 0.35, 1},
        titleColor = {0.35, 0.45, 0.60, 1},
        outlineColor = {1, 1, 1, 1},
    },

    ------------------------------------------------------------
    -- VENTHYR
    ------------------------------------------------------------
    {
        name = "Venthyr",
        description = "Dark gothic parchment with crimson accents",
        useAtlas = true,
        atlasName = "UI-Frame-Venthyr-CardParchmentWider",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.55, 0.10, 0.10, 1},
        textColor = {1.00, 0.25, 0.25, 1},
        titleColor = {0.60, 0.10, 0.10, 1},
        outlineColor = {0.1, 0.0, 0.0, 1},
    },

    ------------------------------------------------------------
    -- NECROLORD
    ------------------------------------------------------------
    {
        name = "Necrolord",
        description = "Bone-forged parchment with plague-green accents",
        useAtlas = true,
        atlasName = "UI-Frame-Necrolord-CardParchmentWider",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.45, 0.75, 0.45, 1},
        textColor = {0.35, 0.55, 0.35, 1},
        titleColor = {0.35, 0.55, 0.35, 1},
        outlineColor = {0.1, 0.0, 0.0, 1},
    },

    ------------------------------------------------------------
    -- MECHAGON
    ------------------------------------------------------------
    {
        name = "Mechagon",
        description = "Clean mechanical parchment with steel trim",
        useAtlas = true,
        atlasName = "UI-Frame-Mechagon-CardParchmentWider",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.60, 0.70, 0.80, 1},
        textColor = {0.20, 0.25, 0.30, 1},
        titleColor = {0.45, 0.55, 0.65, 1},
        outlineColor = {1, 1, 1, 1},
    },

    ------------------------------------------------------------
    -- MARINE
    ------------------------------------------------------------
    {
        name = "Marine",
        description = "Stormy blue parchment with nautical trim",
        useAtlas = true,
        atlasName = "UI-Frame-Marine-CardParchmentWider",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.40, 0.55, 0.80, 1},
        textColor = {0.10, 0.15, 0.25, 1},
        titleColor = {0.70, 0.70, 0.70, 1},
        outlineColor = {1, 1, 1, 1},
    },

    ------------------------------------------------------------
    -- HORDE
    ------------------------------------------------------------
    {
        name = "Horde",
        description = "Rugged red parchment with iron trim",
        useAtlas = true,
        atlasName = "UI-Frame-Horde-CardParchmentWider",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.60, 0.10, 0.10, 1},
        textColor = {0.25, 0.20, 0.15, 1},
        titleColor = {0.50, 0.15, 0.15, 1},
        outlineColor = {1, 1, 1, 1},
    },

    ------------------------------------------------------------
    -- ALLIANCE
    ------------------------------------------------------------
    {
        name = "Alliance",
        description = "Royal parchment with blue and gold trim",
		useAtlas = true,
        atlasName = "UI-Frame-Alliance-CardParchmentWider",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Gold-Border",
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.80, 0.70, 0.30, 1},
        textColor = {0.20, 0.25, 0.40, 1},
        titleColor = {0.93, 0.78, 0.23, 1},
        outlineColor = {1, 1, 1, 1},
    },

    ------------------------------------------------------------
    -- NEUTRAL
    ------------------------------------------------------------
    {
        name = "Neutral",
        description = "Simple parchment with soft gray trim",
        useAtlas = true,
        atlasName = "UI-Frame-Neutral-CardParchmentWider",
        edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
        edgeSize = 32,
        bgColor = {1, 1, 1, 1},
        borderColor = {0.55, 0.55, 0.55, 1},
        textColor = {0.00, 0.00, 0.00, 1},
        titleColor = {0.30, 0.30, 0.30, 1},
        outlineColor = {1, 1, 1, 1},
    },
	
	------------------------------------------------------------
	-- Dark
	------------------------------------------------------------
	{
		name = "Dark",
		description = "Simple dark theme with soft gray trim",
		useAtlas = true,
		atlasName = "GarrMissionLocation-Maw-bg-02",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		edgeSize = 32,
		bgColor = {1, 1, 1, 1},
		borderColor = {0.40, 0.40, 0.40, 1},
		textColor = {0.70, 0.70, 0.70, 1},
		titleColor = {0.85, 0.85, 0.85, 1},
		outlineColor = {0.05, 0.05, 0.05, 1},
	},

	------------------------------------------------------------
	-- DeathKnight
	------------------------------------------------------------
	{
		name = "DeathKnight",
		description = "Frozen DeathKnight style theme with light blue trim",
		useAtlas = true,
		atlasName = "Artifacts-DeathKnightFrost-BG",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		edgeSize = 32,
		bgColor = {1, 1, 1, 1},
		borderColor = {0.35, 0.55, 0.80, 1},
		textColor = {0.40, 0.70, 1.00, 1},
		titleColor = {0.60, 0.80, 1.00, 1},
		outlineColor = {0.05, 0.05, 0.05, 1},
	},

	------------------------------------------------------------
	-- DemonHunter
	------------------------------------------------------------
	{
		name = "DemonHunter",
		description = "A DemonHunter style theme with purple accents",
		useAtlas = true,
		atlasName = "Artifacts-DemonHunter-BG",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		edgeSize = 32,
		bgColor = {1, 1, 1, 1},
		borderColor = {0.40, 0.85, 0.55, 1},
		textColor = {0.55, 0.45, 0.75, 1},
		titleColor = {0.75, 0.25, 0.95, 1},
		outlineColor = {0.05, 0.05, 0.05, 1},
	},

	------------------------------------------------------------
	-- Druid
	------------------------------------------------------------
	{
		name = "Druid",
		description = "A Druid style theme with green accents",
		useAtlas = true,
		atlasName = "Artifacts-Druid-BG",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		edgeSize = 32,
		bgColor = {1, 1, 1, 1},
		borderColor = {0.80, 0.55, 0.20, 1},
		textColor = {0.40, 0.70, 0.55, 1},
		titleColor = {0.60, 0.90, 0.60, 1},
		outlineColor = {0.05, 0.05, 0.05, 1},
	},

	------------------------------------------------------------
	-- Hunter
	------------------------------------------------------------
	{
		name = "Hunter",
		description = "A Hunter style theme with gold accents",
		useAtlas = true,
		atlasName = "Artifacts-Hunter-BG",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		edgeSize = 32,
		bgColor = {1, 1, 1, 1},
		borderColor = {0.40, 0.65, 0.30, 1},
		textColor = {0.70, 0.55, 0.40, 1},
		titleColor = {0.67, 0.83, 0.45, 1},
		outlineColor = {0.05, 0.05, 0.05, 1},
	},

	------------------------------------------------------------
	-- Mage
	------------------------------------------------------------
	{
		name = "Mage",
		description = "A Mage style theme with light blue accents",
		useAtlas = true,
		atlasName = "Artifacts-MageArcane-BG",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		edgeSize = 32,
		bgColor = {1, 1, 1, 1},
		borderColor = {0.30, 0.60, 0.85, 1},
		textColor = {0.65, 0.80, 1.00, 1},
		titleColor = {0.41, 0.80, 0.94, 1},
		outlineColor = {0.05, 0.05, 0.05, 1},
	},

	------------------------------------------------------------
	-- Monk
	------------------------------------------------------------
	{
		name = "Monk",
		description = "A Monk style theme with golden accents",
		useAtlas = true,
		atlasName = "Artifacts-Monk-BG",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		edgeSize = 32,
		bgColor = {1, 1, 1, 1},
		borderColor = {0.45, 0.75, 0.55, 1},
		textColor = {0.12, 0.14, 0.12, 1},
		titleColor = {0.00, 1.00, 0.59, 1},
		outlineColor = {0.05, 0.05, 0.05, 1},
	},

	------------------------------------------------------------
	-- Paladin
	------------------------------------------------------------
	{
		name = "Paladin",
		description = "A Paladin style theme with gold accents",
		useAtlas = true,
		atlasName = "Artifacts-Paladin-BG",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		edgeSize = 32,
		bgColor = {1, 1, 1, 1},
		borderColor = {0.85, 0.70, 0.30, 1},
		textColor = {0.90, 0.85, 0.75, 1},
		titleColor = {0.95, 0.92, 0.85, 1},
		outlineColor = {0.05, 0.05, 0.05, 1},
	},

	------------------------------------------------------------
	-- Priest
	------------------------------------------------------------
	{
		name = "Priest",
		description = "A Priest style theme with white accents",
		useAtlas = true,
		atlasName = "Artifacts-Priest-BG",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		edgeSize = 32,
		bgColor = {1, 1, 1, 1},
		borderColor = {0.85, 0.85, 0.85, 1},
		textColor = {0.70, 0.70, 0.70, 1},
		titleColor = {1.00, 1.00, 1.00, 1},
		outlineColor = {0.05, 0.05, 0.05, 1},
	},

	------------------------------------------------------------
	-- ShadowPriest
	------------------------------------------------------------
	{
		name = "ShadowPriest",
		description = "A ShadowPriest style theme with neon purple accents",
		useAtlas = true,
		atlasName = "Artifacts-PriestShadow-BG",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		edgeSize = 32,
		bgColor = {1, 1, 1, 1},
		borderColor = {0.55, 0.30, 0.75, 1},
		textColor = {0.70, 0.70, 0.70, 1},
		titleColor = {0.80, 0.45, 1.00, 1},
		outlineColor = {0.05, 0.05, 0.05, 1},
	},

	------------------------------------------------------------
	-- Rogue
	------------------------------------------------------------
	{
		name = "Rogue",
		description = "A Rogue style theme with crimson accents",
		useAtlas = true,
		atlasName = "Artifacts-Rogue-BG",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		edgeSize = 32,
		bgColor = {1, 1, 1, 1},
		borderColor = {0.70, 0.20, 0.20, 1},
		textColor = {0.85, 0.60, 0.20, 1},
		titleColor = {1.00, 0.24, 0.24, 1},
		outlineColor = {0.05, 0.05, 0.05, 1},
	},

	------------------------------------------------------------
	-- Shaman
	------------------------------------------------------------
	{
		name = "Shaman",
		description = "A Shaman style theme with light blue accents",
		useAtlas = true,
		atlasName = "Artifacts-Shaman-BG",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		edgeSize = 32,
		bgColor = {1, 1, 1, 1},
		borderColor = {0.20, 0.45, 0.85, 1},
		textColor = {0.40, 0.70, 1.00, 1},
		titleColor = {0.65, 0.80, 1.00, 1},
		outlineColor = {0.05, 0.05, 0.05, 1},
	},

	------------------------------------------------------------
	-- Warlock
	------------------------------------------------------------
	{
		name = "Warlock",
		description = "A Warlock style theme with neon green accents",
		useAtlas = true,
		atlasName = "Artifacts-Warlock-BG",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		edgeSize = 32,
		bgColor = {1, 1, 1, 1},
		borderColor = {0.50, 0.25, 0.65, 1},
		textColor = {0.20, 0.80, 0.20, 1},
		titleColor = {0.60, 0.90, 0.60, 1},
		outlineColor = {0.05, 0.05, 0.05, 1},
	},

	------------------------------------------------------------
	-- Warrior
	------------------------------------------------------------
	{
		name = "Warrior",
		description = "A Warrior style theme with bronze accents",
		useAtlas = true,
		atlasName = "Artifacts-Warrior-BG",
		edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
		edgeSize = 32,
		bgColor = {1, 1, 1, 1},
		borderColor = {0.62, 0.46, 0.28, 1},
		textColor = {0.90, 0.55, 0.20, 1},
		titleColor = {1.00, 0.35, 0.05, 1},
		outlineColor = {0.05, 0.05, 0.05, 1},
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
    -- Main Frame 
    --------------------------------------------------------

    local frame = CreateFrame("Frame", "IdleLinesFrame", WorldFrame, "BackdropTemplate")
    self.frame = frame

    frame:SetSize(700, 650)
    frame:SetPoint("CENTER", UIParent, "CENTER")
    frame:SetFrameStrata("FULLSCREEN_DIALOG")
    frame:SetFrameLevel(10000)
    frame:SetClampedToScreen(true)
    
    -- WorldFrame doesn't have UI scaling, so we need to apply it manually
    frame:SetScale(UIParent:GetEffectiveScale())
    
    frame:Hide()

    --------------------------------------------------------
    -- Background Texture for Texture Atlas
    --------------------------------------------------------
    
    local bg = frame:CreateTexture(nil, "BACKGROUND")
    frame.bgTexture = bg
    bg:SetAllPoints(true)
    bg:Hide()

    --------------------------------------------------------
    -- Apply Theme
    --------------------------------------------------------
    
    self:ApplyTheme()

    --------------------------------------------------------
    -- Additional Parchment Overlay 
    --------------------------------------------------------

    local parchmentOverlay = frame:CreateTexture(nil, "BACKGROUND", nil, 1)
    frame.parchmentOverlay = parchmentOverlay
    parchmentOverlay:SetAllPoints(true)
    parchmentOverlay:SetTexture("Interface\\FrameGeneral\\UI-Background-Marble")
    parchmentOverlay:SetAlpha(0.1)
    parchmentOverlay:SetVertexColor(0.95, 0.87, 0.69)

    --------------------------------------------------------
    --  Vignette for aged edges
    --------------------------------------------------------

    local vignette = frame:CreateTexture(nil, "BORDER")
    frame.vignette = vignette
    vignette:SetAllPoints(true)
    vignette:SetTexture("Interface\\GLUES\\CHARACTERCREATE\\UI-CharacterCreate-Factions")
    vignette:SetTexCoord(0, 1, 0.5, 1)
    vignette:SetAlpha(0.05)
    vignette:SetVertexColor(0.4, 0.3, 0.2)

    --------------------------------------------------------
    -- Title
    --------------------------------------------------------

    local title = frame:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
    frame.title = title
    title:SetPoint("TOP", 0, -50)
    title:SetText("IdleLines")

    --------------------------------------------------------
    -- Close Button 
    --------------------------------------------------------

    local close = CreateFrame("Button", nil, UIParent)
    frame.closeButton = close
    close:SetSize(32, 32)
    close:SetFrameStrata("FULLSCREEN_DIALOG")
    close:SetFrameLevel(10010)
    
    -- Make button ignore parent's alpha/scale so it shows even when UIParent is hidden
    close:SetIgnoreParentAlpha(true)
    close:SetIgnoreParentScale(true)
    
    -- Position relative to main frame 
    close:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -6, -6)
    
    -- Enable mouse interaction
    close:EnableMouse(true)
    close:RegisterForClicks("AnyUp")
    
    -- Set normal texture
    close:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
    close:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
    close:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight", "ADD")
    
    close:SetScript("OnClick", function()
        UI:HidePoem()
    end)
    
    -- Debug to see if button is being clicked
    close:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText("Close")
        GameTooltip:Show()
    end)
    close:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    
    close:Hide()  -- Hidden by default

    --------------------------------------------------------
    -- Export Button 
    --------------------------------------------------------

    local exportBtn = CreateFrame("Button", nil, UIParent)
    frame.exportButton = exportBtn
    exportBtn:SetSize(120, 24)
    exportBtn:SetFrameStrata("FULLSCREEN_DIALOG")
    exportBtn:SetFrameLevel(10010)
    
    -- Make button ignore parent's alpha/scale so it shows even when UIParent is hidden
    exportBtn:SetIgnoreParentAlpha(true)
    exportBtn:SetIgnoreParentScale(true)
    
    -- Position relative to main frame (will update in ShowPoem)
    exportBtn:SetPoint("BOTTOM", frame, "BOTTOM", 0, 10)
    
    -- Enable mouse interaction
    exportBtn:EnableMouse(true)
    exportBtn:RegisterForClicks("AnyUp")
    
    -- Create button textures
    exportBtn:SetNormalTexture("Interface\\Buttons\\UI-Panel-Button-Up")
    exportBtn:SetPushedTexture("Interface\\Buttons\\UI-Panel-Button-Down")
    exportBtn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-Button-Highlight", "ADD")
    
    -- Get the textures and set them to stretch
    local normalTex = exportBtn:GetNormalTexture()
    local pushedTex = exportBtn:GetPushedTexture()
    local highlightTex = exportBtn:GetHighlightTexture()
    
    normalTex:SetTexCoord(0, 0.625, 0, 0.6875)
    pushedTex:SetTexCoord(0, 0.625, 0, 0.6875)
    highlightTex:SetTexCoord(0, 0.625, 0, 0.6875)
    
    -- Add text
    exportBtn.text = exportBtn:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    exportBtn.text:SetPoint("CENTER")
    exportBtn.text:SetText("Copy Poem")
    
    exportBtn:SetScript("OnClick", function()
        UI:ExportCurrentPoem()
    end)
    
    -- Debug tooltip
    exportBtn:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_TOP")
        GameTooltip:SetText("Copy poem to clipboard")
        GameTooltip:Show()
    end)
    exportBtn:SetScript("OnLeave", function()
        GameTooltip:Hide()
    end)
    
    exportBtn:Hide()  -- Hidden by default

    --------------------------------------------------------
    -- Text Container
    --------------------------------------------------------

    local container = CreateFrame("Frame", nil, frame)
    frame.container = container
    container:SetPoint("TOPLEFT", 35, -110)
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

    local scaleX = db.frameScaleX or 0.70
    local scaleY = db.frameScaleY or 0.70
    frame:SetScale(1.0)  -- Reset to 1.0 base
    
    -- Store original size
    frame.baseWidth = 700
    frame.baseHeight = 650
    
    -- Apply separate scaling
    frame:SetSize(frame.baseWidth * scaleX, frame.baseHeight * scaleY)

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
    
    -- Get theme index (default to 1)
    local themeIndex = db.theme or 1
    local theme = self.Themes[themeIndex]
    
    if not theme then
        theme = self.Themes[1]
        themeIndex = 1
    end
    
    -- Check if this theme has color overrides in the DB
    local themeOverrides = db.themeOverrides and db.themeOverrides[themeIndex]
    
    -- Use overrides if they exist, otherwise use theme defaults
    local bgColor = (themeOverrides and themeOverrides.bgColor) or theme.bgColor
    local borderColor = (themeOverrides and themeOverrides.borderColor) or theme.borderColor
    local textColor = (themeOverrides and themeOverrides.textColor) or theme.textColor
    local titleColor = (themeOverrides and themeOverrides.titleColor) or theme.titleColor
    local outlineColor = (themeOverrides and themeOverrides.outlineColor) or theme.outlineColor or {0, 0, 0, 1}
    
    -- Handle atlas-based themes
    if theme.useAtlas and frame.bgTexture then
        -- Use atlas texture as background
        frame.bgTexture:SetAtlas(theme.atlasName, true)
        frame.bgTexture:SetVertexColor(bgColor[1], bgColor[2], bgColor[3], bgColor[4] or 1)
        frame.bgTexture:Show()
        
        -- Set up border only
        frame:SetBackdrop({
            edgeFile = theme.edgeFile,
            edgeSize = theme.edgeSize,
            insets = { left = 11, right = 12, top = 12, bottom = 11 },
        })
        frame:SetBackdropBorderColor(borderColor[1], borderColor[2], borderColor[3], 1.0)
    else
        -- Traditional backdrop-based theme
        if frame.bgTexture then
            frame.bgTexture:Hide()
        end
        
        frame:SetBackdrop({
            bgFile   = theme.bgFile,
            edgeFile = theme.edgeFile,
            tile     = true,
            tileSize = theme.tileSize,
            edgeSize = theme.edgeSize,
            insets   = { left = 11, right = 12, top = 12, bottom = 11 },
        })
        
        frame:SetBackdropColor(bgColor[1], bgColor[2], bgColor[3], 1.0)
        frame:SetBackdropBorderColor(borderColor[1], borderColor[2], borderColor[3], 1.0)
    end
    
    -- Apply title color
    if frame.title then
        frame.title:SetTextColor(unpack(titleColor))
    end
    
    -- Apply text color (static text)
    if frame.text then
        frame.text:SetTextColor(unpack(textColor))
    end
    
    -- Store theme and colors for FadeInLines to use
    self.currentTheme = theme
    self.currentTextColor = textColor
    self.currentOutlineColor = outlineColor
    
    -- Update existing poem lines if a poem is currently displayed
    self:UpdatePoemColors()
end

------------------------------------------------------------
-- Fade In Per Line Logic
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
    local fontSetting = db.font or "Fonts\\FRIZQT__.TTF"
    local fontSize = db.fontSize or 18
    
    local fontFile, fontFlags
    
    -- Check if it's a file path 
    if fontSetting:match("[/\\]") then
        -- It's a font file path
        fontFile = fontSetting
        fontFlags = "OUTLINE"
    else
        -- It's a font object name
        local fontObj = _G[fontSetting]
        if not fontObj then
            fontFile = "Fonts\\FRIZQT__.TTF" -- Fallback
            fontFlags = "OUTLINE"
        else
            fontFile, _, fontFlags = fontObj:GetFont()
        end
    end
    
    frame.measureFS:SetFont(fontFile, fontSize, fontFlags)

    -- Split poem into lines
    local lines = {}
    for line in poem:gmatch("[^\n]+") do
        table.insert(lines, line)
    end

    local yOffset = 0
    local delay = 0

    for _, line in ipairs(lines) do

        -- Create visible FS first
        local fs = container:CreateFontString(nil, "OVERLAY")
        fs:SetPoint("TOPLEFT", 0, -yOffset)
        fs:SetPoint("TOPRIGHT", 0, -yOffset)
        fs:SetJustifyH("CENTER")
        fs:SetJustifyV("TOP")
        fs:SetWordWrap(true)
        
        -- Apply font settings with proper font file FIRST (before SetText)
        fs:SetFont(fontFile, fontSize, fontFlags)
        
        -- NOW set text after font is applied
        fs:SetText(line)
        
        -- NOW measure height after font and text are both set
        local h = fs:GetStringHeight()
        
        -- Apply text color
        local textColor = self.currentTextColor or {0.20, 0.15, 0.10, 1}
        fs:SetTextColor(unpack(textColor))
        fs:SetAlpha(0)
        
        -- Apply outline/shadow
        local outlineColor = self.currentOutlineColor or {0, 0, 0, 1}
        fs:SetShadowOffset(1, -1)
        fs:SetShadowColor(outlineColor[1], outlineColor[2], outlineColor[3], 0.6)

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
-- Public: Update Poem Colors 
------------------------------------------------------------

function UI:UpdatePoemColors()
    if not self.frame or not self.frame.container or not self.frame.container.lines then
        return
    end
    
    local textColor = self.currentTextColor or {0.20, 0.15, 0.10, 1}
    local outlineColor = self.currentOutlineColor or {0, 0, 0, 1}
    
    -- Update all existing poem lines
    for _, fs in ipairs(self.frame.container.lines) do
        fs:SetTextColor(unpack(textColor))
        fs:SetShadowColor(outlineColor[1], outlineColor[2], outlineColor[3], 0.6)
    end
end

------------------------------------------------------------
-- Public: ShowPoem
------------------------------------------------------------

function UI:ShowPoem(poem, title)
    if not ns:IsEnabled() then return end
    
    -- Prevent duplicate generation
    if self.isGenerating then
        return
    end
    self.isGenerating = true

    local frame = self.frame or self:CreateFrame()

    -- Cancel any pending fade-out from a previous hide
    if self.fadeOutTimer then
        self.fadeOutTimer:Cancel()
        self.fadeOutTimer = nil
    end

    -- Ensure frame is fully visible
    frame:SetAlpha(1)
    frame:Show()
    
    -- Show buttons 
    if frame.closeButton then
        frame.closeButton:Show()
    end
    if frame.exportButton then
        frame.exportButton:Show()
    end

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
    
    -- Allow new generation after a short delay 
    C_Timer.After(1.0, function()
        self.isGenerating = false
    end)
end

------------------------------------------------------------
-- Public Hide Poem
------------------------------------------------------------

function UI:HidePoem()
    if not self.frame then return end
    local frame = self.frame
    local db = GetDB()

    frame:EnableMouse(false)
    
    -- Hide buttons
    if frame.closeButton then
        frame.closeButton:Hide()
    end
    if frame.exportButton then
        frame.exportButton:Hide()
    end
    
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
-- Public Apply Settings
------------------------------------------------------------

function UI:ApplySettings()
    if not self.frame then return end
    local frame = self.frame
    local db = GetDB()

    -- Apply separate X/Y scaling
    local scaleX = db.frameScaleX or 0.70
    local scaleY = db.frameScaleY or 0.70
    
    frame.baseWidth = frame.baseWidth or 700
    frame.baseHeight = frame.baseHeight or 650
    
    frame:SetSize(frame.baseWidth * scaleX, frame.baseHeight * scaleY)
    
    self:ApplyTheme()
    self:ApplyFontSettings()
    
    -- Apply transparency to specific elements only
    local alpha = db.frameAlpha or 1.0
    
    -- Apply alpha to backdrop by adjusting backdrop alpha channel
    local r, g, b = frame:GetBackdropColor()
    if r then  -- Only if backdrop has a background color
        frame:SetBackdropColor(r, g, b, alpha)
    end
    
    local br, bg, bb = frame:GetBackdropBorderColor()
    frame:SetBackdropBorderColor(br, bg, bb, alpha)
    
    -- Apply alpha to atlas texture if present
    if frame.bgTexture and frame.bgTexture:IsShown() then
        frame.bgTexture:SetAlpha(alpha)
    end
    
    -- Apply alpha to overlays
    if frame.parchmentOverlay then
        frame.parchmentOverlay:SetAlpha(0.1 * alpha)
    end
    if frame.vignette then
        frame.vignette:SetAlpha(0.05 * alpha)
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
-- Public Apply FontSettings
------------------------------------------------------------

function UI:ApplyFontSettings()
    if not self.frame then return end
    local frame = self.frame
    local db = GetDB()
    
    local fontSetting = db.font or "Fonts\\FRIZQT__.TTF"
    local fontSize = db.fontSize or 18
    
    local fontFile, fontFlags
    
    -- Check if it's a file path 
    if fontSetting:match("[/\\]") then
        -- It's a font file path
        fontFile = fontSetting
        fontFlags = "OUTLINE"
    else
        -- It's a font object name (legacy support)
        local fontObject = _G[fontSetting]
        if not fontObject then
            fontFile = "Fonts\\FRIZQT__.TTF" -- Fallback
            fontFlags = "OUTLINE"
        else
            fontFile, _, fontFlags = fontObject:GetFont()
        end
    end
    
    -- Apply to title 
    if frame.title then
        frame.title:SetFont(fontFile, fontSize + 6, fontFlags)
        
        -- Apply title offset
        local titleOffsetY = db.titleOffsetY or -45
        frame.title:ClearAllPoints()
        frame.title:SetPoint("TOP", 0, titleOffsetY)
    end
    
    -- Update container position based on text offset
    if frame.container then
        local textOffsetY = db.textOffsetY or -70
        frame.container:ClearAllPoints()
        frame.container:SetPoint("TOPLEFT", 35, textOffsetY)
        frame.container:SetPoint("BOTTOMRIGHT", -35, 30)
    end
    
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
-- Public Export Current Poem
------------------------------------------------------------

function UI:ExportCurrentPoem()
    if not self.frame then return end
    
    local poem = self.frame.currentPoem or "No poem to export"
    local title = self.frame.currentTitle or "Untitled"
    
    -- Create export popup if it doesn't exist
    if not self.exportPopup then
        -- Parent to UIParent, no manual scaling
        self.exportPopup = CreateFrame("Frame", "IdleLinesExportPopup", UIParent, "BackdropTemplate")
        local popup = self.exportPopup
        
        popup:SetSize(600, 450)
        popup:SetPoint("CENTER", UIParent, "CENTER")
        popup:SetFrameStrata("FULLSCREEN_DIALOG")
        popup:SetFrameLevel(10020)
        popup:SetClampedToScreen(true)
        
        -- Backdrop
        popup:SetBackdrop({
            bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
            edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
            tile     = true,
            tileSize = 32,
            edgeSize = 32,
            insets   = { left = 11, right = 12, top = 12, bottom = 11 },
        })
        popup:SetBackdropColor(0, 0, 0, 1)
        
        popup:Hide()
        
        ----------------------------------------------------
        -- Title 
        ----------------------------------------------------
        popup.title = popup:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
        popup.title:SetPoint("TOP", 0, -14)
        popup.title:SetText("Copy Poem")
        
        -- Invisible drag frame over the title area
        local dragFrame = CreateFrame("Frame", nil, popup)
        dragFrame:SetPoint("TOPLEFT", 10, -10)
        dragFrame:SetPoint("TOPRIGHT", -40, -10)
        dragFrame:SetHeight(30)
        dragFrame:EnableMouse(true)
        dragFrame:SetScript("OnMouseDown", function(self, button)
            if button == "LeftButton" then
                popup:StartMoving()
            end
        end)
        dragFrame:SetScript("OnMouseUp", function()
            popup:StopMovingOrSizing()
        end)
        popup:SetMovable(true)
        
        ----------------------------------------------------
        -- Close button 
        ----------------------------------------------------
        local closeBtn = CreateFrame("Button", nil, popup)
        closeBtn:SetSize(32, 32)
        closeBtn:SetPoint("TOPRIGHT", -6, -6)
        closeBtn:SetNormalTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Up")
        closeBtn:SetPushedTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Down")
        closeBtn:SetHighlightTexture("Interface\\Buttons\\UI-Panel-MinimizeButton-Highlight", "ADD")
        closeBtn:SetScript("OnClick", function() popup:Hide() end)
        
        ----------------------------------------------------
        -- Scroll frame + edit box
        ----------------------------------------------------
        local scroll = CreateFrame("ScrollFrame", nil, popup, "UIPanelScrollFrameTemplate")
        scroll:SetPoint("TOPLEFT", 20, -40)
        scroll:SetPoint("BOTTOMRIGHT", -40, 50)
        
        local editBox = CreateFrame("EditBox", nil, scroll)
        editBox:SetMultiLine(true)
        editBox:SetFontObject(ChatFontNormal)  -- nice readable size
        editBox:SetWidth(520)
        editBox:SetAutoFocus(true)
        editBox:SetScript("OnEscapePressed", function() popup:Hide() end)
        editBox:SetScript("OnEditFocusGained", function(self)
            self:HighlightText()
        end)
        
        scroll:SetScrollChild(editBox)
        popup.editBox = editBox
        
        ----------------------------------------------------
        -- Bottom Close button
        ----------------------------------------------------
        local close = CreateFrame("Button", nil, popup, "UIPanelButtonTemplate")
        close:SetSize(120, 24)
        close:SetPoint("BOTTOM", 0, 16)
        close:SetText("Close")
        close:SetScript("OnClick", function() popup:Hide() end)
    end
    
    -- Update contents each time
    local popup = self.exportPopup
    popup.title:SetText("Copy Poem: " .. title)
    popup.editBox:SetText(poem)
    popup.editBox:HighlightText()
    popup.editBox:SetFocus()
    popup:Show()
end


------------------------------------------------------------
-- Module Init Hook
------------------------------------------------------------

function UI:OnInit()
    self:CreateFrame()
    self:ApplySettings()
    ns:Debug("UI module initialized.")
end