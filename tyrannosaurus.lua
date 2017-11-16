
local S = mobs.intllib



mobs:register_mob("prehistoric_life:tyrannosaurus", {
	type = "tyrannosaurus",
	passive = false,
        attack_animals = true,
	attack_type = "dogfight",
	hp_min = 87,
	hp_max = 94,
        damage = 19,
        reach = 5,
	armor = 110,
	collisionbox = {-1.3, -1.3, -1.3, 1.3, 1.2, 1.3},
	visual = "mesh",
	mesh = "prehistoric_life_tyrannosaurus.b3d",
	textures = {
		{"prehistoric_life_tyrannosaurus_male.png"},
                {"prehistoric_life_tyrannosaurus_female.png"},
	},
	child_texture = {
		{"prehistoric_life_tyrannosaurus_child.png"},
	},
	makes_footstep_sound = true,
	sounds = {
		random = "prehistoric_life_tyrannosaurus",
	},
	walk_velocity = 2,
	run_velocity = 3,
	runaway = false,
	drops = {
		{name = "mobs:meat_raw", chance = 1, min = 11, max = 14},
	},
	water_damage = 0,
	lava_damage = 3,
	light_damage = 0,
	fall_damage = 56,
	fall_speed = -8,
	fear_height = 5,
	animation = {
		speed_normal = 15,
		stand_start = 50,
		stand_end = 140, -- 20
		walk_start = 1,
		walk_end = 40,
	},
	view_range = 9,

})

mobs:register_egg("prehistoric_life:tyrannosaurus", S("Tyrannosaurus"), "prehistoric_life_egg.png", 0)

-- egg entity

minetest.register_craftitem("prehistoric_life:tyrannosaurus_hatched", {
	description = "Tyrannosaurus Egg (Hatched)",
	inventory_image = "prehistoric_life_egg_hatched.png",
	wield_image = "prehistoric_life_egg_hatched.png",
	stack_max = 1,
	on_place = function(itemstack, placer, pointed_thing)
		local pos1=minetest.get_pointed_thing_position(pointed_thing, true)
		pos1.y=pos1.y+1.5
		core.after(0.1, function()
		mob = minetest.add_entity(pos1, "prehistoric_life:tyrannosaurus")
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
