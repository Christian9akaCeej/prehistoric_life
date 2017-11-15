
local path = minetest.get_modpath("prehistoric_life")

-- Mob API
dofile(path .. "/api.lua")

-- Nodes
dofile(path .. "/nodes.lua")

-- Items
--dofile(path .. "/crafts.lua")

-- Cloning Machinery
dofile(path .. "/fossil_grinder.lua")
dofile(path .. "/dna_extractor.lua")
dofile(path .. "/cultivator.lua")
dofile(path .. "/incubator.lua")

-- Mobs
dofile(path .. "/anatosaurus.lua")
dofile(path .. "/ankylosaurus.lua")
dofile(path .. "/anzu.lua")
dofile(path .. "/dakotaraptor.lua")
dofile(path .. "/ornithomimus.lua")
dofile(path .. "/pachycephalosaurus.lua")
dofile(path .. "/triceratops.lua")
dofile(path .. "/tyrannosaurus.lua")

minetest.log("action", "[MOD] Prehistoric Life loaded")
