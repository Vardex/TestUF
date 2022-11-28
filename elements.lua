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
    local info = self.Health:CreateFontString(nil, 'OVERLAY')
    info:SetFont("Fonts\\FRIZQT__.TTF", size or 12, "OUTLINE")
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
    local info = self.Health:CreateFontString(nil, 'OVERLAY')
    info:SetFont("Fonts\\FRIZQT__.TTF", size or 12, "OUTLINE")
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
    local info = self.Health:CreateFontString(nil, 'OVERLAY')
    info:SetFont("Fonts\\FRIZQT__.TTF", size or 12, "OUTLINE")
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

function addonTable.elementsFactory.makeThreatIndicator(self, player)
    -- Position and size
    local threatIndicator = self.Health:CreateTexture(nil, 'OVERLAY')
    threatIndicator:SetSize(16, 16)
    threatIndicator:SetPoint('BOTTOM', self.Health)
    if player then
        threatIndicator.feedbackUnit = "player"
    end
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

local colorInterruptible = function(self)
    -- Manage interruptible
    if self.notInterruptible then
        self:SetStatusBarColor(75 / 255, 75 / 255, 75 / 255)
    else
        self:SetStatusBarColor(200 / 255, 200 / 255, 0)
    end
end

local function onCastFail(self)
    self:SetStatusBarColor(200 / 255, 0, 0)
    self.SafeZone:Hide()
end

local function customTimeText(self, duration)
    if self.Time then
        self.Time:SetText(("%.1f"):format(self.channeling and duration or self.max - duration))
    end
end

local function onInterrupt(self, _, _, _, sourceName, _, _, destGUID)
    if destGUID == UnitGUID(self.unit) and self.Castbar.Time then
        self.Castbar.Time:SetText(sourceName)
    end
end

function addonTable.elementsFactory.makeCastBar(self)
    -- Position and size
    local castbar = CreateFrame('StatusBar', nil, self)
    castbar:SetHeight(20)
    castbar:SetPoint('TOP', self, 'BOTTOM')
    castbar:SetPoint('LEFT', 20, 0)
    castbar:SetPoint('RIGHT')
    castbar:SetStatusBarTexture([[Interface\AddOns\WeakAuras\Media\Textures\Statusbar_Clean]])
    -- Add a background
    local background = castbar:CreateTexture(nil, 'BACKGROUND')
    background:SetAllPoints(castbar)
    background:SetTexture([[Interface\AddOns\WeakAuras\Media\Textures\Statusbar_Clean]])
    background:SetColorTexture(20 / 255, 20 / 255, 20 / 255)
    -- Add a border
    local backdrop = CreateFrame("Frame", nil, castbar, "BackdropTemplate");
    backdrop:SetPoint('TOPLEFT', -20, 0)
    backdrop:SetPoint('BOTTOMRIGHT')
    backdrop:SetBackdrop({
        edgeFile = 'Interface/BUTTONS/WHITE8X8',
        tileEdge = true,
        edgeSize = 1,
    })
    backdrop:SetBackdropBorderColor(0, 0, 0)
    backdrop:SetFrameLevel(5)
    -- Add a spark
    -- local spark = castbar:CreateTexture(nil, 'OVERLAY')
    -- spark:SetSize(20, 20)
    -- spark:SetBlendMode('ADD')
    -- spark:SetPoint('CENTER', castbar:GetStatusBarTexture(), 'RIGHT', 0, 0)
    -- Add a timer
    local time = castbar:CreateFontString(nil, 'OVERLAY')
    time:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    time:SetPoint('RIGHT', castbar, -5, 1)
    -- time:SetTextColor(1, 1, 1)
    -- Add spell text
    local text = castbar:CreateFontString(nil, 'OVERLAY')
    text:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
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
    self:RegisterCombatEvent("SPELL_INTERRUPT", onInterrupt)
    -- Register it with oUF
    castbar.bg = background
    -- castbar.Spark = spark
    castbar.Time = time
    castbar.CustomTimeText = customTimeText
    castbar.Text = text
    castbar.Icon = icon
    -- castbar.Shield = shield
    castbar.SafeZone = safeZone
    castbar.timeToHold = 3
    castbar.PostCastFail = onCastFail
    castbar.PostCastStart = colorInterruptible
    castbar.PostCastInterruptible = colorInterruptible
    self.Castbar = castbar
end

local function createButton(element, index)
    local function UpdateTooltip(self)
        if (GameTooltip:IsForbidden()) then return end

        if (self.isHarmful) then
            GameTooltip:SetUnitDebuffByAuraInstanceID(self:GetParent().__owner.unit, self.auraInstanceID)
        else
            GameTooltip:SetUnitBuffByAuraInstanceID(self:GetParent().__owner.unit, self.auraInstanceID)
        end
    end

    local function onEnter(self)
        if (GameTooltip:IsForbidden() or not self:IsVisible()) then return end

        -- Avoid parenting GameTooltip to frames with anchoring restrictions,
        -- otherwise it'll inherit said restrictions which will cause issues with
        -- its further positioning, clamping, etc
        GameTooltip:SetOwner(self, self:GetParent().__restricted and 'ANCHOR_CURSOR' or self:GetParent().tooltipAnchor)
        self:UpdateTooltip()
    end

    local function onLeave()
        if (GameTooltip:IsForbidden()) then return end

        GameTooltip:Hide()
    end

    local button = CreateFrame('Button', element:GetDebugName() .. 'Button' .. index, element)

    local cd = CreateFrame('Cooldown', '$parentCooldown', button, 'CooldownFrameTemplate')
    cd:SetAllPoints()
    cd:SetReverse(true)
    cd:SetDrawEdge(false)
    button.Cooldown = cd

    local icon = button:CreateTexture(nil, 'BORDER')
    icon:SetAllPoints()
    button.Icon = icon

    local countFrame = CreateFrame('Frame', nil, button)
    countFrame:SetAllPoints(button)
    countFrame:SetFrameLevel(cd:GetFrameLevel() + 1)

    local count = countFrame:CreateFontString(nil, 'OVERLAY', 'NumberFontNormal')
    count:SetPoint('BOTTOMRIGHT', countFrame, 'BOTTOMRIGHT', -1, 0)
    button.Count = count

    local backdrop = CreateFrame("Frame", nil, button, "BackdropTemplate");
    backdrop:SetPoint("TOPLEFT")
    backdrop:SetPoint("BOTTOMRIGHT")
    backdrop:SetBackdrop({
        edgeFile = 'Interface/BUTTONS/WHITE8X8',
        tileEdge = true,
        edgeSize = 1,
    })
    backdrop:SetBackdropBorderColor(0, 0, 0)
    backdrop:SetFrameLevel(10)
    button.Backdrop = backdrop

    button.UpdateTooltip = UpdateTooltip
    button:SetScript('OnEnter', onEnter)
    button:SetScript('OnLeave', onLeave)

    return button
end

local function onUpdateButton(self, button, unit, data, position)
    local color = self.__owner.colors.debuff[data.dispelName] or { 0, 0, 0 }

    button.Backdrop:SetBackdropBorderColor(color[1], color[2], color[3])
end

function addonTable.elementsFactory.makeAuras(self, disableTooltip)
    -- Position and size
    local auras = CreateFrame('Frame', nil, self)
    auras:SetPoint('BOTTOM', self, 'TOP', 0, 1)
    auras:SetPoint('LEFT')
    auras:SetPoint('RIGHT')
    auras:SetHeight(32)
    -- Register with oUF
    auras.spacing = 1
    auras.debuffFilter = "HARMFUL|PLAYER"
    auras.disableMouse = disableTooltip
    auras.CreateButton = createButton
    auras.PostUpdateButton = onUpdateButton
    auras.size = 24
    self.Auras = auras
end

local function filterDebuff(self, unit, data)
    local hasCustom, alwaysShowMine, showForMySpec = SpellGetVisibilityInfo(data.spellId, "RAID_INCOMBAT")

    return not hasCustom or hasCustom and showForMySpec
end

function addonTable.elementsFactory.makeDebuff(self)
    -- Position and size
    local debuffs = CreateFrame('Frame', nil, self)
    debuffs:SetPoint('TOPLEFT', self, 'TOPRIGHT', 1, 0)
    debuffs:SetPoint('BOTTOMLEFT', self, 'BOTTOMRIGHT', 1, 0)
    debuffs:SetWidth(203)
    -- Register with oUF
    -- debuffs.filter = "RAID"
    debuffs.spacing = 1
    debuffs.CreateButton = createButton
    debuffs.PostUpdateButton = onUpdateButton
    debuffs.size = 50
    debuffs.num = 4
    debuffs.FilterAura = filterDebuff
    self.Debuffs = debuffs
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
