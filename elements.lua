local addonName, addonTable = ...

addonTable.elementsFactory = {}

function addonTable.elementsFactory.makeHealthBar(self, height)
    -- Position and size
    local health = CreateFrame('StatusBar', nil, self)
    if height then
        health:SetHeight(height)
    end
    health:SetPoint('TOP')
    health:SetPoint('LEFT')
    health:SetPoint('RIGHT')
    health:SetStatusBarTexture([[Interface\AddOns\WeakAuras\Media\Textures\Statusbar_Clean]])
    -- Add a background
    local background = health:CreateTexture(nil, 'BACKGROUND')
    background:SetAllPoints(health)
    background:SetTexture([[Interface\AddOns\WeakAuras\Media\Textures\Statusbar_Clean]])
    -- Options
    health.colorTapping = true
    health.colorDisconnected = true
    health.colorClass = true
    health.colorReaction = true
    health.colorHealth = true
    -- Make the background darker.
    background.multiplier = .2
    -- Register it with oUF
    health.bg = background
    self.Health = health
end

function addonTable.elementsFactory.makePowerBar(self, height)
    -- Position and size
    local power = CreateFrame('StatusBar', nil, self)
    power:SetHeight(height)
    power:SetPoint('BOTTOM')
    power:SetPoint('LEFT')
    power:SetPoint('RIGHT')
    power:SetStatusBarTexture([[Interface\AddOns\WeakAuras\Media\Textures\Statusbar_Clean]])
    -- Add a background
    local background = power:CreateTexture(nil, 'BACKGROUND')
    background:SetAllPoints(power)
    background:SetTexture([[Interface\AddOns\WeakAuras\Media\Textures\Statusbar_Clean]])
    -- Options
    power.frequentUpdates = true
    power.colorTapping = true
    power.colorDisconnected = true
    power.colorPower = true
    power.colorClass = true
    power.colorReaction = true
    -- Make the background darker.
    background.multiplier = .2
    -- Register it with oUF
    power.bg = background
    self.Power = power
end

-- define the tag function
oUF.Tags.Methods['MyLayout:name'] = function(unit, realUnit)
    local name = _TAGS['name'](unit, realUnit)
    return string.format('%s|r', name)
end
-- add the events
oUF.Tags.Events['MyLayout:name'] = 'UNIT_NAME_UPDATE'

function addonTable.elementsFactory.makeNameText(self, point, ofsx, ofsy, size)
    -- create the text widget
    local info = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightOutline')
    if size then
        info:SetFont("Fonts\\FRIZQT__.TTF", size, "OUTLINE")
    end
    info:SetPoint(point or "CENTER", ofsx or 0, ofsy or 0)
    -- register the tag on the text widget with oUF
    self:Tag(info, '[MyLayout:name]')
end

-- define the tag function
oUF.Tags.Methods['MyLayout:hp'] = function(unit, realUnit)
    local hp = _TAGS['curhp'](unit, realUnit)
    local perhp = _TAGS['perhp'](unit, realUnit)
    return string.format('%s - %s%%|r', AbbreviateNumbers(hp), perhp)
end
-- add the events
oUF.Tags.Events['MyLayout:hp'] = 'UNIT_HEALTH'

function addonTable.elementsFactory.makeHealthFullText(self, point, ofsx, ofsy, size)
    -- create the text widget
    local info = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightOutline')
    if size then
        info:SetFont("Fonts\\FRIZQT__.TTF", size, "OUTLINE")
    end
    info:SetPoint(point or "CENTER", ofsx or 0, ofsy or 0)
    -- register the tag on the text widget with oUF
    self:Tag(info, '[MyLayout:hp]')
end

-- define the tag function
oUF.Tags.Methods['MyLayout:perhp'] = function(unit, realUnit)
    local perhp = _TAGS['perhp'](unit, realUnit)
    return string.format('%s%%|r', perhp)
end
-- add the events
oUF.Tags.Events['MyLayout:perhp'] = 'UNIT_HEALTH'

function addonTable.elementsFactory.makeHealthPerText(self, point, ofsx, ofsy, size)
    -- create the text widget
    local info = self.Health:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightOutline')
    if size then
        info:SetFont("Fonts\\FRIZQT__.TTF", size, "OUTLINE")
    end
    info:SetPoint(point or "CENTER", ofsx or 0, ofsy or 0)
    -- register the tag on the text widget with oUF
    self:Tag(info, '[MyLayout:perhp]')
end

function addonTable.elementsFactory.makeGroupRoles(self)
    -- Position and size
    local groupRoleIndicator = self.Health:CreateTexture(nil, 'OVERLAY')
    groupRoleIndicator:SetSize(16, 16)
    groupRoleIndicator:SetPoint('BOTTOMLEFT', self.Health, 'BOTTOMLEFT', 2, 2)
    -- Register it with oUF
    self.GroupRoleIndicator = groupRoleIndicator
end

function addonTable.elementsFactory.makeLeaderIndicator(self)
    -- Position and size
    local leaderIndicator = self.Health:CreateTexture(nil, 'OVERLAY')
    leaderIndicator:SetSize(16, 16)
    leaderIndicator:SetPoint('TOPLEFT', self.Health, 'TOPLEFT', 2, 2)
    -- Register it with oUF
    self.LeaderIndicator = leaderIndicator
end

function addonTable.elementsFactory.makeRaidTargetIndicator(self)
    -- Position and size
    local raidTargetIndicator = self.Health:CreateTexture(nil, 'OVERLAY')
    raidTargetIndicator:SetSize(16, 16)
    raidTargetIndicator:SetPoint('TOP', self.Health, 0, 5)
    -- Register it with oUF
    self.RaidTargetIndicator = raidTargetIndicator
end

function addonTable.elementsFactory.makeReadyCheckIndicator(self)
    -- Position and size
    local readyCheckIndicator = self.Health:CreateTexture(nil, 'OVERLAY')
    readyCheckIndicator:SetSize(16, 16)
    readyCheckIndicator:SetPoint('RIGHT', -5, 0)
    -- Register with oUF
    self.ReadyCheckIndicator = readyCheckIndicator
end

function addonTable.elementsFactory.makeRessurectIndicator(self)
    -- Position and size
    local resurrectIndicator = self.Health:CreateTexture(nil, 'OVERLAY')
    resurrectIndicator:SetSize(16, 16)
    resurrectIndicator:SetPoint('CENTER')
    -- Register it with oUF
    self.ResurrectIndicator = resurrectIndicator
end

function addonTable.elementsFactory.makeSummonIndicator(self)
    -- Position and size
    local summonIndicator = self.Health:CreateTexture(nil, 'OVERLAY')
    summonIndicator:SetSize(16, 16)
    summonIndicator:SetPoint('RIGHT', -5, 0)
    -- Register it with oUF
    self.SummonIndicator = summonIndicator
end

function addonTable.elementsFactory.makeThreatIndicator(self)
    -- Position and size
    local threatIndicator = self.Health:CreateTexture(nil, 'OVERLAY')
    threatIndicator:SetSize(16, 16)
    threatIndicator:SetPoint('BOTTOM', self.Health)
    -- Register it with oUF
    self.ThreatIndicator = threatIndicator
end

function addonTable.elementsFactory.makePhaseIndicator(self)
    -- Position and size
    local phaseIndicator = CreateFrame('Frame', nil, self.Health)
    phaseIndicator:SetSize(16, 16)
    phaseIndicator:SetPoint('BOTTOM', self.Health)
    phaseIndicator:EnableMouse(true)
    local icon = phaseIndicator:CreateTexture(nil, 'OVERLAY')
    icon:SetAllPoints()
    phaseIndicator.Icon = icon
    -- Register it with oUF
    self.PhaseIndicator = phaseIndicator
end

function addonTable.elementsFactory.makeCombatIndicator(self)
    -- Position and size
    local combatIndicator = self.Health:CreateTexture(nil, 'OVERLAY')
    combatIndicator:SetSize(24, 24)
    combatIndicator:SetPoint('CENTER', self.Health)
    -- Register it with oUF
    self.CombatIndicator = combatIndicator
end

local colorInterruptible = function(self, unit)
    -- Manage interruptible
    if self.notInterruptible then
        self:SetStatusBarColor(75/255, 75/255, 75/255)
    else
        self:SetStatusBarColor(200/255, 200/255, 0)
    end
end

function addonTable.elementsFactory.makeCastBar(self)
    -- Position and size
    local castbar = CreateFrame('StatusBar', nil, self)
    castbar:SetHeight(20)
    castbar:SetPoint('BOTTOM', 0, -25)
    castbar:SetPoint('LEFT', 20, 0)
    castbar:SetPoint('RIGHT')
    castbar:SetStatusBarTexture([[Interface\AddOns\WeakAuras\Media\Textures\Statusbar_Clean]])
    -- Add a background
    local background = castbar:CreateTexture(nil, 'BACKGROUND')
    background:SetAllPoints(castbar)
    background:SetTexture([[Interface\AddOns\WeakAuras\Media\Textures\Statusbar_Clean]])
    background:SetColorTexture(20/255, 20/255, 20/255)
    -- Add a spark
    -- local spark = castbar:CreateTexture(nil, 'OVERLAY')
    -- spark:SetSize(20, 20)
    -- spark:SetBlendMode('ADD')
    -- spark:SetPoint('CENTER', castbar:GetStatusBarTexture(), 'RIGHT', 0, 0)
    -- Add a timer
    local time = castbar:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightOutline')
    time:SetPoint('RIGHT', castbar, -5, 1)
    -- time:SetTextColor(1, 1, 1)
    -- Add spell text
    local text = castbar:CreateFontString(nil, 'OVERLAY', 'GameFontHighlightOutline')
    text:SetPoint('LEFT', castbar, 5, 1)
    -- text:SetTextColor(1, 1, 1)
    -- Add spell icon
    local icon = castbar:CreateTexture(nil, 'OVERLAY')
    icon:SetSize(20, 20)
    icon:SetPoint('TOPRIGHT', castbar, 'TOPLEFT')
    -- Add Shield
    -- local shield = castbar:CreateTexture(nil, 'OVERLAY')
    -- shield:SetSize(20, 20)
    -- shield:SetPoint('CENTER', castbar)
    -- Add safezone
    local safeZone = castbar:CreateTexture(nil, 'OVERLAY')
    -- Register it with oUF
    castbar.bg = background
    -- castbar.Spark = spark
    castbar.Time = time
    castbar.Text = text
    castbar.Icon = icon
    -- castbar.Shield = shield
    castbar.SafeZone = safeZone
    castbar.PostCastStart = colorInterruptible
    castbar.PostCastInterruptible = colorInterruptible
    self.Castbar = castbar
end

function addonTable.elementsFactory.makeAuras(self)
    -- Position and size
    local auras = CreateFrame('Frame', nil, self)
    auras:SetPoint('BOTTOM', self, 'TOP')
    auras:SetPoint('LEFT')
    auras:SetPoint('RIGHT')
    auras:SetHeight(32)
    -- Register with oUF
    auras.size = 24
    self.Auras = auras
end

function addonTable.elementsFactory.makeBorder(self, select)
    local backdrop = CreateFrame("Frame", nil, self, "BackdropTemplate");
    backdrop:SetPoint("TOPLEFT")
    backdrop:SetPoint("BOTTOMRIGHT")
    backdrop:SetBackdrop({
        edgeFile = 'Interface/BUTTONS/WHITE8X8',
        tileEdge = true,
        edgeSize = 1,
    })
    backdrop:SetBackdropBorderColor(0, 0, 0)
    backdrop:SetFrameLevel(5)
    if select then
        backdrop:RegisterEvent("PLAYER_TARGET_CHANGED")
        backdrop:SetScript("OnEvent", function()
            if UnitIsUnit(self.unit, "target") then
                backdrop:SetBackdropBorderColor(1, 1, 1)
            else
                backdrop:SetBackdropBorderColor(0, 0, 0)
            end
        end)
    end
end