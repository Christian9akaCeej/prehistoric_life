
local S = mobs.intllib



mobs:register_mob("prehistoric_life:velociraptor", {
	type = "dakotaraptor",
	passive = false,
        attack_animals = true,
	attack_type = "dogfight",
	hp_min = 9,
	hp_max = 16,
        damage = 3,
        reach = 1,
	armor = 120,
	visual_size = {x=0.40, y=0.40},
	collisionbox = {-0.3, -0.3, -0.3, 0.3, 0.3, 0.3},
	visual = "mesh",
	mesh = "prehistoric_life_velociraptor.b3d",
	textures = {
		{"prehistoric_life_velociraptor_male.png"},
                {"prehistoric_life_velociraptor_female.png"},
	},
	child_texture = {
		{"prehistoric_life_velociraptor_child.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "prehistoric_life_dakotaraptor",
	},
	walk_velocity = 3,
	run_velocity = 4,
	runaway = true,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 1, max = 3},
	},
	water_damage = 0,
	lava_damage = 3,
	light_damage = 0,
	fall_damage = 2,
	fall_speed = -8,
	fear_height = 24,
	animation = {
		speed_normal = 15,
		stand_start = 40,
		stand_end = 150, -- 20
		walk_start = 1,
		walk_end = 30,
	},
	view_range = 9,

})

mobs:register_egg("prehistoric_life:velociraptor", S("Velociraptor"), "prehistoric_life_egg.png", 0)

-- egg entity

minetest.register_craftitem("prehistoric_life:velociraptor_hatched", {
	description = "Velociraptor Egg (Hatched)",
	inventory_image = "prehistoric_life_egg_hatched.png",
	wield_image = "prehistoric_life_egg_hatched.png",
	stack_max = 1,
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, true)
		pos1.y=pos1.y+1.5
		core.after(0.1, function()
		mob = minetest.add_entity(pos1, "prehistoric_life:velociraptor")
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
