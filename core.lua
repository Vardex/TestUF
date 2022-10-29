local addonName, addonTable = ...

local unitSpecific = {
    player = addonTable.playerStyle,
    target = addonTable.targetStyle,
    targettarget = addonTable.smallufStyle,
    focus = addonTable.smallufStyle,
    party = addonTable.partyStyle
}

local layout = function(self, unit)
    -- Shared layout code.
    if (unitSpecific[unit]) then
        return unitSpecific[unit](self)
    end
    -- lot of different nameplate unit like nameplate1, nameplate2...
    -- TODO: unify that
    if (unit:find("nameplate")) then
        return addonTable.nameplateStyle(self)
    end
end

oUF:RegisterStyle("MyLayout", layout)
oUF:Factory(function(self)

    self:SetActiveStyle("MyLayout")

    local player = self:Spawn("player")
    player:SetPoint('CENTER', -350, -200)
    local target = self:Spawn("target")
    target:SetPoint('CENTER', 350, -200)
    local targettarget = self:Spawn("targettarget")
    targettarget:SetPoint('BOTTOMLEFT', target, 'BOTTOMRIGHT', -1, 0)
    local focus = self:Spawn("focus")
    focus:SetPoint('TOPLEFT', player, 'BOTTOMLEFT', 0, 1)

    -- oUF:SpawnHeader(overrideName, overrideTemplate, visibility, attributes ...)
    local party = self:SpawnHeader(nil, nil, 'raid,party,solo',
    --      -- http://wowprogramming.com/docs/secure_template/Group_Headers
    --      -- Set header attributes
         'showParty', true,
         'showPlayer', true,
         'yOffset', -5
    )
    party:SetPoint('TOP', UIParent, 'CENTER' , -550, 200)

    -- oUF:SpawnNamePlates(prefix, callback, variables)
    self:SpawnNamePlates()
end)
