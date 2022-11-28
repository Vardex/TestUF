local addonName, addonTable = ...

addonTable.partyStyle = function(self)
    self:RegisterForClicks('AnyUp')
    self:SetScript('OnEnter', UnitFrame_OnEnter)
    self:SetScript('OnLeave', UnitFrame_OnLeave)
    self:SetSize(150, 50)

    addonTable.elementsFactory.makeBorder(self, true)
    addonTable.elementsFactory.makeHealthBar(self, 46)
    addonTable.elementsFactory.makePowerBar(self, 4)
    addonTable.elementsFactory.makeNameText(self)
    addonTable.elementsFactory.makeGroupRoles(self)
    addonTable.elementsFactory.makeLeaderIndicator(self)
    addonTable.elementsFactory.makeRaidTargetIndicator(self)
    addonTable.elementsFactory.makeReadyCheckIndicator(self)
    addonTable.elementsFactory.makeRessurectIndicator(self)
    addonTable.elementsFactory.makeSummonIndicator(self)
    addonTable.elementsFactory.makeThreatIndicator(self)
    addonTable.elementsFactory.makePhaseIndicator(self)
    addonTable.elementsFactory.makeDebuff(self)

    self.Range = {
        insideAlpha = 1,
        outsideAlpha = 1 / 2,
    }
end
