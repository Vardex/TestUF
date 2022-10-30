local addonName, addonTable = ...

addonTable.nameplateCVars = {
    nameplateMotion = 1,
    --nameplateOverlapH = 0.8
    nameplateOverlapV = 0.8,
}

function addonTable.nameplateStyle(self)
    self:SetSize(160, 30)
    self:SetPoint("CENTER")
    addonTable.elementsFactory.makeBorder(self, true)
    addonTable.elementsFactory.makeHealthBar(self)
    addonTable.elementsFactory.makeNameText(self, "LEFT", 5, 0, 8)
    addonTable.elementsFactory.makeHealthFullText(self, "RIGHT", -5, 0, 8)
    addonTable.elementsFactory.makeCastBar(self)
    addonTable.elementsFactory.makeAuras(self, true)
end

