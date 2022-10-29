local addonName, addonTable = ...

addonTable.smallufStyle = function(self)
    self:RegisterForClicks('AnyUp')
    self:SetScript('OnEnter', UnitFrame_OnEnter)
    self:SetScript('OnLeave', UnitFrame_OnLeave)
    self:SetSize(100, 20)

    addonTable.elementsFactory.makeBorder(self)
    addonTable.elementsFactory.makeHealthBar(self, 17)
    addonTable.elementsFactory.makePowerBar(self, 3)
    addonTable.elementsFactory.makeNameText(self, "LEFT", 2, 0, 8)
    addonTable.elementsFactory.makeHealthPerText(self, "RIGHT", -2, 0, 8)
end

