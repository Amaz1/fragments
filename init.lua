local world_seed = minetest.get_mapgen_setting("seed")
local rand = PcgRandom(world_seed)
minetest.set_mapgen_setting("mg_name", "singlenode", true)
old_old_mapgen = {}

local storage = minetest.get_mod_storage()
if storage:contains("tower:tower_position") then
	old_old_mapgen.tower_position = minetest.deserialize(storage:get_string("tower:tower_position"))
else
	old_old_mapgen.tower_position = {
		x = rand:next(1000, 3000),
		z = rand:next(1000, 3000)
	}
	if rand:next(1, 2) == 1 then
		old_old_mapgen.tower_position.x = old_old_mapgen.tower_position.x * -1
	end
	if rand:next(1, 2) == 1 then
		old_old_mapgen.tower_position.z = old_old_mapgen.tower_position.z * -1
	end
	storage:set_string("tower:tower_position", minetest.serialize(old_old_mapgen.tower_position))
end

local tower_position = old_old_mapgen.tower_position

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
