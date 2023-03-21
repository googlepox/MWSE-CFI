local common = require("GPCFI.common.common")
local ashfallCommon = require("mer.ashfall.common.common")

local function onEquip(e)
    if (e.reference == tes3.player and ashfallCommon.data.nearCampfire == true and (e.item.id == "mc_skillet" or e.item.id == "mc_saucepan" or e.item.id == "misc_com_wood_spoon_02" or e.item.id == "misc_com_iron_ladle" or e.item.id == "misc_rollingpin_01")) then
        event.trigger("GPCFI:cookingActivated")
    end
end

local function onLoaded()
    require("GPCFI.mc.materials")
    require("GPCFI.mc.tools")
    require("GPCFI.mc.mc")
    event.register("equip", onEquip)
    event.register("GPCFI:cookingActivated", common.menuActivated)
    event.register("GPCFI:loomActivated", common.menuActivated)
    event.register("GPCFI:cordageActivated", common.menuActivated)
    event.register("GPCFI:potteryActivated", common.menuActivated)
    event.register("GPCFI:spinningActivated", common.menuActivated)
    event.register("GPCFI:pressActivated", common.menuActivated)
    event.register("GPCFI:kegstandActivated", common.menuActivated)
    event.register("GPCFI:smelterActivated", common.menuActivated)
end


event.register("OtherSkills:Ready", onLoaded)

