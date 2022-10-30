local addonName, addonTable = ...

addonTable.nameplateCVars = {
    nameplateMotion = 1,
    nameplateOverlapV = 1.5,
    nameplateGlobalScale = 1,
    nameplateMinScale = 1,
    nameplateMaxScale = 1,
    nameplateLargerScale = 1,
    nameplateSelectedScale = 1
}

function addonTable.nameplateStyle(self)
    local width, height = 200, 30
    self:SetSize(width, height)
    self:SetPoint("CENTER")
    local scale = UIParent:GetEffectiveScale()
    if not InCombatLockdown() then
        C_NamePlate.SetNamePlateEnemySize(math.floor(width * scale), math.floor(height * scale))
    end
    self:SetScale(scale)
    addonTable.elementsFactory.makeBorder(self, true)
    addonTable.elementsFactory.makeHealthBar(self)
    addonTable.elementsFactory.makeNameText(self, "LEFT", 5, 0)
    addonTable.elementsFactory.makeHealthFullText(self, "RIGHT", -5, 0)
    addonTable.elementsFactory.makeCastBar(self)
    addonTable.elementsFactory.makeAuras(self, true)
end

