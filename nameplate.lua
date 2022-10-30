local addonName, addonTable = ...

function addonTable.nameplateStyle(self)
    self:SetSize(200, 50)
    self:SetPoint("CENTER")
    addonTable.elementsFactory.makeBorder(self)
    addonTable.elementsFactory.makeHealthBar(self, 42)
    addonTable.elementsFactory.makePowerBar(self, 8)
    addonTable.elementsFactory.makeNameText(self, "LEFT", 5, 0)
    addonTable.elementsFactory.makeHealthFullText(self, "RIGHT", -5, 0)
    addonTable.elementsFactory.makeCastBar(self)
    addonTable.elementsFactory.makeAuras(self)
end

