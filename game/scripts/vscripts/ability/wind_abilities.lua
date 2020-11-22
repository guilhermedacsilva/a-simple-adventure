if WindFirstAidKitTarget == nil then
    WindFirstAidKitTarget = true
end

function WindFirstAidKitGetTarget(keys)
    WindFirstAidKitTarget = keys.target
end

function WindFirstAidKitFireCandy(keys)
    local caster = keys.caster
    local ability = keys.ability

    local vPos = caster:GetAbsOrigin()
    vPos.z = vPos.z + 500

    local projectile =
    {
        Target = WindFirstAidKitTarget,
        Source = caster,
        Ability = ability,
        EffectName = "particles/hw_fx/hw_candy_projectile.vpcf",
        iMoveSpeed = 600,
        vSourceLoc = vPos,
        bDodgeable = false,
        bProvidesVision = false,
        flExpireTime = GameRules:GetGameTime() + 3
    }

    ProjectileManager:CreateTrackingProjectile( projectile )

    EmitSoundOnLocationWithCaster( caster:GetAbsOrigin(), "Adventure.ThrowCookie", caster )
end

function WindHunterKnowledge(keys)
    local caster = keys.caster
    local target = keys.target
    local ability = keys.ability
    local modifierName = "modifier_wind_hunter_knowledge_target_datadriven"
    local damage_per_stack = ability:GetLevelSpecialValueFor( "damage_per_stack", ability:GetLevel() - 1 )

    if target:HasModifier( modifierName ) then
        local current_stack = target:GetModifierStackCount( modifierName, ability )

        local damage_table = {
            victim = target,
            attacker = caster,
            damage = damage_per_stack * current_stack,
            damage_type = DAMAGE_TYPE_PHYSICAL
        }
        ApplyDamage( damage_table )

        ability:ApplyDataDrivenModifier( caster, target, modifierName, { Duration = 180 } )
        target:SetModifierStackCount( modifierName, ability, current_stack + 1 )
    else
        ability:ApplyDataDrivenModifier( caster, target, modifierName, { Duration = 180 } )
        target:SetModifierStackCount( modifierName, ability, 1 )

        -- Deal damage
        local damage_table = {
            victim = target,
            attacker = caster,
            damage = damage_per_stack,
            damage_type = DAMAGE_TYPE_PHYSICAL
        }
        ApplyDamage( damage_table )
    end
end
