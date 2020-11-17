DEBUG_HEROES_LIST = {}
local hPlayer = PlayerResource:GetPlayer(0)
local heroItems = {}
local heroAbilities = {}

local hero = CreateHeroForPlayer("npc_dota_hero_mars", hPlayer)
DEBUG_HEROES_LIST["0"] = hero
heroAbilities["0"] = {1,2,1}
heroItems["0"] = {
    { ["name"] = "item_wood_shield_datadriven", ["cost"] = 100}
}

hero = CreateHeroForPlayer("npc_dota_hero_windrunner", hPlayer)
DEBUG_HEROES_LIST["1"] = hero
heroAbilities["1"] = {2,1,0}
heroItems["1"] = {
    { ["name"] = "item_claws_datadriven", ["cost"] = 100}
}

hero = CreateHeroForPlayer("npc_dota_hero_lina", hPlayer)
DEBUG_HEROES_LIST["2"] = hero
heroAbilities["2"] = {2,1,0}
heroItems["2"] = {
    { ["name"] = "item_claws_datadriven", ["cost"] = 100}
}

local start_area = Entities:FindByName(nil, "spawner_area_goat"):GetAbsOrigin()
local pos = 1
local goldTotal = 100 * (DEBUG_START_SCENE - 1)
for heroKey, hero in pairs(DEBUG_HEROES_LIST) do
    hero:SetControllableByPlayer(0, true)
    hero:AddItemByName("item_flask_datadriven")

    if DEBUG_START_SCENE == 1 then
        hero:SetOrigin(Vector(start_area.x - 150, start_area.y + pos * 100,128))
    elseif DEBUG_START_SCENE == 2 then
        local v = Entities:FindByName(nil, "goat3"):GetAbsOrigin()
        hero:SetOrigin(Vector(v.x + pos * 100, v.y - 150, 128))
    end

    -- LEVEL UP AND CHOOSE SKILLS
    hero:AddExperience(100 * (DEBUG_START_SCENE - 1), 0, false, false)
    for i = 1, DEBUG_START_SCENE do
        local abilityIdx = heroAbilities[heroKey][i]
        if abilityIdx == nil then
            break
        end
        local abilityHandle = hero:GetAbilityByIndex(abilityIdx)
        hero:UpgradeAbility(abilityHandle)
    end

    -- ITEMS
    local gold = goldTotal
    for _, item in pairs(heroItems[heroKey]) do
        if (gold < item["cost"]) then
            break
        end
        gold = gold - item["cost"]
        hero:AddItemByName(item["name"])
    end
    pos = pos + 1
end

hero = PlayerResource:GetSelectedHeroEntity( 0 )
--hero:ForceKill(false)
