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
	liquids_pointable = true,
	sounds = default.node_sound_stone_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1},
})

minetest.register_node("old_old_mapgen:stone_brick_fake", {
	description = "Unbreakable Fake Stone Brick",
	walkable = false,
	sunlight_propagates = true,
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

minetest.register_node("old_old_mapgen:teleport_door", {
	description = "Unbreakable Teleporting Door",
	tiles = {"default_desert_sandstone_brick.png"},
	sounds = default.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, clicker)
		if clicker and clicker:is_player() then
			clicker:set_pos({x = pos.x + 1, y = pos.y, z = pos.z})
			minetest.add_particlespawner({
						amount = 100,
						time = 2,
						exptime = 1,
						collisiondetection = true,
						object_collision = true,
						bounce = 1,
						pos = vector.new(0,1,0),
						attached = clicker,
						node = {name = "old_old_mapgen:teleport_door"},
						minsize = 0.05,
						maxsize = 0.5,
						vel = {
							min = vector.new(-2,-2,-2),
							max = vector.new(2,2,2),
						},
						acc = {
							min = vector.new(-1,-1,-1),
							max = vector.new(1,1,1),
						}
					})
		end
	end,
	groups = {not_in_creative_inventory = 1, undigable = 1},
})

minetest.register_node("old_old_mapgen:glass", {
	description = "Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"default_glass.png", "default_glass_detail.png"},
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1, cracky = 2}
})

minetest.register_node("old_old_mapgen:obsidian_glass", {
	description = "Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"default_obsidian_glass.png", "default_obsidian_glass_detail.png"},
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1}
})


minetest.register_node("old_old_mapgen:glow_glass", {
	description = "glow Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"default_glass.png^[colorize:#E9CD61", "default_glass_detail.png^[colorize:#E9CD61"},
	paramtype = "light",
	is_ground_content = false,
	light_source = 7,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1},
})

minetest.register_node("old_old_mapgen:void", {
	description = "Damaging Void",
	drawtype = "airlike",
	tiles = {"blank.png"},
	inventory_image = "default_mese_block.png",
	paramtype = "light",
	sunlight_propagates = true,
	damage_per_second = 5,
	walkable = false,
	pointable = false,
	groups = {not_in_creative_inventory = 1, undigable = 1},
})
