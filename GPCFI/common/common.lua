local skillModule = include("OtherSkills.skillModule")
local CraftingFramework = include("CraftingFramework")
local mcCommon = include("Morrowind_Crafting_3.mc_common")
local mcConfig = mwse.loadConfig("Morrowind_Crafting_3")

local craftingList = {}

local common = {
    
}

local furnitureObjs = {
    "Beds",
    "Clothing Storage",
    "Furniture",
    "Tables",
    "Containers",
    "Decorations",
    "Tools",
    "Seating",
    "Shelving",
    "Shelter",
}
-- Ashfall

function common.menuActivated()
    mwse.log("MC Tool Activated")
end

local wood = CraftingFramework.Material.getMaterial("wood")

function common.isFirewood(id)
    for _, woodObj in pairs(wood.ids) do
        if (id == woodObj.id) then
            return true
        end
    end
end

function common.getCheapestWood()
    local cheapestID
    for _, item in pairs(tes3.mobilePlayer.inventory) do
        for _, id in pairs(common.wood.ids) do
            if (item.object.id == id and item.object.value < cheapestID.item.value) then
                cheapestID = item.object.id
            end
        end
    end
    return cheapestID
end

function common.getFirewoodCount()
    local count = 0
    for _, item in pairs(tes3.mobilePlayer.inventory) do
        for _, id in pairs(common.wood.ids) do
            if (item.object.id == id) then
                count = count + item.count
            end
        end
    end
    return count
end

-- Morrowind Crafting

function common.passTime(id, difficulty)
    if (difficulty and mcConfig.tasktime == true) then 
        tes3.advanceTime({ hours = (0.1 * difficulty), resting = false })
    end
end

function common.mcSkillCheck(skillID, difficulty)
	if (difficulty) then
        local fateRoll = ((math.random(1,6001)-1)/10000)+0.8
        local skillValue = skillModule.getSkill(skillID).current
        local effDifficulty = difficulty * mcCommon.calcAttr().modInt * mcCommon.calcAttr().modAgi
        local effSkill = skillValue * mcCommon.calcAttr().modHealth * mcCommon.calcAttr().modFatigue * mcCommon.calcAttr().modLuck * fateRoll
        if effSkill >= effDifficulty then
            return true
        else
            return false
        end
    else
        return true
    end
end

function common.onSuccess(table)
    local skillVal = skillModule.getSkill(table.skillID).current
    common.passTime(table.id, table.difficulty)
    mcCommon.skillReward(table.skillID, skillVal, table.difficulty)
end

function common.onFailure(id)
    tes3.messageBox("Failed: Your materials were ruined in the attempt.")
    tes3.removeItem({ reference = tes3.mobilePlayer, item = id.id, count = 1})
    common.passTime(id, id.difficulty)
end

function common.onCrafted(craftable)
    local skillID
    local difficulty
    for _, recipeObj in pairs(craftingList) do
        if (recipeObj.craftableId:lower() == craftable.id:lower()) then
            difficulty = recipeObj.difficulty
            skillID = recipeObj.skillID
        end
    end
    local result = common.mcSkillCheck(skillID, difficulty)
    if (result) then
        return common.onSuccess{
            id = craftable.id,
            difficulty = difficulty,
            skillID = skillID
        }
    else
        return common.onFailure{
            id = craftable.id,
            difficulty = difficulty
        }
    end
end

function common.getToolReqs(recipe)
    local container = {}
	local toolReq = {}
    if (recipe.modifer) then
        toolReq.tool = recipe.modifier
        toolReq.equipped = false
        toolReq.conditionPerUse = 0
        toolReq.count = 1
    end
    table.insert(container, toolReq)
    return toolReq
end

-- General
function common.titleCaseHelper(first, rest)
    return first:upper()..rest:lower()
end

function common.triggerMenuLoom()
    event.trigger("GPCFI:loomActivated")
end

function common.triggerMenuCordage()
    event.trigger("GPCFI:cordageActivated")
end

function common.triggerMenuPottery()
    event.trigger("GPCFI:potteryActivated")
end

function common.triggerMenuSpinning()
    event.trigger("GPCFI:spinningActivated")
end

function common.triggerMenuPrinting()
    event.trigger("GPCFI:pressActivated")
end

function common.triggerMenuKegstand()
    event.trigger("GPCFI:kegstandActivated")
end

function common.triggerMenuSmelter()
    event.trigger("GPCFI:smelterActivated")
end

function common.convertRecipes(recipeList, skillID)
    local recipes = {}
    for _, recipe in pairs(recipeList) do
        common[recipe] = {
            id = recipe.id,
            time = recipe.taskTime
        }
        local recipeID = ""
        if not recipe.alias then
            recipeID = "recipe_" .. recipe.id
        else
            recipeID = "recipe_" .. recipe.alias
            recipeID = recipeID:gsub("(%a)([%w_']*)", common.titleCaseHelper)
            recipeID = recipeID:gsub(" ", "")
        end
        local category = recipe.group
        if (recipe.class) then
            category = category .. " " .. recipe.class
        end
        local recipeObj = {
            id = recipeID,
            craftableId = recipe.id,
            materials = {},
            category = category,
            toolRequirements = common.getToolReqs(recipe),
            resultAmount = recipe.yieldCount,
            craftCallback = common.onCrafted
        }
        for _, obj in pairs(furnitureObjs) do
            if (obj == recipe.class or obj == recipe.group) then
                recipeObj.name = tes3.getObject(recipe.id).name .. " (" .. recipe.difficulty .. ")"
                recipeObj.craftableId = recipeObj.craftableId .. "_p"
                if ((recipe.class and recipe.class:find("Tools")) or (recipe.group and recipe.group:find("Tools"))) then
                    if (recipe.id:lower():find("loom")) then
                        recipeObj.additionalMenuOptions = {
                        {
                            text = "Loom",
                            callback = common.triggerMenuLoom
                        }
                    }
                    elseif (recipe.id:lower():find("cordagewheel")) then
                        recipeObj.additionalMenuOptions = {
                        {
                            text = "Cordage Wheel",
                            callback = common.triggerMenuCordage
                        }
                    }
                    elseif (recipe.id:lower():find("potterywheel") or recipe.id:lower():find("pottery_wheel")) then
                        recipeObj.additionalMenuOptions = {
                        {
                            text = "Pottery Wheel",
                            callback = common.triggerMenuPottery
                        }
                    }
                    elseif (recipe.id:lower():find("spinningwheel")) then
                        recipeObj.additionalMenuOptions = {
                        {
                            text = "Spinning Wheel",
                            callback = common.triggerMenuSpinning
                        }
                    }
                    elseif (recipe.id:lower():find("printpress")) then
                        recipeObj.additionalMenuOptions = {
                        {
                            text = "Printing Press",
                            callback = common.triggerMenuPrinting
                        }
                    }
                    elseif (recipe.id:lower():find("_kegstand_")) then
                        recipeObj.additionalMenuOptions = {
                        {
                            text = "Kegstand",
                            callback = common.triggerMenuKegstand
                        }
                    }
                    elseif (recipe.id:lower():find("_smelter_")) then
                        recipeObj.additionalMenuOptions = {
                        {
                            text = "Ore Smelter",
                            callback = common.triggerMenuSmelter
                        }
                    }
                    end
                end
            elseif(tes3.getObject(recipe.id) and tes3.getObject(recipe.id).name and recipe.difficulty) then
                recipeObj.name = tes3.getObject(recipe.id).name .. " (" .. recipe.difficulty .. ")"
            end
        end
        if (recipe.ingreds) then
            for _, ingredObj in pairs(recipe.ingreds) do
                local material = {
                    material = ingredObj.id:lower(),
                    count = ingredObj.count
                }
                table.insert(recipeObj.materials, material)
            end
        end
        table.insert(recipes, recipeObj)
        if (recipe.id == "bk_LivesOfTheSaints") then
        end
        recipeObj.difficulty = recipe.difficulty
        recipeObj.skillID = skillID
        table.insert(craftingList, recipeObj)
    end
    return recipes
end

return common