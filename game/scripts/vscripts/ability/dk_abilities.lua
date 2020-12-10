function DkWill(keys)
    local caster = keys.caster
    local target = keys.target
    local ability = keys.ability

    local bonus_damage = keys.ability:GetLevelSpecialValueFor("bonus_damage", (keys.ability:GetLevel() - 1))
    local damage = caster:GetMaxHealth() * bonus_damage / 100.0

    ApplyDamage({
        attacker = caster,
        victim = target,
        damage_type = ability:GetAbilityDamageType(),
        ability = ability,
        damage = damage
    })
end
