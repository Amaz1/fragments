local world_seed = minetest.get_mapgen_setting("seed")
local rand = PcgRandom(world_seed)
minetest.set_mapgen_setting("mg_name", "singlenode", true)
fragments = {}

local storage = minetest.get_mod_storage()
if storage:contains("tower:tower_position") then
	fragments.tower_position = minetest.deserialize(storage:get_string("tower:tower_position"))
else
	fragments.tower_position = {
		x = rand:next(1000, 3000),
		z = rand:next(1000, 3000)
	}
	if rand:next(1, 2) == 1 then
		fragments.tower_position.x = fragments.tower_position.x * -1
	end
	if rand:next(1, 2) == 1 then
		fragments.tower_position.z = fragments.tower_position.z * -1
	end
	storage:set_string("tower:tower_position", minetest.serialize(fragments.tower_position))
end

local tower_position = fragments.tower_position

local modpath = minetest.get_modpath("fragments")

dofile(modpath .. "/nodes.lua")
dofile(modpath .. "/tower_things.lua")
dofile(modpath .. "/leaves.lua") -- To override ethereal's leaves...
dofile(modpath .. "/biomes.lua")
dofile(modpath .. "/decorations.lua")
dofile(modpath .. "/mapgen.lua")
dofile(modpath .. "/floatlands.lua")
dofile(modpath .. "/sling.lua")
dofile(modpath .. "/stamina.lua")
dofile(modpath .. "/welcome.lua")

minetest.register_on_newplayer(function(player)
	local meta = player:get_meta()
	meta:set_string("tower:realm", "base")
	fragments.spawn_base(player)
	player:get_inventory():add_item("main", ItemStack("fragments:welcome_book"))
end)

minetest.register_on_joinplayer(function(player)
	local meta = player:get_meta()
	if meta:get_string("tower:realm") == "floatlands" then
		player:set_physics_override({gravity = 0.55})
	end
end)

-- Hacky (but only?) way of disabling bones in obstacle course...
local old_creative = minetest.is_creative_enabled
local temp_create = {}

function minetest.is_creative_enabled(name)
	if temp_create[name] == true then
		return true
	end
	old_creative(name)
end

local function on_die(player)
	if player:get_pos().y > 29500 then
		temp_create[player:get_player_name()] = true
		minetest.after(2, function()
			temp_create[player:get_player_name()] = nil
		end)
	end
end
table.insert(minetest.registered_on_dieplayers, 1, on_die)

minetest.register_on_respawnplayer(function(player)
	temp_create[player:get_player_name()] = nil
	local meta = player:get_meta()
	local realm = meta:get_string("tower:realm")
	if meta:contains("tower:respawn_pos") then
	elseif realm == "obstacle1" then
		player:set_pos({x = -18.5, y = 30082, z = -4.5})
		return true
	elseif realm == "floatlands" then
		 fragments.spawn_floatlands(player)
		 return true
	else
		fragments.spawn_base(player)
		 return true
	end
end)
