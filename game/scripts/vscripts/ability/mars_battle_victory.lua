function MarsBattleVictoryOnDeath(keys)
    local caster = keys.caster
    local health_gain = keys.ability:GetLevelSpecialValueFor("health_gain", (keys.ability:GetLevel() - 1))

    caster:Heal(caster:GetMaxHealth() * health_gain / 100.0, caster)
    local pIdx = ParticleManager:CreateParticle("particles/generic_gameplay/generic_lifesteal.vpcf", PATTACH_ABSORIGIN_FOLLOW, caster)
    destroyParticleAfter(3, pIdx)
end
