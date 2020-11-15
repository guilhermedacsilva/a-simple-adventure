require('game/floresta1')
require('game/floresta2')

if SimpleAdventure == nil then
    SimpleAdventure = class({})
end

function SimpleAdventure:Init()
    if DEBUG_HEROES then
        if DEBUG_START_SCENE == 1 then
            Floresta1:Init()
        elseif DEBUG_START_SCENE == 2 then
            Floresta2:DebugScene()
        end
    else
        Floresta1:Init()
    end
end

function SimpleAdventure:EnemiesInRange(targetVector, radius)
    local units = FindUnitsInRadius(DOTA_TEAM_BADGUYS,
                  targetVector,
                  nil,
                  radius,
                  DOTA_UNIT_TARGET_TEAM_FRIENDLY,
                  DOTA_UNIT_TARGET_ALL,
                  DOTA_UNIT_TARGET_FLAG_FOW_VISIBLE,
                  FIND_ANY_ORDER,
                  false)
    return #units > 0
end

function SimpleAdventure:CreateEnemy(name, localVector, qnt)
    for i=1,qnt do
        CreateUnitByName(name, localVector, true, nil, nil, DOTA_TEAM_BADGUYS)
    end
end

function SimpleAdventure:StartNextScene(sceneObj)
    GameRules:GetGameModeEntity():SetThink( "Init", sceneObj, 3 )
end

function SimpleAdventure:LevelUp(gold)
    local heroList = HEROES
    if DEBUG_HEROES then
        heroList = DEBUG_HEROES_LIST
    end

    for _, hero in pairs (heroList) do
        if not hero:IsAlive() then
            hero:RespawnUnit()
        end
        hero:ModifyGold(gold, true, 0)
        hero:AddExperience(100, 0, false, false)
    end
    self:RefreshAllUnits()
end

function SimpleAdventure:RefreshAllUnits()
    local units = FindUnitsInRadius(DOTA_TEAM_GOODGUYS,
                  Vector(0,0,0),
                  nil,
                  FIND_UNITS_EVERYWHERE,
                  DOTA_UNIT_TARGET_TEAM_FRIENDLY,
                  DOTA_UNIT_TARGET_ALL,
                  DOTA_UNIT_TARGET_FLAG_NONE,
                  FIND_ANY_ORDER,
                  false)
    for _, unit in pairs(units) do
        unit:SetHealth( unit:GetMaxHealth() )
        unit:SetMana( unit:GetMaxMana() )
    end
end
