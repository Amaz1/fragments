local function sling(player, itemstack)
	local name = player:get_player_name()
	local dir = player:get_look_dir()
	dir = vector.multiply(dir, -1)
	local charge = 10
	local held = true
	local meta = player:get_meta()
	if meta:get_int("bouncing") ~= 1 then
		for i = 0, 5, 0.1 do
			minetest.after(i, function()
				local wi = player:get_wielded_item():get_name()
				if held == true then
					if wi == "old_old_mapgen:sling" then
						charge = charge + 2
						if i >= 4 then
							held = false
								player:add_player_velocity(vector.multiply(dir, charge))
							local meta = player:get_meta()
							meta:set_int("sling:bouncing", 1)
							meta:set_int("sling:charge", charge)
							meta:set_string("sling:dir", minetest.serialize(dir))
						end
					else
						held = false
						player:add_velocity(vector.multiply(dir, charge))
						local meta = player:get_meta()
						meta:set_int("sling:bouncing", 1)
						meta:set_int("sling:charge", charge)
						meta:set_string("sling:dir", minetest.serialize(dir))
					end
				end
			end)
		end
	end
end

 minetest.register_craftitem("old_old_mapgen:sling", {
	description = "Slingshot\nRightclick to sling!",
	inventory_image = "old_old_mapgen_sling.png",
	on_place = function(itemstack, user, pointed_thing)
		sling(user, itemstack)
	end,
})

minetest.register_craft({
	output = "old_old_mapgen:sling",
	recipe = {
		{"default:mese_crystal_fragment", "", "default:mese_crystal_fragment"},
		{"default:steel_ingot", "default:stick", "default:steel_ingot"},
		{"", "default:stick", ""},
	}
})

minetest.register_craftitem("old_old_mapgen:bouncer", {
	description = "Bouncer\nHold this to bounce after slinging!",
	inventory_image = "old_old_mapgen_bouncer.png",
})

minetest.register_craft({
	output = "old_old_mapgen:bouncer",
	recipe = {
		{"default:mese_crystal_fragment", "default:mese_crystal_fragment", "default:mese_crystal_fragment"},
		{"default:diamond", "default:diamond", "default:diamond"},
		{"default:mese_crystal_fragment", "default:mese_crystal_fragment", "default:mese_crystal_fragment"},
	}
})

 minetest.register_on_player_hpchange(function(player, hp_change, reason)
	local meta = player:get_meta()
	if reason.type == "fall" then
		if meta:get_int("sling:bouncing") == 1 then
			if player:get_wielded_item():get_name() == "old_old_mapgen:bouncer" then
				player:add_velocity(vector.multiply(minetest.deserialize(meta:get_string("sling:dir")),
					meta:get_int("sling:charge")/2))
				if meta:get_int("sling:charge")/2 <= 12.5 then
					meta:set_int("sling:bouncing", 0)
					meta:set_int("sling:charge", 0)
				else
					meta:set_int("sling:charge", meta:get_int("sling:charge") / 2)
				end
				return 0
			else
				meta:set_int("sling:bouncing", 0)
				meta:set_int("sling:charge", 0)
			end
		else
			meta:set_int("sling:bouncing", 0)
			meta:set_int("sling:charge", 0)
		end
	end
	return hp_change
end, true)
