local CraftingFramework = require("CraftingFramework")
if not CraftingFramework then return end

local smithing = require("Morrowind_Crafting_3.Anvil.smithing_recipes")
if not smithing then return end

local cooking = require("Morrowind_Crafting_3.Cooking.recipes")
if not cooking then return end

local crafting = require("Morrowind_Crafting_3.Crafting_kit.recipes")
if not crafting then return end

local cutting = require("Morrowind_Crafting_3.Cutting_Board.recipes")
if not cutting then return end

local fletching = require("Morrowind_Crafting_3.Fletching_Kit.recipes")
if not fletching then return end

local inkwell = require("Morrowind_Crafting_3.Inkwell.recipes")
if not inkwell then return end

local jewelry = require("Morrowind_Crafting_3.Jewelers_kit.recipes")
if not jewelry then return end

local kegstand = require("Morrowind_Crafting_3.Kegstand.recipes")
if not kegstand then return end

local leatherResin = require("Morrowind_Crafting_3.Leather_Resin_kit.recipes")
if not leatherResin then return end

local loom = require("Morrowind_Crafting_3.Loom.recipes")
if not loom then return end

local masonry = require("Morrowind_Crafting_3.Masonry_tools.recipes")
if not masonry then return end

local metalworking = require("Morrowind_Crafting_3.Metalworking_kit.recipes")
if not metalworking then return end

local pottery = require("Morrowind_Crafting_3.Pottery_Wheel.recipes")
if not pottery then return end

local sewing = require("Morrowind_Crafting_3.Sewing_kit.recipes")
if not sewing then return end

local shears = require("Morrowind_Crafting_3.Shears.recipes")
if not shears then return end

local smelter = require("Morrowind_Crafting_3.Smelter.recipes")
if not smelter then return end

local toxinExt = require("Morrowind_Crafting_3.Toxin_extractor.recipes")
if not toxinExt then return end

local toxinVials = require("Morrowind_Crafting_3.ToxinVials.recipes")
if not toxinVials then return end

local woodworking = require("Morrowind_Crafting_3.Woodworking_kit.recipes")
if not woodworking then return end

local common = require("GPCFI.common.common")
if not common then return end

do

-- BUSHCRAFTING

local firewoodRecipes = {
    {
        id = "recipe_mc_ashfall_firewood",
        craftableId = "ashfall_firewood",
        description = "Firewood made from various types of wood.",
        materials = {
            { material = "wood", count = 1 },
        },
        category = "Wood",
        craftCallback = common.onCrafted,
    },
}

CraftingFramework.MenuActivator:registerRecipes{
    name = "Bushcrafting",
    type = "event",
    id = "Ashfall:ActivateBushcrafting",
    recipes = firewoodRecipes,
}

-- SMITHING

local smithingRecipes = common.convertRecipes(smithing, "mc_Smithing")

CraftingFramework.MenuActivator:new{
    id = "mc_anvil_p",
    type = "activate",
    name = "Smithing",
    recipes = smithingRecipes
}

CraftingFramework.MenuActivator:new{
    id = "mc_anvil_perm",
    type = "activate",
    name = "Smithing",
    recipes = smithingRecipes
}

-- COOKING

local cookingRecipes = common.convertRecipes(cooking, "mc_Cooking")

CraftingFramework.MenuActivator:new{
    id = "GPCFI:cookingActivated",
    type = "event",
    name = "Cooking",
    recipes = cookingRecipes,
}

-- CORDAGE WHEEL

local cordageRecipes = {
    {
        id = "recipe_mc_rope",
        craftableId = "mc_Rope",
        description = "Rope made from coarse fiber.",
        materials = {
            { material = "fibre", count = 20 },
        },
        category = "Rope",
        craftCallback = common.onCrafted,
    },
}

CraftingFramework.MenuActivator:new{
    id = "GPCFI:cordageActivated",
    type = "event",
    name = "Cordage Wheel",
    recipes = cordageRecipes,
}

CraftingFramework.MenuActivator:new{
    id = "mc_Cordagewheel_p",
    type = "activate",
    name = "Cordage Wheel",
    recipes = cordageRecipes
}

CraftingFramework.MenuActivator:new{
    id = "mc_Cordagewheel_perm",
    type = "activate",
    name = "Cordage Wheel",
    recipes = cordageRecipes
}

-- CRAFTING KIT

local craftingRecipes = common.convertRecipes(crafting, "mc_Crafting")

CraftingFramework.MenuActivator:new{
    id = "mc_crafting_kit",
    type = "equip",
    name = "Crafting Kit",
    recipes = craftingRecipes,
}

-- CUTTING BOARD

local cuttingBoardRecipes = common.convertRecipes(cutting, "mc_Cooking")

CraftingFramework.MenuActivator:new{
    id = "mc_cutting_board",
    type = "equip",
    name = "Cutting Board",
    recipes = cuttingBoardRecipes,
}

-- FLETCHING KIT

local fletchingKitRecipes = common.convertRecipes(fletching, "mc_Fletching")

CraftingFramework.MenuActivator:new{
    id = "mc_fletching_kit",
    type = "equip",
    name = "Fletching Kit",
    recipes = fletchingKitRecipes,
}

-- INKWELL

local inkwellRecipes = common.convertRecipes(inkwell, "mc_Crafting")

CraftingFramework.MenuActivator:new{
    id = "Misc_Inkwell",
    type = "equip",
    name = "Inkwell",
    recipes = inkwellRecipes,
}

CraftingFramework.MenuActivator:new{
    id = "T_De_BlueWareInkWell01",
    type = "equip",
    name = "Inkwell",
    recipes = inkwellRecipes,
}

CraftingFramework.MenuActivator:new{
    id = "GPCFI:pressActivated",
    type = "event",
    name = "Printing Press",
    recipes = inkwellRecipes,
}

-- JEWELERS KIT

local jewelryRecipes = common.convertRecipes(jewelry, "mc_Crafting")

CraftingFramework.MenuActivator:new{
    id = "mc_jewelry_kit",
    type = "equip",
    name = "Jeweler's Kit",
    recipes = jewelryRecipes,
}

-- KEGSTAND

local kegstandRecipes = common.convertRecipes(kegstand, "mc_Cooking")

CraftingFramework.MenuActivator:new{
    id = "GPCFI:kegstandActivated",
    type = "event",
    name = "Kegstand",
    recipes = kegstandRecipes,
}

-- LEATHER RESIN KIT

local leatherResinRecipes = common.convertRecipes(leatherResin, "mc_Smithing")

CraftingFramework.MenuActivator:new{
    id = "mc_organic_kit",
    type = "equip",
    name = "Heavy Leather and Resin Kit",
    recipes = leatherResinRecipes,
}

-- LOOM

local loomRecipes = common.convertRecipes(sewing, "mc_Sewing")

CraftingFramework.MenuActivator:new{
    id = "GPCFI:loomActivated",
    type = "event",
    name = "Loom",
    recipes = loomRecipes,
}

CraftingFramework.MenuActivator:new{
    id = "mc_loom_p",
    type = "activate",
    name = "Loom",
    recipes = loomRecipes
}

CraftingFramework.MenuActivator:new{
    id = "mc_loom01_p",
    type = "activate",
    name = "Loom",
    recipes = loomRecipes
}

CraftingFramework.MenuActivator:new{
    id = "mc_loom_perm",
    type = "activate",
    name = "Loom",
    recipes = loomRecipes
}

CraftingFramework.MenuActivator:new{
    id = "mc_loom01_perm",
    type = "activate",
    name = "Loom",
    recipes = loomRecipes
}

-- MASONRY TOOLS

local masonryRecipes = common.convertRecipes(masonry, "mc_Masonry")

CraftingFramework.MenuActivator:new{
    id = "mc_masonry_kit",
    type = "equip",
    name = "Masonry Tools",
    recipes = masonryRecipes,
}

-- METALWORKING KIT

local metalRecipes = common.convertRecipes(metalworking, "mc_Metalworking")

CraftingFramework.MenuActivator:new{
    id = "mc_metalworking_kit",
    type = "equip",
    name = "Metalworking Kit",
    recipes = metalRecipes,
}

-- POTTERY WHEEL

local potteryRecipes = common.convertRecipes(pottery, "mc_Masonry")

CraftingFramework.MenuActivator:new{
    id = "GPCFI:potteryActivated",
    type = "event",
    name = "Pottery Wheel",
    recipes = potteryRecipes,
}

CraftingFramework.MenuActivator:new{
    id = "GPCFI:mc_pottery_wheel_p",
    type = "activate",
    name = "Pottery Wheel",
    recipes = potteryRecipes,
}

CraftingFramework.MenuActivator:new{
    id = "GPCFI:mc_potterywheel02_p",
    type = "activate",
    name = "Pottery Wheel",
    recipes = potteryRecipes,
}

CraftingFramework.MenuActivator:new{
    id = "GPCFI:mc_pottery_wheel_perm",
    type = "activate",
    name = "Pottery Wheel",
    recipes = potteryRecipes,
}

-- SEWING KIT

local sewingRecipes = common.convertRecipes(sewing, "mc_Sewing")

CraftingFramework.MenuActivator:new{
    id = "mc_sewing_kit",
    type = "equip",
    name = "Sewing Kit",
    recipes = sewingRecipes,
}

-- SHEARS

local shearsRecipes = common.convertRecipes(shears, "mc_Sewing")

CraftingFramework.MenuActivator:new{
    id = "misc_shears_01",
    type = "equip",
    name = "Shears",
    recipes = shearsRecipes,
}

-- SMELTER

local smelterRecipes = common.convertRecipes(smelter, "mc_Smithing")

CraftingFramework.MenuActivator:new{
    id = "GPCFI:smelterActivated",
    type = "event",
    name = "Smelter",
    recipes = smelterRecipes,
}

CraftingFramework.MenuActivator:new{
    id = "mc_smelter_p",
    type = "activate",
    name = "Smelter",
    recipes = smelterRecipes,
}

CraftingFramework.MenuActivator:new{
    id = "mc_smelter_perm",
    type = "activate",
    name = "Smelter",
    recipes = smelterRecipes,
}

-- SPINNING WHEEL

local spinningRecipes = {
    {
        id = "recipe_misc_spool_01",
        craftableId = "misc_spool_01",
        description = "Spool made from fiber.",
        materials = {
            { material = "fibre", count = 3 },
            { material = "mc_spool_empty", count = 1 },
        },
        craftCallback = common.onCrafted,
    },
}

CraftingFramework.MenuActivator:new{
    id = "GPCFI:spinningActivated",
    type = "event",
    name = "Spinning Wheel",
    recipes = spinningRecipes,
}

CraftingFramework.MenuActivator:new{
    id = "mc_spinningwheel_p",
    type = "activate",
    name = "Spinning Wheel",
    recipes = smelterRecipes,
}

CraftingFramework.MenuActivator:new{
    id = "mc_spinningwheel2_p",
    type = "activate",
    name = "Spinning Wheel",
    recipes = smelterRecipes,
}

CraftingFramework.MenuActivator:new{
    id = "mc_spinningwheel_perm",
    type = "activate",
    name = "Spinning Wheel",
    recipes = smelterRecipes,
}

-- WOODWORKING KIT

local woodRecipes = common.convertRecipes(woodworking, "mc_Woodworking")

CraftingFramework.MenuActivator:new{
    id = "mc_carpentry_kit",
    type = "equip",
    name = "Woodworking Kit",
    recipes = woodRecipes,
}
end