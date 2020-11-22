function SpiderMechaExplosion(keys)
    local delay = 2.5
    local caster = keys.caster
    local damage = keys.ability:GetSpecialValueFor("damage")
    local radius = keys.ability:GetSpecialValueFor("radius")

    createDangerCircle(caster:GetAbsOrigin(), radius, delay)
    Timers:CreateTimer(delay, function()

            local pIdx = ParticleManager:CreateParticle(
                "particles/units/heroes/hero_abaddon/abaddon_aphotic_shield_explosion.vpcf", PATTACH_ABSORIGIN, caster)
            destroyParticleAfter(2, pIdx)

            local units = AICore:BotFindEnemies(caster:GetAbsOrigin(), radius)
            for _,unit in pairs(units) do
                local damage_table = {
                    victim = unit,
                    attacker = caster,
                    damage = damage,
                    damage_type = DAMAGE_TYPE_PHYSICAL
                }
                ApplyDamage( damage_table )
            end

            return nil
        end
    )
end

function SpiderBroodWeb(keys)
    local caster = keys.caster
    local position = keys.caster:GetAbsOrigin()
    local delay = keys.ability:GetSpecialValueFor("delay")
    local radius = keys.ability:GetSpecialValueFor("radius")
    local duration = keys.ability:GetSpecialValueFor("duration")

    createDangerCircle(position, radius, delay)
    Timers:CreateTimer(delay, function()
            local pIdx = ParticleManager:CreateParticle(
                "particles/units/heroes/hero_broodmother/broodmother_web.vpcf", PATTACH_POINT, caster)
            ParticleManager:SetParticleControl(pIdx, 0, position)
            ParticleManager:SetParticleControl(pIdx, 1, Vector(radius,0,0))
            destroyParticleAfter(duration, pIdx, true)

            return nil
        end
    )
end
