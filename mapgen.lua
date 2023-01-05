local tower_position = fragments.tower_position
local modpath = minetest.get_modpath("fragments")

local function rshift(x, by)
  return math.floor(x / 2 ^ by)
end

local times = {}

local function rangelim(d, min, max)
	if d < min then
		return min
	else
		if d > max then
			return max
		else
			return d
		end
	end
end

local WATER_LEVEL = 1
local AVERAGE_MUD_AMOUNT = 4

local function base_rock_level_2d(seed, p, n1, n2, n3, n4)
	-- The base ground level
	local noise1 = n1:get_2d({x = 0.5+p.x/500, y = 0.5+p.y/500})
	local base = WATER_LEVEL - AVERAGE_MUD_AMOUNT
			+ 20 * noise1
	
	local noise2 = n2:get_2d({x = 0.5+p.x/250, y = 0.5+p.y/250})
	local higher = WATER_LEVEL + 25 + 70 * noise2

	-- Limit higher to at least base
	if higher < base then
		higher = base
	end
		
	-- Steepness factor of cliffs
	local noise3 = n3:get_2d({x = 0.5+p.x/250, y = 0.5+p.y/250})
	local b = 1.0 + 1.0 * noise3
	b = rangelim(b, 0.0, 1000.0)
	b = b ^ 5
	b = b * 7
	b = rangelim(b, 3.0, 1000.0)

	-- Offset to more low
	local a_off = -0.2
	local noise4 = n4:get_2d({x = 0.5+p.x/250, y = 0.5+p.y/250})
	local a = 0.5 + b * (a_off + noise4)
	-- Limit
	a = rangelim(a, 0.0, 1.0)
	
	local h = base * (1 - a) + higher * a
	return h
end

local FLOW = 256
local function generate_lava_pools(x0, y0, z0, x1, y1, z1, vm, area, data)
	if y0 > -260 then
		return
	end
	local c_air = minetest.get_content_id("air")
	local c_ignore = minetest.get_content_id("ignore")
	local c_lava = minetest.get_content_id("default:lava_source")
	local c_grass = minetest.get_content_id("default:stone")
	local lava_map = {}

	for xcen = x0 + 8, x1 - 7, 8 do
	for zcen = z0 + 8, z1 - 7, 8 do
		local yasurf = false -- y of above surface node
		for y = y0, y1 do
			local vi = area:index(xcen, y, zcen)
			local c_node = data[vi]
			if y == y0 and c_node == c_air then
				break
			elseif c_node == c_air then
				yasurf = y + 1
				break
			end
		end
		if yasurf then
			local abort = false
			for ser = 1, 80 do
				local vi = area:index(xcen + ser, yasurf, zcen)
				local c_node = data[vi]
				if xcen + ser == x1 then
					abort = true
				elseif c_node ~= c_air then
					break
				end
			end
			for ser = 1, 80 do
				local vi = area:index(xcen - ser, yasurf, zcen)
				local c_node = data[vi]
				if xcen - ser == x0 then
					abort = true
				elseif c_node ~= c_air then
					break
				end
			end
			for ser = 1, 80 do
				local vi = area:index(xcen, yasurf, zcen + ser)
				local c_node = data[vi]
				if zcen + ser == z1 then
					abort = true
				elseif c_node ~= c_air then
					break
				end
			end
			for ser = 1, 80 do
				local vi = area:index(xcen, yasurf, zcen - ser)
				local c_node = data[vi]
				if zcen - ser == z0 then
					abort = true
				elseif c_node ~= c_air then
					break
				end
			end
			if abort then
				break
			end

			local vi = area:index(xcen, yasurf, zcen)
			lava_map[vi] = 1
			local flab = false -- flow abort
			for flow = 1, FLOW do
				for z = z0, z1 do
					for x = x0, x1 do
						local vif = area:index(x, yasurf, z)
						if lava_map[vif] == 1 then
							if x == x0 or x == x1 or z == z0 or z == z1 then
								flab = true -- if water at chunk edge abort flow
								break
							else -- flow water
								local vie = area:index(x + 1, yasurf, z)
								local viw = area:index(x - 1, yasurf, z)
								local vin = area:index(x, yasurf, z + 1)
								local vis = area:index(x, yasurf, z - 1)
								if data[vie] == c_air then
									lava_map[vie] = 1
								end
								if data[viw] == c_air then
									lava_map[viw] = 1
								end
								if data[vin] == c_air then
									lava_map[vin] = 1
								end
								if data[vis] == c_air then
									lava_map[vis] = 1
								end
							end
						end
					end
					if flab then
						break
					end
				end
				if flab then
					break
				end
			end
			if flab then -- erase water from this y level
				lava_map = {}
			else -- flow downwards add dirt
				for z = z0, z1 do
				for x = x0, x1 do
					local vi = area:index(x, yasurf, z)
					if lava_map[vi] == 1 then
						data[vi] = c_lava
						for y = yasurf - 1, y0, -1 do
							local viu = area:index(x, y, z)
							if data[viu] == c_air then
								data[viu] = c_lava
							else
								break
							end
						end
					end
				end
				end
			end
		end
	end
	end
end

local data = {}

local floaters = {
	offset = 0,
	scale = 1,
	spread = {x=40, y=18, z=40},
	octaves = 2,
	seed = -11842,
	persist = 0.7,
	flags = "eased",
	eased = true,
}

local np_rav = {
	offset = 0,
	scale = 1,
	spread = {x=30, y=160, z=140},
	octaves = 3,
	seed = 94927,
	persist = 0.7,
	flags = "eased",
}

minetest.register_on_generated(function(minp, maxp, s)
	if minp.y < -31000 or minp.y > 2500 then
		return
	end

	local t1 = os.clock()
	local x1 = maxp.x
	local y1 = maxp.y
	local z1 = maxp.z
	local x0 = minp.x
	local y0 = minp.y
	local z0 = minp.z
	local seed = 383130685233454422
	local tower = false
	if minp.x <= tower_position.x and maxp.x >= tower_position.x and
		minp.z <= tower_position.z and maxp.z >= tower_position.z then
		tower = true
	end

	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	vm:get_data(data)
	local c_air = minetest.get_content_id("air")
	local c_sand = minetest.get_content_id("default:sand")
	local c_stone = minetest.get_content_id("default:stone")
	local c_water = minetest.get_content_id("default:water_source")
	local sidelen = x1 - x0 + 1
	local chulens = {x=sidelen, y=sidelen, z=sidelen}
	local minposxz = {x=x0, y=z0}
	local minposxyz = {x=x0, y=y0, z=z0}
	local border_amp = 128

	local offset = math.random(5,20)
	local nixyz = 1 -- 3d noise index
	local nixz = 1 -- 2d noise index
	local n1 = minetest.get_perlin(rshift(seed, 32) + 654879876, 6, 0.6, 1.5)
	local n2 = minetest.get_perlin(seed + 85039, 5, 0.69, 1.5)
	local n3 = minetest.get_perlin(seed - 932, 7, 0.7, 1.5)
	local n4 = minetest.get_perlin(seed - 359, 5, 0.6, 1.5)
	local nfloat = minetest.get_perlin_map(floaters, chulens)
	local nvals_float = nfloat:get_3d_map_flat(minposxyz)
	local nrav = minetest.get_perlin_map(np_rav, chulens)
	local nvals_rav = nrav:get_3d_map_flat(minposxyz)

	for z = z0, z1 do
		for x = x0, x1 do -- for each column do
			local stone_y = base_rock_level_2d(seed, {x = x, y = z}, n1, n2, n3, n4) + 6
			for y = y1, y0, -1 do -- working down each column for each node do
				local vi = area:index(x, y, z)
				if y <= stone_y then
					data[vi] = c_stone
					if tower == true then
						if x == tower_position.x and z == tower_position.z and y == math.floor(stone_y) then
						tower = "very_true"
						tower_position.y = y - 6 --offset for base
						end
					end
				elseif y <= WATER_LEVEL then
					data[vi] = c_water
				end
			end
		end
		if minp.y > 40 then
			for y = y0, y1 do -- Floaters
				local vi = area:index(x0, y, z)
				for x = x0, x1 do -- for each node do
					local cave_d = 1.25
					if y > 130 and y <= 350 then
						cave_d = 1.25 - y/1750
					elseif y > 2000 then
						cave_d = y / (3904-y)
					elseif y > 350 then
						cave_d = 1.05
					end
					if nvals_float[nixyz] > cave_d then
						data[vi] = c_stone
					end
					vi = vi + 1
					nixyz = nixyz + 1
				end
			end
		elseif minp.y <= 40 then
			for y = y0, y1 do
				local vi = area:index(x0, y, z)
				for x = x0, x1 do -- for each node do
					local cave_d = 0.6
					if y > 10 then
						cave_d = 1.2
					elseif y <= 10 and y >= -50 then
						cave_d = y/100 + 1.1
					end
					if nvals_float[nixyz] > cave_d then
						data[vi] = c_air
					elseif nvals_rav[nixyz] > 1.45 then
						data[vi] = c_air
					end
				vi = vi + 1
				nixyz = nixyz + 1
				end
			end
		end
	end
	generate_lava_pools(x0, y0, z0, x1, y1, z1, vm, area, data)
	vm:set_data(data)
	biomegen.generate_all(data, area, vm, minp, maxp, seed)
	if tower == "very_true" then	
		minetest.place_schematic_on_vmanip(vm, tower_position, modpath .. "/schems/tower.mts")
	end
	vm:set_lighting({day=0, night=0})
	if minp.y > 40 then
		vm:calc_lighting(nil, nil, false)
	else
		vm:calc_lighting()
	end
	vm:update_liquids()
	vm:write_to_map()
	local chugent = math.ceil((os.clock() - t1) * 1000)
	table.insert(times, chugent)
end)

minetest.register_on_generated(function(minp, maxp, s)
	if minp.y < 30048 or minp.y > 30100 or
	minp.x < -32 or minp.x > 0 or
	minp.z < -32 or minp.z > 0 then 
		return
	end
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	minetest.place_schematic_on_vmanip(vm, {x = -28, y = 30050, z = -16}, modpath .. "/schems/course1.mts")
	vm:calc_lighting(nil, nil, false)
	vm:update_liquids()
	vm:write_to_map()
end)

minetest.register_on_shutdown(function()
	local time = 0
	local c = 0
	for i, v in pairs(times) do
		time = time + v
		c = c + 1
	end
	minetest.log("action", "Average generation time per chunk (Base mapgen): " .. time/c)
end)

--layers of stone...
minetest.register_on_generated(function(minp, maxp, s)
	if (minp.y < 29568 or minp.y > 29649)
	and (minp.y < 22048 or minp.y > 22689) then 
		return
	end
	print(":D")
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	vm:get_data(data)
	local x1 = maxp.x
	local y1 = maxp.y
	local z1 = maxp.z
	local x0 = minp.x
	local y0 = minp.y
	local z0 = minp.z
	local c_stone = minetest.get_content_id("default:stone")
	local c_void = minetest.get_content_id("fragments:void")
	local stone
	if minp.y == 29568 or minp.y == 22048 then
		stone = true
	else
		stone = false
	end
	for z = z0, z1 do
		for y = y0, y1 do
			local vi = area:index(x0, y, z)
			for x = x0, x1 do -- for each node 
				if stone then
					data[vi] = c_stone
				else
					data[vi] = c_void
				end
				vi = vi + 1
			end
		end
	end
	vm:set_data(data)
	vm:set_lighting({day=0, night=0})
	vm:calc_lighting(nil, nil, false)
	vm:update_liquids()
	vm:write_to_map()
end)

function fragments.spawn_base(player)
	local x = math.random(-1000, 1000)
	local z = math.random(-1000, 1000)
	local seed = 383130685233454422
	local n1 = minetest.get_perlin(rshift(seed, 32) + 654879876, 6, 0.6, 1.5)
	local n2 = minetest.get_perlin(seed + 85039, 5, 0.69, 1.5)
	local n3 = minetest.get_perlin(seed - 932, 7, 0.7, 1.5)
	local n4 = minetest.get_perlin(seed - 359, 5, 0.6, 1.5)
	local y = base_rock_level_2d(seed, {x = x, y = z}, n1, n2, n3, n4) + 8
	if y < 1 then
		y = 1
	end
	player:set_pos({x = x, y = y, z = z})
end
