local world_seed = minetest.get_mapgen_params().seed
local rand = PcgRandom(world_seed)

old_old_mapgen = {}

old_old_mapgen.tower_position = {
	x = rand:next(-4000, 4000),
	z = rand:next(-4000, 4000)
}

local tower_position = old_old_mapgen.tower_position
if (tower_position.x > -1000 and tower_position.x < 1000) or
	(tower_position.z > -1000 and tower_position.z < 1000) then
	minetest.log("warning", "Tower Position close to spawn (less than 1000 nodes).")
end
--print(dump(tower_position))

local modpath = minetest.get_modpath("old_old_mapgen")

dofile(modpath .. "/nodes.lua")
dofile(modpath .. "/tower_things.lua")
dofile(modpath .. "/leaves.lua") -- To override ethereal's leaves...
dofile(modpath .. "/biomes.lua")
dofile(modpath .. "/decorations.lua")
dofile(modpath .. "/mapgen.lua")
dofile(modpath .. "/floatlands.lua")
dofile(modpath .. "/sling.lua")
dofile(modpath .. "/welcome.lua")

minetest.register_on_newplayer(function(player)
	local meta = player:get_meta()
	meta:set_string("tower:realm", "base")
	old_old_mapgen.spawn_base(player)
end)

minetest.register_on_joinplayer(function(player)
	local meta = player:get_meta()
	if meta:get_string("tower:realm") == "floatlands" then
		player:set_physics_override({gravity = 0.55})
	end
end)

minetest.register_on_respawnplayer(function(player)
	local meta = player:get_meta()
	local realm = meta:get_string("tower:realm")
	if meta:contains("tower:respawn_pos") then
	elseif realm == "obstacle1" then
		player:set_pos({x = -18.5, y = 30082, z = -4.5})
		return true
	elseif realm == "floatlands" then
		 old_old_mapgen.spawn_floatlands(player)
		 return true
	else
		old_old_mapgen.spawn_base(player)
		 return true
	end
end)
