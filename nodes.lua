-- Prehistoric Life Nodes

-- Fossil Definition

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "prehistoric_life:desert_fossil_block",
		wherein        = "default:desert_stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 9,
		clust_size     = 4,
		y_min           = -31,
		y_max           = 0,
	})

	minetest.register_ore({
		ore_type       = "scatter",
		ore            = "prehistoric_life:fossil_block",
		wherein        = "default:stone",
		clust_scarcity = 15 * 15 * 15,
		clust_num_ores = 9,
		clust_size     = 4,
		y_min           = -31,
		y_max           = 0,
	})

--Fossils

minetest.register_node("prehistoric_life:desert_fossil_block", {
	description = "Fossil Block",
	tiles = {"default_desert_stone.png^prehistoric_life_fossil_overlay.png"},
	groups = {cracky = 2},
	drop = 'prehistoric_life:fossil',
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("prehistoric_life:fossil_block", {
	description = "Fossil Block",
	tiles = {"default_stone.png^prehistoric_life_fossil_overlay.png"},
	groups = {cracky = 2},
	drop = 'prehistoric_life:fossil',
	sounds = default.node_sound_stone_defaults(),
})
