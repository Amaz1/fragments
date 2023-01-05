minetest.register_node("fragments:stone_with_amethyst", {
	description = "Amethyst Ore",
	tiles = {"default_stone.png^fragments_mineral_amethyst.png"},
	groups = {crumbly = 1, cracky = 3},
	drop = {
		items = {
			{
				rarity = 1,
				items = {"fragments:amethyst_crystal"},
			},
		},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("fragments:amethyst_crystal", {
	description = "Amethyst Crystal",
	inventory_image = "fragments_amethyst_crystal.png",
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "fragments:stone_with_amethyst",
	wherein        = "default:stone",
	clust_scarcity = 17 * 17 * 17,
	clust_num_ores = 5,
	clust_size     = 5,
	y_max          = 5000,
	y_min          = 250,
})

minetest.register_node("fragments:amethyst", {
	description = "Amethyst",
	drawtype = "glasslike",
	tiles = {"fragments_amethyst.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	is_ground_content = true,
	sunlight_propagates = true,
	groups = {cracky = 2},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_craft({
	output = "fragments:amethyst",
	recipe = {
		{"fragments:amethyst_crystal", "fragments:amethyst_crystal", "fragments:amethyst_crystal"},
		{"fragments:amethyst_crystal", "fragments:amethyst_crystal", "fragments:amethyst_crystal"},
		{"fragments:amethyst_crystal", "fragments:amethyst_crystal", "fragments:amethyst_crystal"},
	}
})

minetest.register_node("fragments:lapis_lazuli", {
	description = "Lapis Lazuli",
	tiles = {"fragments_lapis_lazuli.png"},
	is_ground_content = true,
	groups = {cracky = 2},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craftitem("fragments:lapis_chunk", {
	description = "Lapis Lazuli Chunk",
	inventory_image = "fragments_lapis_chunk.png",
})

minetest.register_node("fragments:desert_stone_with_lapis", {
	description = "Lapis Lazuli Ore",
	tiles = {"default_desert_stone.png^fragments_mineral_lapis.png"},
	groups = {cracky = 2},
	drop = {
		items = {
			{
				rarity = 1,
				items = {"fragments:lapis_chunk"},
			},
		},
	},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "fragments:desert_stone_with_lapis",
	wherein        = "default:desert_stone",
	clust_scarcity = 10 * 10 * 10,
	clust_num_ores = 2,
	clust_size     = 3,
	y_max          = 5000,
	y_min          = 250,
})

minetest.register_craft({
	output = "fragments:lapis_lazuli",
	recipe = {
		{"fragments:lapis_chunk", "fragments:lapis_chunk", "fragments:lapis_chunk"},
		{"fragments:lapis_chunk", "fragments:lapis_chunk", "fragments:lapis_chunk"},
		{"fragments:lapis_chunk", "fragments:lapis_chunk", "fragments:lapis_chunk"},
	}
})

-- Unbreakable things for the tower

minetest.register_node("fragments:stone_brick", {
	description = "Unbreakable Stone Brick",
	tiles = {"default_stone_brick.png"},
	liquids_pointable = true,
	sounds = default.node_sound_stone_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1},
})

minetest.register_node("fragments:stone_brick_fake", {
	description = "Unbreakable Fake Stone Brick",
	walkable = false,
	sunlight_propagates = true,
	tiles = {"default_stone_brick.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1},
})

stairs.register_stair_and_slab("undigable_stone_brick",
	"fragments:stone_brick",
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
	"fragments:stone_block",
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
	"fragments:desert_stone_brick",
	{not_in_creative_inventory = 1, undigable = 1},
	{"default_desert_stone_brick.png"},
	"Desert Stone Brick Stair",
	"Desert Stone Brick Slab",
	default.node_sound_stone_defaults(),
	false,
	"Inner Desert Stone Brick Stair",
	"Outer Desert Stone Brick Stair"
)

minetest.register_node("fragments:sandstone_brick", {
	description = "Unbreakable Sandstone Brick",
	tiles = {"default_sandstone_brick.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1},
})

minetest.register_node("fragments:gold_block", {
	description = "Unbreakable Gold Block",
	tiles = {"default_gold_block.png"},
	sounds = default.node_sound_metal_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1},
})

minetest.register_node("fragments:undigable_amethyst", {
	description = "Amethyst",
	drawtype = "glasslike",
	tiles = {"fragments_amethyst.png"},
	paramtype = "light",
	use_texture_alpha = "blend",
	is_ground_content = true,
	sunlight_propagates = true,
	groups = {not_in_creative_inventory = 1, unbreakable = 1},
	sounds = default.node_sound_glass_defaults(),
})

minetest.register_node("fragments:undigable_lapis_lazuli", {
	description = "Lapis Lazuli",
	tiles = {"fragments_lapis_lazuli.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, unbreakable = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("fragments:mese", {
	description = "Mese",
	tiles = {"default_mese_block.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, unbreakable = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("fragments:diamond_block", {
	description = "Diamond",
	tiles = {"default_diamond_block.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, unbreakable = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("fragments:gold_block", {
	description = "Gold",
	tiles = {"default_gold_block.png"},
	is_ground_content = true,
	groups = {not_in_creative_inventory = 1, unbreakable = 1},
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("fragments:ladder_wood", {
	description = "Ladder",
	drawtype = "signlike",
	tiles = {"default_ladder_wood.png"},
	inventory_image = "default_ladder_wood.png",
	wield_image = "default_ladder_wood.png",
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	climbable = true,
	is_ground_content = false,
	selection_box = {
		type = "wallmounted",
	},
	groups = {undigable = 1, not_in_creative_inventory = 1},
	legacy_wallmounted = true,
	sounds = default.node_sound_wood_defaults(),
})

minetest.register_node("fragments:desert_sandstone_brick", {
	description = "Unbreakable Desert Sandstone Brick",
	tiles = {"default_desert_sandstone_brick.png"},
	sounds = default.node_sound_stone_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1},
})

minetest.register_node("fragments:teleport_door", {
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
						node = {name = "fragments:teleport_door"},
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

minetest.register_node("fragments:glass", {
	description = "Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"default_glass.png", "default_glass_detail.png"},
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1}
})

minetest.register_node("fragments:obsidian_glass", {
	description = "Glass",
	drawtype = "glasslike_framed_optional",
	tiles = {"default_obsidian_glass.png", "default_obsidian_glass_detail.png"},
	paramtype = "light",
	is_ground_content = false,
	sunlight_propagates = true,
	sounds = default.node_sound_glass_defaults(),
	groups = {not_in_creative_inventory = 1, undigable = 1}
})


minetest.register_node("fragments:glow_glass", {
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

minetest.register_node("fragments:void", {
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
