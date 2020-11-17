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
