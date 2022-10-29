local addonName, addonTable = ...

function addonTable.playerStyle(self)
    self:RegisterForClicks('AnyUp')
    self:SetScript('OnEnter', UnitFrame_OnEnter)
    self:SetScript('OnLeave', UnitFrame_OnLeave)
    self:SetSize(200, 50)

    addonTable.elementsFactory.makeBorder(self)
    addonTable.elementsFactory.makeHealthBar(self)
    addonTable.elementsFactory.makeNameText(self, "LEFT", 5, 0)
    addonTable.elementsFactory.makeHealthFullText(self, "RIGHT", -5, 0)
    addonTable.elementsFactory.makeCombatIndicator(self)
end

