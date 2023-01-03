local tower_position = old_old_mapgen.tower_position

minetest.register_node("old_old_mapgen:tower_door", {
	description = "Tower Door",
	tiles = {"default_obsidian.png"},
	sounds = default.node_sound_glass_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1},
})

minetest.register_craftitem("old_old_mapgen:tower_key", {
	description = minetest.colorize("purple", "Tower Key") .. "\nTo use, rightclick on the tower door...",
	inventory_image = "old_old_mapgen_tower_key.png",
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type == "node" then
			if minetest.get_node(pointed_thing.under).name == "old_old_mapgen:tower_door" then
				if placer and placer:is_player() then
					minetest.add_particlespawner({
						amount = 250,
						time = 2,
						exptime = 2,
						collisiondetection = true,
						object_collision = true,
						bounce = 1,
						pos = vector.new(0,1,0),
						attached = placer,
						node = {name = "default:obsidian"},
						glow = 3,
						minsize = 0.1,
						maxsize = 0.7,
						vel = {
							min = vector.new(-2,-2,-2),
							max = vector.new(2,2,2),
						},
						acc = {
							min = vector.new(-2,-2,-2),
							max = vector.new(2,2,2),
						}
					})
					placer:set_pos({x = pointed_thing.under.x, y = pointed_thing.under.y, z = pointed_thing.under.z + 2})
				end
			end
		end
		itemstack:take_item()
		return itemstack
	end,
})

minetest.register_craft({
	output = "old_old_mapgen:tower_key",
	recipe = {
		{"old_old_mapgen:amethyst_crystal", "old_old_mapgen:amethyst_crystal", "old_old_mapgen:amethyst_crystal"},
		{"old_old_mapgen:amethyst_crystal", "default:gold_ingot", "old_old_mapgen:amethyst_crystal"},
		{"old_old_mapgen:amethyst_crystal", "old_old_mapgen:amethyst_crystal", "old_old_mapgen:amethyst_crystal"},
	}
})

local function tower_locate(itemstack, placer)
	local p = placer:get_pos()
	local edges = vector.subtract({x = tower_position.x, y = 0, z = tower_position.z}, {x = p.x, y = 0, z = p.z})
	local distance = math.floor(math.sqrt(math.abs(edges.x)^2 + math.abs(edges.z)^2))
	local meta = placer:get_meta()
	local time = meta:get_float("time")
	if time == 0 or (minetest.get_us_time() - time) > 60000000 then
		minetest.add_particlespawner({
			amount = 250,
			time = 4,
			exptime = 4,
			collisiondetection = true,
			object_collision = true,
			bounce = 1,
			pos = vector.new(0,1,0),
			attached = placer,
			texture = {
				name = "blocks_lapis_chunk.png",
				alpha_tween = {1, 0},
			},
			glow = 3,
			minsize = 0.1,
			maxsize = 0.7,
			vel = {
				min = vector.new(-2,-2,-2),
				max = vector.new(2,2,2),
			},
			acc = {
				min = vector.new(-2,-2,-2),
				max = vector.new(2,2,2),
			}
		})
		minetest.add_particlespawner({
			amount = 240,
			time = 60,
			exptime = 5,
			collisiondetection = true,
			object_collision = true,
			bounce = 1,
			pos = vector.new(0,1,0),
			attached = placer,
			texture = "blocks_lapis_chunk.png",
			glow = 3,
			minsize = 0.1,
			maxsize = 0.7,
			vel = {
				min = vector.new(-1,-1,-1),
				max = vector.new(1,1,1),
			},
			acc = {
				min = vector.new(-1,-1,-1),
				max = vector.new(1,1,1),
			}
		})
		minetest.chat_send_player(placer:get_player_name(), 
			minetest.colorize("blue", "Distance to tower: " .. distance .. " nodes"))
		meta:set_float("time", minetest.get_us_time())
	else
		minetest.chat_send_player(placer:get_player_name(), "Time before the tower distance can be rechecked: " ..
			math.ceil((60000000 - (minetest.get_us_time() - time))/1000000)  .. "s")
	end
end

minetest.register_craftitem("old_old_mapgen:tower_locator", {
	description = minetest.colorize("blue", "Tower Locator"),
	inventory_image = "old_old_mapgen_tower_locator.png",
	on_place = function(itemstack, placer, pointed_thing)
		tower_locate(itemstack, placer)
	end,
	on_secondary_use = function(itemstack, placer, pointed_thing)
		tower_locate(itemstack, placer)
	end,
})

minetest.register_craft({
	output = "old_old_mapgen:tower_locator",
	recipe = {
		{"default:diamond", "old_old_mapgen:lapis_chunk", "default:diamond"},
		{"old_old_mapgen:lapis_chunk", "default:gold_ingot", "old_old_mapgen:lapis_chunk"},
		{"default:diamond", "old_old_mapgen:lapis_chunk", "default:diamond"},
	}
})

minetest.override_item("fire:basic_flame", {
	inventory_image = "",
})

local form_inactive = "size[12,8]" ..
	"label[0.5,1;TOWER TELEPORTER SYSTEM]" ..
	"label[1,2;" .. minetest.colorize("red", "*CONTROLLER NOT ACTIVE") .. "]" ..
	"label[1,2.75;" .. minetest.colorize("red", 
		"*IMPOSSIBLE TO LEAVE THE TOWER\n\t\t\tUNLESS THE CONTROLLER IS ACTIVATED") .. "]" ..
	"label[1,3.75;" .. minetest.colorize("red", "*PLEASE ACTIVATE THE CONTROLLER") .. "]" ..
	"label[0.5,5;IF YOU DO NOT HAVE THE REQUIRED RESOURCES,\n\t\t\tPLEASE CLICK THE BUTTON]" ..
	"button[1,6;3,1;killme;DIE]"

local form_active = --"formspec_version[6]" ..
	"size[15,8]" ..
	"label[0.5,1;TOWER TELEPORTER SYSTEM]" ..
	"label[1,2;" .. minetest.colorize("green", "*CONTROLLER ACTIVE") .. "]" ..
	"label[1,2.75;" .. minetest.colorize("green", "*TELEPORTATION READY") .. "]" ..
	"item_image[7,4;2.2,2.2;default:diamondblock]" ..
	"item_image[7,3;2.2,2.2;default:dirt]" ..
	"item_image[7,2;2.2,2.2;default:mese]" ..	
	"item_image[7,1;2.2,2.2;fire:basic_flame]" ..
	"item_image[7.75,3.43;2.1,2.1;old_old_mapgen:lapis_lazuli]" ..
	"item_image[6.35,3.43;2.1,2.1;old_old_mapgen:amethyst]" ..
	--"model[10,5;4,4;chicken;chicken_model.x;lottmobs_chicken.png;0,10;true;false]"
	"button_exit[0.5,4;6,1;activate;" .. minetest.colorize("green", "INITIALIZE TELEPORTATION") .. "]"

minetest.register_node("old_old_mapgen:tower_controller", {
	description = "Tower Controller",
	tiles = {"old_old_mapgen_tower_controller.png"},
	sounds = default.node_sound_glass_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1},
	on_rightclick = function(pos, node, clicker)
		if clicker:is_player() then
			local _, num = minetest.find_nodes_in_area(
				{x = pos.x - 1, y = pos.y, z = pos.z - 1},
				{x = pos.x + 1, y = pos.y, z = pos.z + 1}, 
				{"default:mese", "default:diamondblock",
				"old_old_mapgen:lapis_lazuli", "old_old_mapgen:amethyst"})
			if num["default:mese"] == 1 and num["default:diamondblock"] == 1 and
				num["old_old_mapgen:lapis_lazuli"] == 1 and num["old_old_mapgen:amethyst"] == 1 then
				local meta = clicker:get_meta()
				meta:set_string("tmp_tower_position", minetest.pos_to_string(pos))
				minetest.show_formspec(clicker:get_player_name(), "tower_controller",
					form_active)
			else
				minetest.show_formspec(clicker:get_player_name(), "tower_controller",
					form_inactive)
			end
		end
	end,
})

local storage = minetest.get_mod_storage()
local win_string = storage:get_string("winners")
local winners = {}
if win_string ~= "" then
	winners = minetest.deserialize(win_string)
end

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname ~= "tower_controller" then
		return
	end
	if fields.killme then
		player:set_hp(0)
	elseif fields.activate then
		local name = player:get_player_name()
		local meta = player:get_meta()
		local pos = minetest.string_to_pos(meta:get_string("tmp_tower_position"))
		local nodes = minetest.find_nodes_in_area(
			{x = pos.x - 1, y = pos.y, z = pos.z - 1},
			{x = pos.x + 1, y = pos.y, z = pos.z + 1}, 
			{"default:mese", "default:diamondblock",
			"old_old_mapgen:lapis_lazuli", "old_old_mapgen:amethyst"})
		for _, p in pairs(nodes) do
			minetest.remove_node(p)
		end
		minetest.add_particlespawner({
			amount = 500,
			time = 0.0001,
			exptime = 7,
			collisiondetection = false,
			pos = pos,
			texpool = {
				"old_old_mapgen_tower_controller.png",
				"blocks_amethyst.png",
				"blocks_lapis_lazuli.png",
				"default_mese_block.png",
				"default_diamond_block.png",
			},
			glow = 14,
			attract = {
				kind = "point",
				strength = -7,
				origin = pos,
			},
			radius = 0.1,
			vel = vector.new(0,0,0),
			acc = vector.new(0,0,0),
		})
		minetest.chat_send_player(name, minetest.colorize("purple", "Initializing Teleport..."))
		for i = 1, 5 do
			minetest.after(i, function()
				minetest.chat_send_player(name, minetest.colorize("purple", 6 - i))
			end, name)
		end
		minetest.after(6, function()
			minetest.chat_send_all(minetest.colorize("blue", name .. " has teleported!"))
			player:set_pos({x = -18.5, y = 30082, z = -4.5})
			meta:set_string("tower:realm", "obstacle1")
		end)
		minetest.after(10, function()
			minetest.chat_send_player(name, "Welcome to the obstacle course!\n" ..
				"In order to progress, you need to complete it. Good luck!\n" ..
				"Start by opening one of the sandstone doors by rightclicking on it.")
		end)
	end
end)

minetest.register_node("old_old_mapgen:floatlands_teleporter", {
	description = "Teleporter to the Floatlands",
	drawtype = "mesh",
	mesh = "old_old_mapgen_teleporter.obj",
	tiles = {"old_old_mapgen_tower_controller.png"},
	on_rightclick = function(pos, node, clicker)
		if not clicker:is_player() then
			return
		end
		local meta = clicker:get_meta()
		if meta:get_string("tower:teleporting") == "floatlands" then
			minetest.chat_send_player(clicker:get_player_name(),
				minetest.colorize("yellow", "Already teleporting!"))
			-- In case there's a bug or the player leaves before teleporting...
			minetest.after(7, function()
				if clicker and clicker:is_player() then
					clicker:get_meta():set_string("tower:teleporting", "")
				end
			end)
			return
		end
		meta:set_string("tower:teleporting", "floatlands")
		minetest.chat_send_player(clicker:get_player_name(),
			minetest.colorize("yellow", "Preparing teleport...."))
		minetest.add_particlespawner({
			amount = 2500,
			time = 10,
			exptime = 7,
			pos = {
				min = {x = pos.x - 0.5, y = pos.y, z = pos.z - 0.5},
				max = {x = pos.x + 0.5, y = pos.y, z = pos.z + 0.5},
			},
			texpool = {
				"default_gold_block.png",
			},
			glow = 14,
			attract = {
				kind = "point",
				strength = 0.5,
				origin = {x=pos.x, y = pos.y+30, z = pos.z},
				direction = vector.new(0,1,0),
			},
			vel = vector.new(0,0,0),
			acc = vector.new(0,0,0),
		})
		minetest.after(7, function()
			if clicker and clicker:is_player() then
				meta = clicker:get_meta()
				meta:set_string("tower:teleporting", "")
				meta:set_string("tower:realm", "floatlands")
				old_old_mapgen.spawn_floatlands(clicker)
				clicker:set_physics_override({gravity = 0.55})
				minetest.chat_send_player(clicker:get_player_name(),
					minetest.colorize("yellow", "Teleported to the floatlands! Good luck!"))
			end
		end)
	end,
	use_texture_alpha = "clip",
	groups = {not_in_creative_inventory = 1, undigable = 1},
})
