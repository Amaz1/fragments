-- fracture 0.2.1 by paramat
-- For latest stable Minetest and back to 0.4.8
-- Depends default
-- License: code WTFPL

-- update spawnplayer function
-- tunnels replace fissures
-- remove soil depth table, pines
-- thicker dirt/sand
-- new edge erosion stability system, calculation only to 15 nodes below
-- TODO
-- integrate water pools. Clouds, humidity linked to distribution

-- Parameters
local TSTONE = 0.99 -- Stone density threshold, controls average depth of dirt/sand
local TTUN = 0.02 -- Tunnel width

-- 3D noise for terrain

local np_terrain = {
	offset = 0,
	scale = 1,
	spread = {x=105, y=76, z=105},
	seed = 593,
	octaves = 4,
	persist = 0.67,
	flags = "defaults, absvalue",
}

local np_terralt = {
	offset = 0,
	scale = 1,
	spread = {x=64, y=50, z=64},
	seed = 7465,
	octaves = 3,
	persist = 0.67,
	flags = "defaults, absvalue",
}

-- 3D noises for tunnels

local np_weba = {
	offset = 0,
	scale = 1,
	spread = {x=192, y=192, z=192},
	seed = 5900033,
	octaves = 3,
	persist = 0.4
}

local np_webb = {
	offset = 0,
	scale = 1,
	spread = {x=191, y=191, z=191},
	seed = 33,
	octaves = 3,
	persist = 0.4
}

local nobj_terrain = nil
local nobj_terralt = nil
local nobj_weba = nil
local nobj_webb = nil

local nvals_terrain = {}
local nvals_terralt = {}
local nvals_weba = {}
local nvals_webb = {}

local data = {}

local times = {}

-- On generated function

minetest.register_on_generated(function(minp, maxp, seed)
	if minp.y < 22900 or maxp.y > 25100 then
		return
	end

	local t1 = os.clock()
	local x1 = maxp.x
	local y1 = maxp.y
	local z1 = maxp.z
	local x0 = minp.x
	local y0 = minp.y
	local z0 = minp.z
	
	local vm, emin, emax = minetest.get_mapgen_object("voxelmanip")
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	vm:get_data(data)
	
	local c_stone = minetest.get_content_id("default:stone")
	
	local sidelen = x1 - x0 + 1 -- mapchunk side length
	local facearea = sidelen ^ 2 -- mapchunk face area
	local chulens = {x=sidelen, y=sidelen+16, z=sidelen}
	local minposxyz = {x=x0, y=y0-15, z=z0}

	nobj_terrain = nobj_terrain or minetest.get_perlin_map(np_terrain, chulens)
	nobj_terralt = nobj_terralt or minetest.get_perlin_map(np_terralt, chulens)
	nobj_weba = nobj_weba or minetest.get_perlin_map(np_weba, chulens)
	nobj_webb = nobj_webb or minetest.get_perlin_map(np_webb, chulens)

	nobj_terrain:get_3d_map_flat(minposxyz, nvals_terrain)
	nobj_terralt:get_3d_map_flat(minposxyz, nvals_terralt)
	nobj_weba:get_3d_map_flat(minposxyz, nvals_weba)
	nobj_webb:get_3d_map_flat(minposxyz, nvals_webb)
	
	local nixyz = 1
	local stable = {}
	local under = {}
	for z = z0, z1 do
		for y = y0 - 15, y1 + 1 do
			local vi = area:index(x0, y, z)
			for x = x0, x1 do
				local n_terrain = nvals_terrain[nixyz]
				local n_terralt = nvals_terralt[nixyz]
				local density = (n_terrain + n_terralt) * 0.5

				local weba = math.abs(nvals_weba[nixyz]) < TTUN
				local webb = math.abs(nvals_webb[nixyz]) < TTUN
				local novoid = not (weba and webb)
				
				if y >= y0 and y <= y1 then
					if novoid and density >= TSTONE then
						data[vi] = c_stone
					end
				end
				nixyz = nixyz + 1
				vi = vi + 1
			end
		end
	end
	
	biomegen.generate_all(data, area, vm, minp, maxp, seed)
	vm:set_data(data)
	vm:set_lighting({day=0, night=0})
	vm:calc_lighting(nil, nil, false)
	vm:write_to_map(data)

	local chugent = math.ceil((os.clock() - t1) * 1000)
	table.insert(times, chugent)
end)



function fragments.spawn_floatlands(player)
	local PSCA = 12 -- Player scatter from world centre in chunks (80 nodes).
	local xsp
	local ysp
	local zsp
	for chunk = 1, 128 do
		local x0 = 80 * math.random(-PSCA, PSCA) - 32
		local z0 = 80 * math.random(-PSCA, PSCA) - 32
		local y0 = 24000 + math.random(-400, 400) - 32
		local x1 = x0 + 79
		local z1 = z0 + 79
		local y1 = y0 + 79

		local sidelen = 80
		local chulens = {x=sidelen, y=sidelen, z=sidelen}
		local minposxyz = {x=x0, y=y0, z=z0}

		local nvals_terrain = minetest.get_perlin_map(np_terrain, chulens):get3dMap_flat(minposxyz)
		local nvals_terralt = minetest.get_perlin_map(np_terralt, chulens):get3dMap_flat(minposxyz)

		local nixyz = 1
		local stable = {}
		for z = z0, z1 do
			for y = y0, y1 do
				for x = x0, x1 do
					local si = x - x0 + 1
					local n_terrain = nvals_terrain[nixyz]
					local n_terralt = nvals_terralt[nixyz]
					local density = (n_terrain + n_terralt) * 0.5 

					if density >= TSTONE then
						ysp = y + 3
						xsp = x
						zsp = z
						break
					end
					nixyz = nixyz + 1
				end
				if ysp then
					break
				end
			end
			if ysp then
				break
			end
		end
		if ysp then
			break
		end
	end
	player:set_pos({x=xsp, y=ysp, z=zsp})
end

minetest.register_on_shutdown(function()
	local time = 0
	local c = 0
	for i, v in pairs(times) do
		time = time + v
		c = c + 1
	end
	minetest.log("action", "Average generation time per chunk (floatlands): " .. time/c)
end)
