local atVendor = false

local function showPriceAtVendor (args, ...)
  if atVendor then
    originalFunction(args, ...)
  end
end

originalFunction = GameTooltip:GetScript("OnTooltipAddMoney")
GameTooltip:SetScript("OnTooltipAddMoney", showPriceAtVendor)

local function OnEventCall(self, event, ...)
  if event == "MERCHANT_SHOW" then
    atVendor = true
  end
  if event == "MERCHANT_CLOSED" then
    atVendor = false
  end
end

local HidePriceFrame = CreateFrame("Frame")
HidePriceFrame:RegisterEvent("MERCHANT_SHOW")
HidePriceFrame:RegisterEvent("MERCHANT_CLOSED")
HidePriceFrame:SetScript("OnEvent", function(self, event, ...) OnEventCall(self, event, ...) end);

