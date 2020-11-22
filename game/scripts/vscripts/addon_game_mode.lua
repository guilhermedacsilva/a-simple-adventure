-- This is the entry-point to your game mode and should be used primarily to precache models/particles/sounds/etc

require('internal/util')
require('gamemode')

function Precache( context )
--[[
  This function is used to precache resources/units/items/abilities that will be needed
  for sure in your game and that will not be precached by hero selection.  When a hero
  is selected from the hero selection screen, the game will precache that hero's assets,
  any equipped cosmetics, and perform the data-driven precaching defined in that hero's
  precache{} block, as well as the precache{} block for any equipped abilities.

  See GameMode:PostLoadPrecache() in gamemode.lua for more information
  ]]

  DebugPrint("[BAREBONES] Performing pre-load precache")

  -- Particles can be precached individually or by folder
  -- It it likely that precaching a single particle system will precache all of its children, but this may not be guaranteed

  --PrecacheResource("particle_folder", "particles/test_particle", context)

  -- Models can also be precached by folder or individually
  -- PrecacheModel should generally used over PrecacheResource for individual models
  --PrecacheResource("model_folder", "particles/econ/items/shadow_fiend/sf_fire_arcana", context)
  --PrecacheModel("models/heroes/viper/viper.vmdl", context)
  --PrecacheModel("models/props_gameplay/treasure_chest001.vmdl", context)
  --PrecacheModel("models/props_debris/merchant_debris_chest001.vmdl", context)

  PrecacheResource("particle_folder", "particles/units/heroes/hero_legion_commander", context)
  PrecacheModel("particles/units/heroes/hero_lina/lina_spell_light_strike_array.vpcf", context)
  PrecacheModel("particles/units/heroes/hero_lina/lina_spell_light_strike_array_ray_team.vpcf", context)
  PrecacheModel("particles/generic_gameplay/generic_stunned.vpcf", context)
  PrecacheModel("particles/neutral_fx/gnoll_base_attack.vpcf", context)
  PrecacheModel("particles/danger_circle.vpcf", context)
  PrecacheModel("particles/generic_gameplay/generic_lifesteal.vpcf", context)
  PrecacheModel("particles/econ/courier/courier_babyroshan_winter18/courier_babyroshan_winter18_ambient_sparks.vpcf", context)
  PrecacheModel("particles/battlepass/healing_fire_torch_glow.vpcf", context)
  PrecacheModel("particles/generic_gameplay/dropped_item.vpcf", context)
  PrecacheModel("particles/hw_fx/hw_candy_projectile.vpcf", context)
  PrecacheModel("particles/generic_gameplay/generic_lifesteal_blue.vpcf", context)
  PrecacheModel("particles/generic_gameplay/generic_disarm.vpcf", context)
  PrecacheModel("particles/units/heroes/hero_alchemist/alchemist_acid_spray.vpcf", context)
  PrecacheModel("particles/econ/courier/courier_greevil_green/courier_greevil_green_ambient_b.vpcf", context)
  PrecacheModel("particles/econ/items/witch_doctor/wd_ti8_immortal_head/wd_ti8_immortal_maledict_bubbles.vpcf", context)
  PrecacheModel("particles/units/heroes/hero_abaddon/abaddon_aphotic_shield_explosion.vpcf", context)
  PrecacheModel("particles/econ/items/outworld_devourer/od_ti8/od_ti8_ambient_glow_blade_energy.vpcf", context)
  PrecacheModel("particles/econ/items/broodmother/bm_lycosidaes/bm_lycosidaes_ambient.vpcf", context)
  PrecacheModel("particles/units/heroes/hero_broodmother/broodmother_web.vpcf", context)
  PrecacheModel("particles/dev/library/base_follow_absorigin_continuous.vpcf", context)
  PrecacheModel("particles/items_fx/battlefury_cleave.vpcf", context)

  --PrecacheResource("soundfile", "sounds/ui/coins_big.vsnd", context)
  --PrecacheResource("model_folder", "particles/econ/items/shadow_fiend/sf_fire_arcana", context)
  --PrecacheModel("sounds/ui/coins_big.vsnd", context)

  -- Sounds can precached here like anything else
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_ember_spirit.vsndevts", context)
  PrecacheResource("soundfile", "sounds/weapons/hero/legion_commander/overwhelming_target01.vsnd", context)
  PrecacheResource("soundfile", "sounds/weapons/hero/legion_commander/overwhelming_target02.vsnd", context)
  PrecacheResource("soundfile", "soundevents/game_sounds_heroes/game_sounds_lina.vsndevts", context)
  PrecacheResource("soundfile", "soundevents/my_adventure_sounds.vsndevts", context)

  -- Entire items can be precached by name
  -- Abilities can also be precached in this way despite the name
  --PrecacheItemByNameSync("example_ability", context)
  --PrecacheItemByNameSync("item_example_item", context)

  -- Entire heroes (sound effects/voice/models/particles) can be precached with PrecacheUnitByNameSync
  -- Custom units from npc_units_custom.txt can also have all of their abilities and precache{} blocks precached in this way
  --PrecacheUnitByNameSync("npc_dota_hero_ancient_apparition", context)
  --PrecacheUnitByNameSync("npc_dota_hero_enigma", context)
end

-- Create the game mode when we activate
function Activate()
  GameRules.GameMode = GameMode()
  GameRules.GameMode:_InitGameMode()
end
