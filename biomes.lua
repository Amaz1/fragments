-- Clear biomes for hight reasons
minetest.clear_registered_biomes()

-- Default Biomes:
minetest.register_biome({
	name = "icesheet",
	node_dust = "default:snowblock",
	node_top = "default:snowblock",
	depth_top = 1,
	node_filler = "default:snowblock",
	depth_filler = 3,
	node_stone = "default:cave_ice",
	node_water_top = "default:ice",
	depth_water_top = 10,
	node_river_water = "default:ice",
	node_riverbed = "default:gravel",
	depth_riverbed = 2,
	node_dungeon = "default:ice",
	node_dungeon_stair = "stairs:stair_ice",
	y_max = 3000,
	y_min = -8,
	heat_point = 0,
	humidity_point = 73,
})

minetest.register_biome({
	name = "icesheet_ocean",
	node_dust = "default:snowblock",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_water_top = "default:ice",
	depth_water_top = 10,
	node_cave_liquid = "default:water_source",
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = -9,
	y_min = -255,
	heat_point = 0,
	humidity_point = 73,
})

minetest.register_biome({
	name = "icesheet_under",
	node_cave_liquid = {"default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = -256,
	y_min = -31000,
	heat_point = 0,
	humidity_point = 73,
})

-- Tundra

minetest.register_biome({
	name = "tundra_highland",
	node_dust = "default:snow",
	node_riverbed = "default:gravel",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 3000,
	y_min = 47,
	heat_point = 0,
	humidity_point = 40,
})

minetest.register_biome({
	name = "tundra",
	node_top = "default:permafrost_with_stones",
	depth_top = 1,
	node_filler = "default:permafrost",
	depth_filler = 1,
	node_riverbed = "default:gravel",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	vertical_blend = 4,
	y_max = 46,
	y_min = 2,
	heat_point = 0,
	humidity_point = 40,
})

minetest.register_biome({
	name = "tundra_beach",
	node_top = "default:gravel",
	depth_top = 1,
	node_filler = "default:gravel",
	depth_filler = 2,
	node_riverbed = "default:gravel",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	vertical_blend = 1,
	y_max = 1,
	y_min = -3,
	heat_point = 0,
	humidity_point = 40,
})

minetest.register_biome({
	name = "tundra_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_riverbed = "default:gravel",
	depth_riverbed = 2,
	node_cave_liquid = "default:water_source",
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	vertical_blend = 1,
	y_max = -4,
	y_min = -255,
	heat_point = 0,
	humidity_point = 40,
})

minetest.register_biome({
	name = "tundra_under",
	node_cave_liquid = {"default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = -256,
	y_min = -31000,
	heat_point = 0,
	humidity_point = 40,
})

-- Taiga

minetest.register_biome({
	name = "taiga",
	node_dust = "default:snow",
	node_top = "default:dirt_with_snow",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 3000,
	y_min = 4,
	heat_point = 25,
	humidity_point = 70,
})

minetest.register_biome({
	name = "taiga_ocean",
	node_dust = "default:snow",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_cave_liquid = "default:water_source",
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	vertical_blend = 1,
	y_max = 3,
	y_min = -255,
	heat_point = 25,
	humidity_point = 70,
})

minetest.register_biome({
	name = "taiga_under",
	node_cave_liquid = {"default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = -256,
	y_min = -31000,
	heat_point = 25,
	humidity_point = 70,
})

-- Snowy grassland

minetest.register_biome({
	name = "snowy_grassland",
	node_dust = "default:snow",
	node_top = "default:dirt_with_snow",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 1,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 3000,
	y_min = 4,
	heat_point = 20,
	humidity_point = 35,
})

minetest.register_biome({
	name = "snowy_grassland_ocean",
	node_dust = "default:snow",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_cave_liquid = "default:water_source",
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	vertical_blend = 1,
	y_max = 3,
	y_min = -255,
	heat_point = 20,
	humidity_point = 35,
})

minetest.register_biome({
	name = "snowy_grassland_under",
	node_cave_liquid = {"default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = -256,
	y_min = -31000,
	heat_point = 20,
	humidity_point = 35,
})

-- Grassland

minetest.register_biome({
	name = "grassland",
	node_top = "default:dirt_with_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 1,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 3000,
	y_min = 6,
	heat_point = 50,
	humidity_point = 35,
})

minetest.register_biome({
	name = "grassland_dunes",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 2,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	vertical_blend = 1,
	y_max = 5,
	y_min = 4,
	heat_point = 50,
	humidity_point = 35,
})

minetest.register_biome({
	name = "grassland_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_cave_liquid = "default:water_source",
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 3,
	y_min = -255,
	heat_point = 50,
	humidity_point = 35,
})

minetest.register_biome({
	name = "grassland_under",
	node_cave_liquid = {"default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = -256,
	y_min = -31000,
	heat_point = 50,
	humidity_point = 35,
})

-- Coniferous forest

minetest.register_biome({
	name = "coniferous_forest",
	node_top = "default:dirt_with_coniferous_litter",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 3000,
	y_min = 6,
	heat_point = 45,
	humidity_point = 70,
})

minetest.register_biome({
	name = "coniferous_forest_dunes",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	vertical_blend = 1,
	y_max = 5,
	y_min = 4,
	heat_point = 45,
	humidity_point = 70,
})

minetest.register_biome({
	name = "coniferous_forest_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_cave_liquid = "default:water_source",
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 3,
	y_min = -255,
	heat_point = 45,
	humidity_point = 70,
})

minetest.register_biome({
	name = "coniferous_forest_under",
	node_cave_liquid = {"default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = -256,
	y_min = -31000,
	heat_point = 45,
	humidity_point = 70,
})

-- Deciduous forest

minetest.register_biome({
	name = "deciduous_forest",
	node_top = "default:dirt_with_grass",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 3000,
	y_min = 1,
	heat_point = 60,
	humidity_point = 68,
})

minetest.register_biome({
	name = "deciduous_forest_shore",
	node_top = "default:dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 0,
	y_min = -1,
	heat_point = 60,
	humidity_point = 68,
})

minetest.register_biome({
	name = "deciduous_forest_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_cave_liquid = "default:water_source",
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	vertical_blend = 1,
	y_max = -2,
	y_min = -255,
	heat_point = 60,
	humidity_point = 68,
})

minetest.register_biome({
	name = "deciduous_forest_under",
	node_cave_liquid = {"default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = -256,
	y_min = -31000,
	heat_point = 60,
	humidity_point = 68,
})

-- Desert

minetest.register_biome({
	name = "desert",
	node_top = "default:desert_sand",
	depth_top = 1,
	node_filler = "default:desert_sand",
	depth_filler = 1,
	node_stone = "default:desert_stone",
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:desert_stone",
	node_dungeon_stair = "stairs:stair_desert_stone",
	y_max = 3000,
	y_min = 4,
	heat_point = 92,
	humidity_point = 16,
})

minetest.register_biome({
	name = "desert_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_stone = "default:desert_stone",
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_cave_liquid = "default:water_source",
	node_dungeon = "default:desert_stone",
	node_dungeon_stair = "stairs:stair_desert_stone",
	vertical_blend = 1,
	y_max = 3,
	y_min = -255,
	heat_point = 92,
	humidity_point = 16,
})

minetest.register_biome({
	name = "desert_under",
	node_cave_liquid = {"default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = -256,
	y_min = -31000,
	heat_point = 92,
	humidity_point = 16,
})

-- Sandstone desert

minetest.register_biome({
	name = "sandstone_desert",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 1,
	node_stone = "default:sandstone",
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:sandstonebrick",
	node_dungeon_stair = "stairs:stair_sandstone_block",
	y_max = 3000,
	y_min = 4,
	heat_point = 60,
	humidity_point = 0,
})

minetest.register_biome({
	name = "sandstone_desert_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_stone = "default:sandstone",
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_cave_liquid = "default:water_source",
	node_dungeon = "default:sandstonebrick",
	node_dungeon_stair = "stairs:stair_sandstone_block",
	y_max = 3,
	y_min = -255,
	heat_point = 60,
	humidity_point = 0,
})

minetest.register_biome({
	name = "sandstone_desert_under",
	node_cave_liquid = {"default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = -256,
	y_min = -31000,
	heat_point = 60,
	humidity_point = 0,
})

-- Cold desert

minetest.register_biome({
	name = "cold_desert",
	node_top = "default:silver_sand",
	depth_top = 1,
	node_filler = "default:silver_sand",
	depth_filler = 1,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 3000,
	y_min = 4,
	heat_point = 40,
	humidity_point = 0,
})

minetest.register_biome({
	name = "cold_desert_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_cave_liquid = "default:water_source",
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	vertical_blend = 1,
	y_max = 3,
	y_min = -255,
	heat_point = 40,
	humidity_point = 0,
})

minetest.register_biome({
	name = "cold_desert_under",
	node_cave_liquid = {"default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = -256,
	y_min = -31000,
	heat_point = 40,
	humidity_point = 0,
})

-- Savanna

minetest.register_biome({
	name = "savanna",
	node_top = "default:dry_dirt_with_dry_grass",
	depth_top = 1,
	node_filler = "default:dry_dirt",
	depth_filler = 1,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 3000,
	y_min = 1,
	heat_point = 89,
	humidity_point = 42,
})

minetest.register_biome({
	name = "savanna_shore",
	node_top = "default:dry_dirt",
	depth_top = 1,
	node_filler = "default:dry_dirt",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 0,
	y_min = -1,
	heat_point = 89,
	humidity_point = 42,
})

minetest.register_biome({
	name = "savanna_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_cave_liquid = "default:water_source",
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	vertical_blend = 1,
	y_max = -2,
	y_min = -255,
	heat_point = 89,
	humidity_point = 42,
})

minetest.register_biome({
	name = "savanna_under",
	node_cave_liquid = {"default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = -256,
	y_min = -31000,
	heat_point = 89,
	humidity_point = 42,
})

-- Rainforest

minetest.register_biome({
	name = "rainforest",
	node_top = "default:dirt_with_rainforest_litter",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 3000,
	y_min = 1,
	heat_point = 86,
	humidity_point = 65,
})

minetest.register_biome({
	name = "rainforest_swamp",
	node_top = "default:dirt",
	depth_top = 1,
	node_filler = "default:dirt",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = 0,
	y_min = -1,
	heat_point = 86,
	humidity_point = 65,
})

minetest.register_biome({
	name = "rainforest_ocean",
	node_top = "default:sand",
	depth_top = 1,
	node_filler = "default:sand",
	depth_filler = 3,
	node_riverbed = "default:sand",
	depth_riverbed = 2,
	node_cave_liquid = "default:water_source",
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	vertical_blend = 1,
	y_max = -2,
	y_min = -255,
	heat_point = 86,
	humidity_point = 65,
})

minetest.register_biome({
	name = "rainforest_under",
	node_cave_liquid = {"default:water_source", "default:lava_source"},
	node_dungeon = "default:cobble",
	node_dungeon_alt = "default:mossycobble",
	node_dungeon_stair = "stairs:stair_cobble",
	y_max = -256,
	y_min = -31000,
	heat_point = 86,
	humidity_point = 65,
})

-- Ethereal:

local S = ethereal.intllib

-- helper strings
local tmp, tmp2

-- helper function
local add_biome = function(a, l, m, n, o, p, b, c, d, e, f, g, nd, na, ns)

	-- if not 1 then biome disabled, don't add
	if p ~= 1 then return end

	minetest.register_biome({
		name = a,
		node_dust = b,
		node_top = c,
		depth_top = d,
		node_filler = e,
		depth_filler = f,
		node_stone = g,
--		node_water_top = h,
--		depth_water_top = i,
--		node_water = j,
--		node_river_water = k,
		y_min = l,
		y_max = m,
		heat_point = n,
		humidity_point = o,

		node_dungeon = nd or "default:cobble",
		node_dungeon_alt = (nd and "") or "default:mossycobble",
		node_dungeon_stair = ns or "stairs:stair_cobble"
	})
end


-- always registered biomes
add_biome("mountain", 24900, 25500, 50, 50, 1,
	nil, "default:snow", 1, "default:snowblock", 2)

add_biome("grassland", -22900, 24800, 45, 65, 1,
	nil, "default:dirt_with_grass", 1, "default:dirt", 3)

add_biome("underground", 22700, 22750, 50, 50, 1,
	nil, nil, nil, nil, nil)


-- biomes with disable setting
tmp = "default:desert_stone"

add_biome("desert", 22900, 24000, 35, 20, ethereal.desert,
	nil, "default:desert_sand", 1, "default:desert_sand", 3, tmp,
	"default:desert_stone", nil, "stairs:stair_desert_stone")

add_biome("desert_ocean", 22700, 22750, 35, 20, ethereal.desert,
	nil, "default:sand", 1, "default:sand", 2, tmp,
	"default:desert_stone", nil, "stairs:stair_desert_stone")


add_biome("bamboo", 23700, 24400, 45, 75, ethereal.bamboo,
	nil, "ethereal:bamboo_dirt", 1, "default:dirt", 3)

add_biome("sakura", 22900, 24000, 45, 75, ethereal.sakura,
	nil, "ethereal:bamboo_dirt", 1, "default:dirt", 3)

add_biome("sakura_ocean", 22700, 22750, 45, 75, ethereal.sakura,
	nil, "default:sand", 1, "default:sand", 2)


add_biome("mesa", 22900, 24800, 25, 28, ethereal.mesa,
	nil, "default:dirt_with_dry_grass", 1, "bakedclay:orange", 15)

add_biome("mesa_ocean", 22700, 22750, 25, 28, ethereal.mesa,
	nil, "default:sand", 1, "default:sand", 2)


tmp = "default:dirt_with_coniferous_litter"

if not minetest.registered_nodes[tmp] then
	tmp = "ethereal:cold_dirt"
end

-- was 'snowy' biome
add_biome("coniferous_forest", 24000, 24850, 10, 40, ethereal.snowy,
	nil, tmp, 1, "default:dirt", 2)

add_biome("taiga", 24400, 25100, 10, 40, ethereal.alpine,
	nil, "default:dirt_with_snow", 1, "default:dirt", 2)


add_biome("frost_floatland", 24700, 25100, 10, 40, ethereal.frost,
	nil, "ethereal:crystal_dirt", 1, "default:dirt", 1)

add_biome("frost", 24100, 24800, 10, 40, ethereal.frost,
	nil, "ethereal:crystal_dirt", 1, "default:dirt", 3)

add_biome("frost_ocean", 22700, 22750, 10, 40, ethereal.frost,
	nil, "default:sand", 1, "default:sand", 2)


add_biome("deciduous_forest", 23500, 24300, 13, 40, ethereal.grassy,
	nil, "default:dirt_with_grass", 1, "default:dirt", 3)

tmp = "default:silver_sand"

if not minetest.registered_nodes[tmp] then
	tmp = "default:sand"
end

add_biome("grayness", 22900, 23900, 15, 30, ethereal.grayness,
	nil, "ethereal:gray_dirt", 1, "default:dirt", 3)

add_biome("grassytwo", 23200, 24100, 15, 40, ethereal.grassytwo,
	nil, "default:dirt_with_grass", 1, "default:dirt", 3)

add_biome("prairie", 23400, 24100, 20, 40, ethereal.prairie,
	nil, "ethereal:prairie_dirt", 1, "default:dirt", 3)

add_biome("jumble", 23300, 24200, 25, 50, ethereal.jumble,
	nil, "default:dirt_with_grass", 1, "default:dirt", 3)

tmp = "default:dirt_with_rainforest_litter"

if not minetest.registered_nodes[tmp] then
	tmp = "ethereal:jungle_dirt"
end

add_biome("junglee", 23100, 23900, 30, 60, ethereal.junglee,
	nil, tmp, 1, "default:dirt", 3)

add_biome("grove", 23600, 24200, 45, 35, ethereal.grove,
	nil, "ethereal:grove_dirt", 1, "default:dirt", 3)

add_biome("mediterranean", 23600, 24200, 20, 45, ethereal.mediterranean,
	nil, "ethereal:grove_dirt", 1, "default:dirt", 3)

add_biome("mushroom", 23100, 24100, 45, 55, ethereal.mushroom,
	nil, "ethereal:mushroom_dirt", 1, "default:dirt", 3)

add_biome("sandstone", 22900, 23700, 50, 20, ethereal.sandstone,
	nil, "default:sandstone", 1, "default:sandstone", 1, "default:sandstone",
	"default:sandstone", nil, "stairs:stair_sandstone")

add_biome("quicksand", 22900, 23250, 50, 38, ethereal.quicksand,
	nil, "ethereal:quicksand2", 3, "default:gravel", 1)


add_biome("plains", 23400, 24000, 65, 25, ethereal.plains,
	nil, "ethereal:dry_dirt", 1, "default:dirt", 3)

tmp = "default:dry_dirt_with_dry_grass"
tmp2 = "default:dry_dirt"

if not minetest.registered_nodes[tmp] then
	tmp = "default:dirt_with_dry_grass"
	tmp2 = "default:dirt"
end

add_biome("savanna", 22900, 24100, 55, 25, ethereal.savanna,
	nil, tmp, 1, tmp2, 3)

add_biome("fiery", 23090, 23700, 75, 10, ethereal.fiery,
	nil, "ethereal:fiery_dirt", 1, "default:dirt", 3)

add_biome("fiery_beach", 22900, 23100, 75, 10, ethereal.fiery,
	nil, "default:desert_sand", 1, "default:sand", 2)

add_biome("sandclay", 22900, 23200, 65, 2, ethereal.sandclay,
	nil, "default:sand", 3, "default:clay", 2)


add_biome("swamp", 22900, 23100, 80, 90, ethereal.swamp,
	nil, "default:dirt_with_grass", 1, "default:dirt", 3)

if ethereal.glacier == 1 then

	minetest.register_biome({
		name = "glacier",
		node_dust = "default:snowblock",
		node_top = "default:snowblock",
		depth_top = 1,
		node_filler = "default:snowblock",
		depth_filler = 3,
		node_stone = "default:ice",
		node_water_top = "default:ice",
		depth_water_top = 10,
		node_river_water = "default:ice",
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		node_dungeon = "ethereal:icebrick",
		node_dungeon_stair = "stairs:stair_ice",
		y_min = 24600,
		y_max = 25100,
		heat_point = 0,
		humidity_point = 50
	})
end


if ethereal.tundra == 1 and minetest.registered_nodes["default:permafrost"] then

	minetest.register_biome({
		name = "tundra_highland",
		node_dust = "default:snow",
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		y_max = 25100,
		y_min = 24750,
		heat_point = 0,
		humidity_point = 40
	})

	minetest.register_biome({
		name = "tundra",
		node_top = "default:permafrost_with_stones",
		depth_top = 1,
		node_filler = "default:permafrost",
		depth_filler = 1,
		node_riverbed = "default:gravel",
		depth_riverbed = 2,
		vertical_blend = 4,
		y_max = 25100,
		y_min = 24500,
		heat_point = 0,
		humidity_point = 40
	})
end
