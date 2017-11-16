
local S = mobs.intllib



mobs:register_mob("prehistoric_life:pachycephalosaurus", {
	type = "animal",
	passive = false,
	hp_min = 37,
	hp_max = 41,
	armor = 150,
	collisionbox = {-0.6, -0.6, -0.6, 0.6, 0.3, 0.6},
	visual = "mesh",
	mesh = "prehistoric_life_pachycephalosaurus.b3d",
	textures = {
		{"prehistoric_life_pachycephalosaurus_male.png"},
                {"prehistoric_life_pachycephalosaurus_female.png"},
	},
	child_texture = {
		{"prehistoric_life_pachycephalosaurus_child.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "prehistoric_life_pachycephalosaurus",
	},
	walk_velocity = 1,
	run_velocity = 2,
	runaway = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 2, max = 6},
	},
	water_damage = 0,
	lava_damage = 9,
	light_damage = 0,
	fall_damage = 18,
	fall_speed = -8,
	fear_height = 6,
	animation = {
		speed_normal = 15,
		stand_start = 50,
		stand_end = 160, -- 20
		walk_start = 1,
		walk_end = 40,
	},
	follow = {"farming:wheat", "group:leaves"},
	view_range = 5,

	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 10, 20, 30, false, nil) then return end
	end,
})

mobs:register_egg("prehistoric_life:pachycephalosaurus", S("Pachycephalosaurus"), "prehistoric_life_egg.png", 0)

-- egg entity

minetest.register_craftitem("prehistoric_life:pachycephalosaurus_hatched", {
	description = "Pachycephalosaurus Egg (Hatched)",
	inventory_image = "prehistoric_life_egg_hatched.png",
	wield_image = "prehistoric_life_egg_hatched.png",
	stack_max = 1,
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, true)
		pos1.y=pos1.y+1.5
		core.after(0.1, function()
		mob = minetest.add_entity(pos1, "prehistoric_life:pachycephalosaurus")
                ent2 = mob:get_luaentity()

		mob:set_properties({
			textures = ent2.child_texture[1],
			visual_size = {
				x = ent2.base_size.x / 6,
				y = ent2.base_size.y / 6
			},
			collisionbox = {
				ent2.base_colbox[1] / 6,
				ent2.base_colbox[2] / 6,
				ent2.base_colbox[3] / 6,
				ent2.base_colbox[4] / 6,
				ent2.base_colbox[5] / 6,
				ent2.base_colbox[6] / 6
			},
		})

		ent2.child = true
		ent2.tamed = false
		end)
		itemstack:take_item()
		return itemstack
	end,
})
