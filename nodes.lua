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
					placer:set_pos({x = pointed_thing.under.x, y = pointed_thing.under.y, z = pointed_thing.under.z + 1})
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
	if time == 0 or (minetest.get_us_time() - time) > 30000000 then
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
		minetest.chat_send_player(name, minetest.colorize("purple", "Initializing Teleport..."))
		for i = 1, 5 do
			minetest.after(i, function()
				minetest.chat_send_player(name, minetest.colorize("purple", 6 - i))
			end, name)
		end
		minetest.after(6, function()
			minetest.chat_send_all(minetest.colorize("blue", name .. " has teleported!"))
			player:set_pos({x = 0, y = 20013, z = 0})
		end)
		minetest.after(10, function()
			minetest.chat_send_player(name, "Welcome to the infinite dungeon realm!\n" ..
				"This has not yet been implemented, so for the time being, well done, you win!\n" ..
				"Unless of course, somebody has beaten you to it...!\n" ..
				"Use " .. minetest.colorize("red", "/winners") .. " to see who has arrived here before!")
		end)
		winners[#winners + 1] = {name = name, time = os.time()}
		storage:set_string("winners", minetest.serialize(winners))
	end
end)

local winner_base = "size[13,8]" ..
	"hypertext[1,1;11.5,8;winners;" ..
	"<global margin=5 valign=top size=normal font=normal halign=left>" ..
	"<style size=20 color=Blue><b><u><center>Players who have arrived at the Dungeon Realm:</center></u></b></style>"

minetest.register_chatcommand("winners", {
	func = function(name)
		local winner = winner_base
		for i, v in ipairs(winners) do
			winner = winner .. "<style color=green>" .. v.name .. "<i>\t\t\t\t\t\t" ..
				os.date("%c", v.time) .. "</i></style>\n"
		end
		winner = winner .. "]"
		minetest.show_formspec(name, "winners", winner)
	end
})

minetest.register_node("old_old_mapgen:stone_with_amethyst", {
	description = "Amethyst Ore",
	tiles = {"default_stone.png^blocks_mineral_amethyst.png"},
	groups = {crumbly = 1, cracky = 3},
	drop = {
		items = {
			{
				rarity = 1,
				items = {"old_old_mapgen:amethyst_crystal"},
			},
		},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("old_old_mapgen:amethyst_crystal", {
	description = "Amethyst Crystal",
	inventory_image = "blocks_amethyst_crystal.png",
})


minetest.register_ore({
	ore_type       = "scatter",
	ore            = "old_old_mapgen:stone_with_amethyst",
	wherein        = "default:stone",
	clust_scarcity = 17 * 17 * 17,
	clust_num_ores = 5,
	clust_size     = 5,
	y_max          = 5000,
	y_min          = 250,
})

minetest.register_node("old_old_mapgen:amethyst", {
	description = "Amethyst",
	drawtype = "glasslike",
	tiles = {"blocks_amethyst.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	is_ground_content = true,
	sunlight_propagates = true,
	groups = {cracky = 2},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "old_old_mapgen:amethyst",
	recipe = {
		{"old_old_mapgen:amethyst_crystal", "old_old_mapgen:amethyst_crystal", "old_old_mapgen:amethyst_crystal"},
		{"old_old_mapgen:amethyst_crystal", "old_old_mapgen:amethyst_crystal", "old_old_mapgen:amethyst_crystal"},
		{"old_old_mapgen:amethyst_crystal", "old_old_mapgen:amethyst_crystal", "old_old_mapgen:amethyst_crystal"},
	}
})

minetest.register_node("old_old_mapgen:lapis_lazuli", {
	description = "Lapis Lazuli",
	tiles = {"blocks_lapis_lazuli.png"},
	is_ground_content = true,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("old_old_mapgen:lapis_chunk", {
	description = "Lapis Lazuli Chunk",
	inventory_image = "blocks_lapis_chunk.png",
})

minetest.register_node("old_old_mapgen:desert_stone_with_lapis", {
	description = "Lapis Lazuli Ore",
	tiles = {"default_desert_stone.png^blocks_mineral_lapis.png"},
	groups = {cracky = 2},
	drop = {
		items = {
			{
				rarity = 1,
				items = {"old_old_mapgen:lapis_chunk"},
			},
		},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "old_old_mapgen:desert_stone_with_lapis",
	wherein        = "default:desert_stone",
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 2,
	clust_size     = 3,
	y_max          = 5000,
	y_min          = 250,
})

minetest.register_craft({
	output = "old_old_mapgen:lapis_lazuli",
	recipe = {
		{"old_old_mapgen:lapis_chunk", "old_old_mapgen:lapis_chunk", "old_old_mapgen:lapis_chunk"},
		{"old_old_mapgen:lapis_chunk", "old_old_mapgen:lapis_chunk", "old_old_mapgen:lapis_chunk"},
		{"old_old_mapgen:lapis_chunk", "old_old_mapgen:lapis_chunk", "old_old_mapgen:lapis_chunk"},
	}
})

-- Unbreakable things for the tower

minetest.register_node("old_old_mapgen:stone_brick", {
	description = "Unbreakable Stone Brick",
	tiles = {"default_stone_brick.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1},
})

stairs.register_stair_and_slab("undigable_stone_brick",
	"old_old_mapgen:stone_brick",
	{not_in_creative_inventory = 1, undigable = 1},
	{"default_stone_brick.png"},
	"Stone Brick Stair",
	"Stone Brick Slab",
	default.node_sound_stone_defaults(),
	false,
	"Inner Stone Brick Stair",
	"Outer Stone Brick Stair"
)

stairs.register_stair_and_slab("undigable_stone_block",
	"old_old_mapgen:stone_block",
	{not_in_creative_inventory = 1, undigable = 1},
	{"default_stone_block.png"},
	"Stone Block Stair",
	"Stone Block Slab",
	default.node_sound_stone_defaults(),
	false,
	"Inner Stone Block Stair",
	"Outer Stone Block Stair"
)

stairs.register_stair_and_slab("undigable_desert_stone_brick",
	"old_old_mapgen:desert_stone_brick",
	{not_in_creative_inventory = 1, undigable = 1},
	{"default_desert_stone_brick.png"},
	"Desert Stone Brick Stair",
	"Desert Stone Brick Slab",
	default.node_sound_stone_defaults(),
	false,
	"Inner Desert Stone Brick Stair",
	"Outer Desert Stone Brick Stair"
)

minetest.register_node("old_old_mapgen:sandstone_brick", {
	description = "Unbreakable Sandstone Brick",
	tiles = {"default_sandstone_brick.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1},
})

minetest.register_node("old_old_mapgen:gold_block", {
	description = "Unbreakable Gold Block",
	tiles = {"default_gold_block.png"},
	sounds = default.node_sound_metal_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1},
})

minetest.register_node("old_old_mapgen:undigable_amethyst", {
	description = "Amethyst",
	drawtype = "glasslike",
	tiles = {"blocks_amethyst.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	is_ground_content = true,
	sunlight_propagates = true,
	groups = {not_in_creative_inventory = 1, unbreakable = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("old_old_mapgen:undigable_lapis_lazuli", {
	description = "Lapis Lazuli",
	tiles = {"blocks_lapis_lazuli.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, unbreakable = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("old_old_mapgen:mese", {
	description = "Mese",
	tiles = {"default_mese_block.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, unbreakable = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("old_old_mapgen:diamond_block", {
	description = "Diamond",
	tiles = {"default_diamond_block.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, unbreakable = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("old_old_mapgen:desert_sandstone_brick", {
	description = "Unbreakable Desert Sandstone Brick",
	tiles = {"default_desert_sandstone_brick.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1},
})

minetest.register_node("old_old_mapgen:obsidian_glass", {
	description = "Obsidian Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"default_obsidian_glass.png", "default_obsidian_glass_detail.png"},
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1},
})
