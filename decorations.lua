minetest.clear_registered_decorations()

local path = minetest.get_modpath("ethereal") .. "/schematics/"
local dpath = minetest.get_modpath("default") .. "/schematics/"


-- load schematic tables
dofile(path .. "orange_tree.lua")
dofile(path .. "banana_tree.lua")
dofile(path .. "bamboo_tree.lua")
dofile(path .. "birch_tree.lua")
dofile(path .. "bush.lua")
dofile(path .. "waterlily.lua")
dofile(path .. "volcanom.lua")
dofile(path .. "volcanol.lua")
dofile(path .. "frosttrees.lua")
dofile(path .. "palmtree.lua")
dofile(path .. "pinetree.lua")
dofile(path .. "yellowtree.lua")
dofile(path .. "mushroomone.lua")
dofile(path .. "willow.lua")
dofile(path .. "bigtree.lua")
dofile(path .. "redwood_tree.lua")
dofile(path .. "redwood_small_tree.lua")
dofile(path .. "vinetree.lua")
dofile(path .. "sakura.lua")
dofile(path .. "igloo.lua")
dofile(path .. "lemon_tree.lua")
dofile(path .. "olive_tree.lua")


-- helper function
local add_schem = function(a, b, c, d, e, f, g, h, i, j, k)

	-- if not 1 then biome disabled, don't add
	if g ~= 1 then return end

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = a,
		sidelen = 80,
		fill_ratio = b,
		biomes = c,
		y_min = d,
		y_max = e,
		schematic = f,
		flags = "place_center_x, place_center_z",
		replacements = h,
		spawn_by = i,
		num_spawn_by = j,
		rotation = k
	})
end


-- igloo
add_schem("default:snowblock", 0.0005, {"glacier"}, 22900, 25100,
	ethereal.igloo, ethereal.glacier, nil, "default:snowblock", 8, "random")

-- sakura tree
add_schem({"ethereal:bamboo_dirt"}, 0.001, {"sakura"}, 22900, 25100,
	ethereal.sakura_tree, ethereal.sakura, nil,
	"ethereal:bamboo_dirt", 6)

-- redwood tree
add_schem({"default:dirt_with_dry_grass"}, 0.0025, {"mesa"}, 22900, 25100,
	ethereal.redwood_tree, ethereal.mesa, nil,
	"default:dirt_with_dry_grass", 8)

-- banana tree
add_schem({"ethereal:grove_dirt"}, 0.015, {"grove"}, 22900, 25100,
	ethereal.bananatree, ethereal.grove)

-- healing tree
add_schem({"default:dirt_with_snow"}, 0.01, {"taiga"}, 22900, 25100,
	ethereal.yellowtree, ethereal.alpine, nil, "default:dirt_with_snow", 8)

-- crystal frost tree
add_schem({"ethereal:crystal_dirt"}, 0.01, {"frost", "frost_floatland"}, 22900, 25100,
	ethereal.frosttrees, ethereal.frost, nil,
	"ethereal:crystal_dirt", 8)

-- giant mushroom
add_schem("ethereal:mushroom_dirt", 0.02, {"mushroom"}, 22900, 25100,
	ethereal.mushroomone, ethereal.mushroom, nil,
	"ethereal:mushroom_dirt", 8)

-- small lava crater
add_schem("ethereal:fiery_dirt", 0.01, {"fiery"}, 22900, 25100,
	ethereal.volcanom, ethereal.fiery, nil, "ethereal:fiery_dirt", 8)

-- large lava crater
add_schem("ethereal:fiery_dirt", 0.003, {"fiery"}, 22900, 25100,
	ethereal.volcanol, ethereal.fiery, nil, "ethereal:fiery_dirt", 8, "random")

-- default jungle tree
add_schem({"ethereal:jungle_dirt", "default:dirt_with_rainforest_litter"},
	0.08, {"junglee"}, 22900, 25100, dpath .. "jungle_tree.mts", ethereal.junglee)

-- willow tree
add_schem({"ethereal:gray_dirt"}, 0.02, {"grayness"}, 22900, 25100,
	ethereal.willow, ethereal.grayness, nil,
	"ethereal:gray_dirt", 6)

-- default large pine tree for lower elevation
add_schem({"ethereal:cold_dirt", "default:dirt_with_coniferous_litter"},
	0.025, {"coniferous_forest"}, 22900, 25100, ethereal.pinetree, ethereal.snowy)

-- small pine for higher elevation
add_schem({"default:dirt_with_snow"}, 0.025, {"taiga"}, 22900, 25100,
	ethereal.pinetree, ethereal.alpine)

-- default apple tree
add_schem({"default:dirt_with_grass"}, 0.025, {"jumble", "deciduous_forest"}, 22900, 25100,
	dpath .. "apple_tree.mts", ethereal.grassy)

-- big old tree
add_schem({"default:dirt_with_grass"}, 0.001, {"jumble"}, 22900, 25100,
	ethereal.bigtree, ethereal.jumble, nil,
	"default:dirt_with_grass", 8)

-- default aspen tree
add_schem({"default:dirt_with_grass"}, 0.02, {"grassytwo"}, 22900, 25100,
	dpath .. "aspen_tree.mts", ethereal.jumble)

-- birch tree
add_schem({"default:dirt_with_grass"}, 0.02, {"grassytwo"}, 22900, 25100,
	ethereal.birchtree, ethereal.grassytwo)

-- orange tree
add_schem({"ethereal:prairie_dirt"}, 0.01, {"prairie"}, 22900, 25100,
	ethereal.orangetree, ethereal.prairie)

-- default acacia tree
add_schem({"default:dry_dirt_with_dry_grass",
	"default:dirt_with_dry_grass"}, 0.004, {"savanna"}, 22900, 25100,
	dpath .. "acacia_tree.mts", ethereal.savanna)

-- palm tree
add_schem("default:sand", 0.0025, {"desert_ocean", "plains_ocean", "sandclay",
	"sandstone_ocean", "mesa_ocean", "grove_ocean", "deciduous_forest_ocean"}, 22900, 25100,
	ethereal.palmtree, 1)

-- bamboo tree
add_schem({"ethereal:bamboo_dirt"}, 0.025, {"bamboo"}, 22900, 25100,
	ethereal.bambootree, ethereal.bamboo)

-- bush
add_schem({"ethereal:bamboo_dirt"}, 0.08, {"bamboo"}, 22900, 25100, ethereal.bush,
	ethereal.bamboo)

-- vine tree
add_schem({"default:dirt_with_grass"}, 0.02, {"swamp"}, 22900, 25100,
	ethereal.vinetree, ethereal.swamp)

-- lemon tree
add_schem({"ethereal:grove_dirt"}, 0.002, {"mediterranean"}, 22900, 25100,
	ethereal.lemontree, ethereal.mediterranean)

-- olive tree
add_schem({"ethereal:grove_dirt"}, 0.002, {"mediterranean"}, 22900, 25100,
	ethereal.olivetree, ethereal.mediterranean)


-- default large cactus
if ethereal.desert == 1 then

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:desert_sand"},
		sidelen = 80,
		noise_params = {
			offset = -0.0005,
			scale = 0.0015,
			spread = {x = 200, y = 200, z = 200},
			seed = 230,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"desert"},
		y_min = 22900,
		y_max = 25100,
		schematic = dpath .. "large_cactus.mts",
		flags = "place_center_x",
		rotation = "random",
	})
end


-- default bush
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass", "default:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 137,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"deciduous_forest", "grassytwo", "jumble"},
	y_min = 22900,
	y_max = 25100,
	schematic = dpath .. "bush.mts",
	flags = "place_center_x, place_center_z"
})


-- default acacia bush
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {
		"default:dirt_with_dry_grass", "default:dry_dirt_with_dry_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 90155,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"savanna", "mesa"},
	y_min = 22900,
	y_max = 25100,
	schematic = dpath .. "acacia_bush.mts",
	flags = "place_center_x, place_center_z"
})


-- default pine bush
if minetest.registered_nodes["default:pine_bush"] then

	minetest.register_decoration({
		name = "default:pine_bush",
		deco_type = "schematic",
		place_on = {"default:dirt_with_snow"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 137,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"taiga"},
		y_min = 22900,
		y_max = 25100,
		schematic = dpath .. "pine_bush.mts",
		flags = "place_center_x, place_center_z"
	})
end


-- default blueberry bush
if minetest.registered_nodes["default:blueberry_bush_leaves"] then

	minetest.register_decoration({
		name = "default:blueberry_bush",
		deco_type = "schematic",
		place_on = {
			"default:dirt_with_coniferous_litter", "default:dirt_with_snow"},
		sidelen = 16,
		noise_params = {
			offset = -0.004,
			scale = 0.01,
			spread = {x = 100, y = 100, z = 100},
			seed = 697,
			octaves = 3,
			persist = 0.7,
		},
		biomes = {"coniferous_forest", "taiga"},
		y_min = 22900,
		y_max = 25100,
		place_offset_y = 1,
		schematic = dpath .. "blueberry_bush.mts",
		flags = "place_center_x, place_center_z"
	})
end


-- place waterlily in beach areas
minetest.register_decoration({
	deco_type = "schematic",
	place_on = {"default:sand"},
	sidelen = 16,
	noise_params = {
		offset = -0.12,
		scale = 0.3,
		spread = {x = 200, y = 200, z = 200},
		seed = 33,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"desert_ocean", "plains_ocean", "sandclay",
		"mesa_ocean", "grove_ocean", "deciduous_forest_ocean", "swamp_ocean"},
	y_min = 22900,
	y_max = 25100,
	schematic = ethereal.waterlily,
	rotation = "random"
})


-- coral reef
if ethereal.reefs == 1 then

	-- override corals so crystal shovel can pick them up intact
	minetest.override_item("default:coral_skeleton", {groups = {crumbly = 3}})
	minetest.override_item("default:coral_orange", {groups = {crumbly = 3}})
	minetest.override_item("default:coral_brown", {groups = {crumbly = 3}})

	minetest.register_decoration({
		deco_type = "schematic",
		place_on = {"default:sand"},
		noise_params = {
			offset = -0.15,
			scale = 0.1,
			spread = {x = 100, y = 100, z = 100},
			seed = 7013,
			octaves = 3,
			persist = 1,
		},
		biomes = {"desert_ocean", "grove_ocean"},
		y_min = -8,
		y_max = -2,
		schematic = path .. "corals.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random"
	})
end

local function register_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		name = "default:grass_" .. length,
		deco_type = "simple",
		place_on = {"default:dirt_with_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"grassland", "deciduous_forest"},
		y_max = 3000,
		y_min = 1,
		decoration = "default:grass_" .. length,
	})
end

local function register_dry_grass_decoration(offset, scale, length)
	minetest.register_decoration({
		name = "default:dry_grass_" .. length,
		deco_type = "simple",
		place_on = {"default:dry_dirt_with_dry_grass"},
		sidelen = 16,
		noise_params = {
			offset = offset,
			scale = scale,
			spread = {x = 200, y = 200, z = 200},
			seed = 329,
			octaves = 3,
			persist = 0.6
		},
		biomes = {"savanna"},
		y_max = 3000,
		y_min = 1,
		decoration = "default:dry_grass_" .. length,
	})
end

local function register_fern_decoration(seed, length)
	minetest.register_decoration({
		name = "default:fern_" .. length,
		deco_type = "simple",
		place_on = {"default:dirt_with_coniferous_litter"},
		sidelen = 16,
		noise_params = {
			offset = 0,
			scale = 0.2,
			spread = {x = 100, y = 100, z = 100},
			seed = seed,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"coniferous_forest"},
		y_max = 3000,
		y_min = 6,
		decoration = "default:fern_" .. length,
	})
end

-- Savanna bare dirt patches.
-- Must come before all savanna decorations that are placed on dry grass.
-- Noise is similar to long dry grass noise, but scale inverted, to appear
-- where long dry grass is least dense and shortest.

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:dry_dirt_with_dry_grass"},
	sidelen = 4,
	noise_params = {
		offset = -1.5,
		scale = -1.5,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 4,
		persist = 1.0
	},
	biomes = {"savanna"},
	y_max = 3000,
	y_min = 1,
	decoration = "default:dry_dirt",
	place_offset_y = -1,
	flags = "force_placement",
})

-- Apple tree and log

minetest.register_decoration({
	name = "default:apple_tree",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.024,
		scale = 0.015,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"deciduous_forest"},
	y_max = 3000,
	y_min = 1,
	schematic = minetest.get_modpath("default") .. "/schematics/apple_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
	name = "default:apple_log",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	place_offset_y = 1,
	sidelen = 16,
	noise_params = {
		offset = 0.0012,
		scale = 0.0007,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"deciduous_forest"},
	y_max = 3000,
	y_min = 1,
	schematic = minetest.get_modpath("default") .. "/schematics/apple_log.mts",
	flags = "place_center_x",
	rotation = "random",
	spawn_by = "default:dirt_with_grass",
	num_spawn_by = 8,
})

-- Emergent jungle tree
-- Due to 32 node height, altitude is limited and prescence depends on chunksize

local chunksize = tonumber(minetest.get_mapgen_setting("chunksize"))
if chunksize >= 5 then
	minetest.register_decoration({
		name = "default:emergent_jungle_tree",
		deco_type = "schematic",
		place_on = {"default:dirt_with_rainforest_litter"},
		sidelen = 80,
		noise_params = {
			offset = 0.0,
			scale = 0.0025,
			spread = {x = 250, y = 250, z = 250},
			seed = 2685,
			octaves = 3,
			persist = 0.7
		},
		biomes = {"rainforest"},
		y_max = 32,
		y_min = 1,
		schematic = minetest.get_modpath("default") ..
				"/schematics/emergent_jungle_tree.mts",
		flags = "place_center_x, place_center_z",
		rotation = "random",
		place_offset_y = -4,
	})
end

-- Jungle tree and log

minetest.register_decoration({
	name = "default:jungle_tree",
	deco_type = "schematic",
	place_on = {"default:dirt_with_rainforest_litter"},
	sidelen = 80,
	fill_ratio = 0.1,
	biomes = {"rainforest"},
	y_max = 3000,
	y_min = 1,
	schematic = minetest.get_modpath("default") .. "/schematics/jungle_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

-- Swamp jungle trees

minetest.register_decoration({
	name = "default:jungle_tree(swamp)",
	deco_type = "schematic",
	place_on = {"default:dirt"},
	sidelen = 16,
	-- Noise tuned to place swamp trees where papyrus is absent
	noise_params = {
		offset = 0.0,
		scale = -0.1,
		spread = {x = 200, y = 200, z = 200},
		seed = 354,
		octaves = 1,
		persist = 0.5
	},
	biomes = {"rainforest_swamp"},
	y_max = 0,
	y_min = -1,
	schematic = minetest.get_modpath("default") .. "/schematics/jungle_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
	name = "default:jungle_log",
	deco_type = "schematic",
	place_on = {"default:dirt_with_rainforest_litter"},
	place_offset_y = 1,
	sidelen = 80,
	fill_ratio = 0.005,
	biomes = {"rainforest"},
	y_max = 3000,
	y_min = 1,
	schematic = minetest.get_modpath("default") .. "/schematics/jungle_log.mts",
	flags = "place_center_x",
	rotation = "random",
	spawn_by = "default:dirt_with_rainforest_litter",
	num_spawn_by = 8,
})

-- Taiga and temperate coniferous forest pine tree, small pine tree and log

minetest.register_decoration({
	name = "default:pine_tree",
	deco_type = "schematic",
	place_on = {"default:dirt_with_snow", "default:dirt_with_coniferous_litter"},
	sidelen = 16,
	noise_params = {
		offset = 0.010,
		scale = 0.048,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"taiga", "coniferous_forest"},
	y_max = 3000,
	y_min = 4,
	schematic = minetest.get_modpath("default") .. "/schematics/pine_tree.mts",
	flags = "place_center_x, place_center_z",
})

minetest.register_decoration({
	name = "default:small_pine_tree",
	deco_type = "schematic",
	place_on = {"default:dirt_with_snow", "default:dirt_with_coniferous_litter"},
	sidelen = 16,
	noise_params = {
		offset = 0.010,
		scale = -0.048,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"taiga", "coniferous_forest"},
	y_max = 3000,
	y_min = 4,
	schematic = minetest.get_modpath("default") .. "/schematics/small_pine_tree.mts",
	flags = "place_center_x, place_center_z",
})

minetest.register_decoration({
	name = "default:pine_log",
	deco_type = "schematic",
	place_on = {"default:dirt_with_snow", "default:dirt_with_coniferous_litter"},
	place_offset_y = 1,
	sidelen = 80,
	fill_ratio = 0.0018,
	biomes = {"taiga", "coniferous_forest"},
	y_max = 3000,
	y_min = 4,
	schematic = minetest.get_modpath("default") .. "/schematics/pine_log.mts",
	flags = "place_center_x",
	rotation = "random",
	spawn_by = {"default:dirt_with_snow", "default:dirt_with_coniferous_litter"},
	num_spawn_by = 8,
})

-- Acacia tree and log

minetest.register_decoration({
	name = "default:acacia_tree",
	deco_type = "schematic",
	place_on = {"default:dry_dirt_with_dry_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.002,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"savanna"},
	y_max = 3000,
	y_min = 1,
	schematic = minetest.get_modpath("default") .. "/schematics/acacia_tree.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

minetest.register_decoration({
	name = "default:acacia_log",
	deco_type = "schematic",
	place_on = {"default:dry_dirt_with_dry_grass"},
	place_offset_y = 1,
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.001,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"savanna"},
	y_max = 3000,
	y_min = 1,
	schematic = minetest.get_modpath("default") .. "/schematics/acacia_log.mts",
	flags = "place_center_x",
	rotation = "random",
	spawn_by = "default:dry_dirt_with_dry_grass",
	num_spawn_by = 8,
})

-- Aspen tree and log

minetest.register_decoration({
	name = "default:aspen_tree",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = 0.0,
		scale = -0.015,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"deciduous_forest"},
	y_max = 1000,
	y_min = 1,
	schematic = minetest.get_modpath("default") .. "/schematics/aspen_tree.mts",
	flags = "place_center_x, place_center_z",
})

minetest.register_decoration({
	name = "default:aspen_log",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	place_offset_y = 1,
	sidelen = 16,
	noise_params = {
		offset = 0.0,
		scale = -0.0008,
		spread = {x = 250, y = 250, z = 250},
		seed = 2,
		octaves = 3,
		persist = 0.66
	},
	biomes = {"deciduous_forest"},
	y_max = 3000,
	y_min = 1,
	schematic = minetest.get_modpath("default") .. "/schematics/aspen_log.mts",
	flags = "place_center_x",
	rotation = "random",
	spawn_by = "default:dirt_with_grass",
	num_spawn_by = 8,
})

-- Large cactus

minetest.register_decoration({
	name = "default:large_cactus",
	deco_type = "schematic",
	place_on = {"default:desert_sand"},
	sidelen = 16,
	noise_params = {
		offset = -0.0003,
		scale = 0.0009,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"desert"},
	y_max = 3000,
	y_min = 4,
	schematic = minetest.get_modpath("default") .. "/schematics/large_cactus.mts",
	flags = "place_center_x, place_center_z",
	rotation = "random",
})

-- Cactus

minetest.register_decoration({
	name = "default:cactus",
	deco_type = "simple",
	place_on = {"default:desert_sand"},
	sidelen = 16,
	noise_params = {
		offset = -0.0003,
		scale = 0.0009,
		spread = {x = 200, y = 200, z = 200},
		seed = 230,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"desert"},
	y_max = 3000,
	y_min = 4,
	decoration = "default:cactus",
	height = 2,
	height_max = 5,
})

-- Papyrus

-- Dirt version for rainforest swamp

minetest.register_decoration({
	name = "default:papyrus_on_dirt",
	deco_type = "schematic",
	place_on = {"default:dirt"},
	sidelen = 16,
	noise_params = {
		offset = -0.3,
		scale = 0.7,
		spread = {x = 200, y = 200, z = 200},
		seed = 354,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"rainforest_swamp"},
	y_max = 0,
	y_min = 0,
	schematic = minetest.get_modpath("default") .. "/schematics/papyrus_on_dirt.mts",
})

-- Dry dirt version for savanna shore

minetest.register_decoration({
	name = "default:papyrus_on_dry_dirt",
	deco_type = "schematic",
	place_on = {"default:dry_dirt"},
	sidelen = 16,
	noise_params = {
		offset = -0.3,
		scale = 0.7,
		spread = {x = 200, y = 200, z = 200},
		seed = 354,
		octaves = 3,
		persist = 0.7
	},
	biomes = {"savanna_shore"},
	y_max = 0,
	y_min = 0,
	schematic = minetest.get_modpath("default") ..
		"/schematics/papyrus_on_dry_dirt.mts",
})

-- Bush

minetest.register_decoration({
	name = "default:bush",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 137,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"grassland", "deciduous_forest"},
	y_max = 3000,
	y_min = 1,
	schematic = minetest.get_modpath("default") .. "/schematics/bush.mts",
	flags = "place_center_x, place_center_z",
})

-- Blueberry bush

minetest.register_decoration({
	name = "default:blueberry_bush",
	deco_type = "schematic",
	place_on = {"default:dirt_with_grass", "default:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 697,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"grassland", "snowy_grassland"},
	y_max = 3000,
	y_min = 1,
	place_offset_y = 1,
	schematic = minetest.get_modpath("default") .. "/schematics/blueberry_bush.mts",
	flags = "place_center_x, place_center_z",
})

-- Acacia bush

minetest.register_decoration({
	name = "default:acacia_bush",
	deco_type = "schematic",
	place_on = {"default:dry_dirt_with_dry_grass"},
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 90155,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"savanna"},
	y_max = 3000,
	y_min = 1,
	schematic = minetest.get_modpath("default") .. "/schematics/acacia_bush.mts",
	flags = "place_center_x, place_center_z",
})

-- Pine bush

minetest.register_decoration({
	name = "default:pine_bush",
	deco_type = "schematic",
	place_on = {"default:dirt_with_snow"},
	sidelen = 16,
	noise_params = {
		offset = -0.004,
		scale = 0.01,
		spread = {x = 100, y = 100, z = 100},
		seed = 137,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {"taiga", "snowy_grassland"},
	y_max = 3000,
	y_min = 4,
	schematic = minetest.get_modpath("default") .. "/schematics/pine_bush.mts",
	flags = "place_center_x, place_center_z",
})

-- Grasses

register_grass_decoration(-0.03,  0.09,  5)
register_grass_decoration(-0.015, 0.075, 4)
register_grass_decoration(0,      0.06,  3)
register_grass_decoration(0.015,  0.045, 2)
register_grass_decoration(0.03,   0.03,  1)

-- Dry grasses

register_dry_grass_decoration(0.01, 0.05,  5)
register_dry_grass_decoration(0.03, 0.03,  4)
register_dry_grass_decoration(0.05, 0.01,  3)
register_dry_grass_decoration(0.07, -0.01, 2)
register_dry_grass_decoration(0.09, -0.03, 1)

-- Ferns

register_fern_decoration(14936, 3)
register_fern_decoration(801,   2)
register_fern_decoration(5,     1)

-- Junglegrass

minetest.register_decoration({
	name = "default:junglegrass",
	deco_type = "simple",
	place_on = {"default:dirt_with_rainforest_litter"},
	sidelen = 80,
	fill_ratio = 0.1,
	biomes = {"rainforest"},
	y_max = 3000,
	y_min = 1,
	decoration = "default:junglegrass",
})

-- Dry shrub

minetest.register_decoration({
	name = "default:dry_shrub",
	deco_type = "simple",
	place_on = {"default:desert_sand",
		"default:sand", "default:silver_sand"},
	sidelen = 16,
	noise_params = {
		offset = 0,
		scale = 0.02,
		spread = {x = 200, y = 200, z = 200},
		seed = 329,
		octaves = 3,
		persist = 0.6
	},
	biomes = {"desert", "sandstone_desert", "cold_desert"},
	y_max = 3000,
	y_min = 2,
	decoration = "default:dry_shrub",
	param2 = 4,
})

-- Marram grass

minetest.register_decoration({
	name = "default:marram_grass",
	deco_type = "simple",
	place_on = {"default:sand"},
	sidelen = 4,
	noise_params = {
		offset = -0.7,
		scale = 4.0,
		spread = {x = 16, y = 16, z = 16},
		seed = 513337,
		octaves = 1,
		persist = 0.0,
		flags = "absvalue, eased"
	},
	biomes = {"coniferous_forest_dunes", "grassland_dunes"},
	y_max = 6,
	y_min = 4,
	decoration = {
		"default:marram_grass_1",
		"default:marram_grass_2",
		"default:marram_grass_3",
	},
})

-- Tundra moss

minetest.register_decoration({
	deco_type = "simple",
	place_on = {"default:permafrost_with_stones"},
	sidelen = 4,
	noise_params = {
		offset = -0.8,
		scale = 2.0,
		spread = {x = 100, y = 100, z = 100},
		seed = 53995,
		octaves = 3,
		persist = 1.0
	},
	biomes = {"tundra"},
	y_max = 50,
	y_min = 2,
	decoration = "default:permafrost_with_moss",
	place_offset_y = -1,
	flags = "force_placement",
})

-- Tundra patchy snow

minetest.register_decoration({
	deco_type = "simple",
	place_on = {
		"default:permafrost_with_moss",
		"default:permafrost_with_stones",
		"default:stone",
		"default:gravel"
	},
	sidelen = 4,
	noise_params = {
		offset = 0,
		scale = 1.0,
		spread = {x = 100, y = 100, z = 100},
		seed = 172555,
		octaves = 3,
		persist = 1.0
	},
	biomes = {"tundra", "tundra_beach"},
	y_max = 50,
	y_min = 1,
	decoration = "default:snow",
})

-- Coral reef

minetest.register_decoration({
	name = "default:corals",
	deco_type = "simple",
	place_on = {"default:sand"},
	place_offset_y = -1,
	sidelen = 4,
	noise_params = {
		offset = -4,
		scale = 4,
		spread = {x = 50, y = 50, z = 50},
		seed = 7013,
		octaves = 3,
		persist = 0.7,
	},
	biomes = {
		"desert_ocean",
		"savanna_ocean",
		"rainforest_ocean",
	},
	y_max = -2,
	y_min = -8,
	flags = "force_placement",
	decoration = {
		"default:coral_green", "default:coral_pink",
		"default:coral_cyan", "default:coral_brown",
		"default:coral_orange", "default:coral_skeleton",
	},
})

-- Kelp

minetest.register_decoration({
	name = "default:kelp",
	deco_type = "simple",
	place_on = {"default:sand"},
	place_offset_y = -1,
	sidelen = 16,
	noise_params = {
		offset = -0.04,
		scale = 0.1,
		spread = {x = 200, y = 200, z = 200},
		seed = 87112,
		octaves = 3,
		persist = 0.7
	},
	biomes = {
		"taiga_ocean",
		"snowy_grassland_ocean",
		"grassland_ocean",
		"coniferous_forest_ocean",
		"deciduous_forest_ocean",
		"sandstone_desert_ocean",
		"cold_desert_ocean"},
	y_max = -5,
	y_min = -10,
	flags = "force_placement",
	decoration = "default:sand_with_kelp",
	param2 = 48,
	param2_max = 96,
})


