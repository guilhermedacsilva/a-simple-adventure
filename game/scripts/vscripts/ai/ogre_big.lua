function Spawn( entityKeyValues )
    thisEntity._abilitySmash = thisEntity:FindAbilityByName( "ogre_big_smash_datadriven" )
    thisEntity:SetContextThink( "BossThink", BossThink, 1 )
end

function BossThink()
    if thisEntity:IsNull() or not thisEntity:IsAlive() then
        return nil
    end

    if thisEntity:GetHealth() == thisEntity:GetMaxHealth() then
        return 2
    end

    if thisEntity._abilitySmash:IsFullyCastable() then
        units = AICore:BotFindEnemies(thisEntity:GetOrigin(), 600)
        if #units > 0 then
            createDangerCircle(units[1]:GetAbsOrigin(), thisEntity._abilitySmash:GetSpecialValueFor("radius"), 3)
            AICore:CastAbilityPosition(thisEntity, thisEntity._abilitySmash, units[1]:GetAbsOrigin())
            return 3
        end
    end

    return 1
end
