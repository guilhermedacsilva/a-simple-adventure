function MarsBattleVictoryOnDeath(keys)
    local caster = keys.caster
    local health_gain = keys.ability:GetLevelSpecialValueFor("health_gain", (keys.ability:GetLevel() - 1))

    caster:Heal(caster:GetMaxHealth() * health_gain / 100.0, caster)
    local pIdx = ParticleManager:CreateParticle("particles/generic_gameplay/generic_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
    destroyParticleAfter(3, pIdx)
end

MarsSpearDamage = 0

function MarsSpearOnStartSpell(keys)
    MarsSpearDamage = 0
end

function MarsSpearOnHit(keys)
    local caster = keys.caster
    local target = keys.target

    MarsSpearDamage = MarsSpearDamage + 1
    if MarsSpearDamage > 3 then
        return
    end

    if target:IsMagicImmune() then
        MarsSpearDamage = MarsSpearDamage - 1
    else
        local damageTable = {}
        damageTable.attacker = caster
        damageTable.victim = target
        damageTable.damage_type = keys.ability:GetAbilityDamageType()
        damageTable.ability = ability
        damageTable.damage = keys.ability:GetLevelSpecialValueFor("dmg" .. MarsSpearDamage, (keys.ability:GetLevel() - 1))
        ApplyDamage(damageTable)
    end
end
