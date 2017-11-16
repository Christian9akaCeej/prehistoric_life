
local S = mobs.intllib



mobs:register_mob("prehistoric_life:protoceratops", {
	type = "animal",
	passive = false,
        attack_type = "dogfight",
	hp_min = 22,
	hp_max = 25,
        damage = 4,
        reach = 1,
	armor = 160,
	collisionbox = {-0.6, -0.6, -0.6, 0.6, 0.3, 0.6},
	visual = "mesh",
	mesh = "prehistoric_life_protoceratops.b3d",
	textures = {
		{"prehistoric_life_protoceratops_male.png"},
                {"prehistoric_life_protoceratops_female.png"},
	},
	child_texture = {
		{"prehistoric_life_protoceratops_child.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "prehistoric_life_triceratops",
	},
	walk_velocity = 2,
	run_velocity = 3,
	runaway = false,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 2, max = 4},
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
	follow = {"farming:wheat"},
	view_range = 5,

	on_rightclick = function(self, clicker)

		if mobs:feed_tame(self, clicker, 8, true, true) then return end
		if mobs:protect(self, clicker) then return end
		if mobs:capture_mob(self, clicker, 10, 20, 30, false, nil) then return end
	end,
})

mobs:register_egg("prehistoric_life:protoceratops", S("Protoceratops"), "prehistoric_life_egg.png", 0)

-- egg entity

minetest.register_craftitem("prehistoric_life:protoceratops_hatched", {
	description = "Protoceratops Egg (Hatched)",
	inventory_image = "prehistoric_life_egg_hatched.png",
	wield_image = "prehistoric_life_egg_hatched.png",
	stack_max = 1,
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, true)
		pos1.y=pos1.y+1.5
		core.after(0.1, function()
		mob = minetest.add_entity(pos1, "prehistoric_life:protoceratops")
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
