minetest.override_item("default:leaves", {
	drawtype = "allfaces_optional",
	visual_scale = 1,
	walkable = true,
})

-- default jungle tree leaves
minetest.override_item("default:jungleleaves", {
	drawtype = "allfaces_optional",
	visual_scale = 1,
	walkable = true,
})

-- default pine tree leaves
minetest.override_item("default:pine_needles", {
	drawtype = "allfaces_optional",
	visual_scale = 1,
	walkable = true,
	drop = {
		max_items = 1,
		items = {
			{items = {"default:pine_sapling"}, rarity = 20},
			{items = {"ethereal:pine_nuts"}, rarity = 5},
			{items = {"default:pine_needles"}}
		}
	}
})

-- default acacia tree leaves
minetest.override_item("default:acacia_leaves", {
	drawtype = "allfaces_optional",
	visual_scale = 1,
	walkable = true,
})

-- default aspen tree leaves
minetest.override_item("default:aspen_leaves", {
	drawtype = "allfaces_optional",
	visual_scale = 1,
	walkable = true,
})

-- willow twig
minetest.override_item("ethereal:willow_twig", {
	walkable = true,
})

-- redwood leaves
minetest.override_item("ethereal:redwood_leaves", {
	drawtype = "allfaces_optional",
	walkable = true,
	visual_scale = 1,
})

-- orange tree leaves
minetest.override_item("ethereal:orange_leaves", {
	drawtype = "allfaces_optional",
	walkable = true,
	visual_scale = 1,
})

-- banana tree leaves
minetest.override_item("ethereal:bananaleaves", {
	drawtype = "allfaces_optional",
	walkable = true,
	visual_scale = 1,
})

-- healing tree leaves
minetest.override_item("ethereal:yellowleaves", {
	drawtype = "allfaces_optional",
	walkable = true,
	visual_scale = 1,
})

-- palm tree leaves
minetest.override_item("ethereal:palmleaves", {
	drawtype = "allfaces_optional",
	walkable = true,
	visual_scale = 1,
})

-- birch tree leaves
minetest.override_item("ethereal:birch_leaves", {
	drawtype = "allfaces_optional",
	walkable = true,
	visual_scale = 1,
})

-- frost tree leaves
minetest.override_item("ethereal:frost_leaves", {
	drawtype = "allfaces_optional",
	walkable = true,
	visual_scale = 1,
})

-- bamboo stalk leaves
minetest.override_item("ethereal:bamboo_leaves", {
	drawtype = "allfaces_optional",
	walkable = true,
	visual_scale = 1,
})

-- sakura leaves
minetest.override_item("ethereal:sakura_leaves", {
	drawtype = "allfaces_optional",
	walkable = true,
	visual_scale = 1,
})

minetest.override_item("ethereal:sakura_leaves2", {
	drawtype = "allfaces_optional",
	walkable = true,
	visual_scale = 1,
})

-- lemon tree leaves
minetest.override_item("ethereal:lemon_leaves", {
	drawtype = "allfaces_optional",
	walkable = true,
	visual_scale = 1,
})

-- olive tree leaves
minetest.override_item("ethereal:olive_leaves", {
	drawtype = "allfaces_optional",
	walkable = true,
	visual_scale = 1,
})
