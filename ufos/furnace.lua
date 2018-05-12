minetest.register_node("ufos:furnace", {
	description = modUFO.translate("UFO charging device"),
	tiles = {"default_steel_block.png", "default_steel_block.png", "default_steel_block.png",
		"default_steel_block.png", "default_steel_block.png", 
		"default_steel_block.png^ufos_furnace_front.png"},
	paramtype2 = "facedir",
	groups = {cracky=2},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", modUFO.getFormSpecs.furnace)
		meta:set_string("infotext", modUFO.translate("UFO charging device"))
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		end
		return true
	end,
})

--[[
minetest.register_node("ufos:furnace_active", {
	description = modUFO.translate("UFO charging device"),
	tiles = {"default_steel_block.png", "default_steel_block.png", "default_steel_block.png",
		"default_steel_block.png", "default_steel_block.png", 
		"default_steel_block.png^ufos_furnace_front.png^ufos_furnace_front_active.png"},
	paramtype2 = "facedir",
	light_source = 8,
	drop = "ufos:furnace",
	groups = {cracky=2, not_in_creative_inventory=1},
	legacy_facedir_simple = true,
	sounds = default.node_sound_stone_defaults(),
	on_construct = function(pos)
		local meta = minetest.env:get_meta(pos)
		meta:set_string("formspec", modUFO.getFormSpecs.furnace)
		meta:set_string("infotext", modUFO.translate("UFO charging device"))
		local inv = meta:get_inventory()
		inv:set_size("fuel", 1)
	end,
	can_dig = function(pos,player)
		local meta = minetest.env:get_meta(pos);
		local inv = meta:get_inventory()
		if not inv:is_empty("fuel") then
			return false
		end
		return true
	end,
})
--]]

--[[
function hacky_swap_node(pos,name)
	local node = minetest.env:get_node(pos)
	local meta = minetest.env:get_meta(pos)
	local meta0 = meta:to_table()
	if node.name == name then
		return
	end
	node.name = name
	local meta0 = meta:to_table()
	minetest.env:set_node(pos,node)
	meta = minetest.env:get_meta(pos)
	meta:from_table(meta0)
end
--]]

minetest.register_abm({
	nodenames = {
		"ufos:furnace"
		--,"ufos:furnace_active"
	},
	interval = .25,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local meta = minetest.env:get_meta(pos)
		local inv = meta:get_inventory()
		local stack = inv:get_stack("fuel",1)
		if stack:get_name() == modUFO.fuel_type then
			inv:remove_item("fuel",ItemStack(modUFO.fuel_type))
			meta:set_int("charge",meta:get_int("charge")+1)
			meta:set_string("formspec", 
				modUFO.getFormSpecs.furnace
				.. "label[1.95,0.6; "..modUFO.translate("Charge: %02d GWh (Gigawatts Hour)"):format(meta:get_int("charge")).. "]"
			)
		end
	end,
})

minetest.register_craft( {
	output = 'ufos:furnace',
	recipe = {
		{ "default:steel_ingot"	, "default:obsidian"	, "default:steel_ingot"	},
		{ "default:obsidian"		, "default:furnace"	, "default:obsidian"		},
		{ "default:steel_ingot"	, "default:obsidian"	, "default:steel_ingot"	},
	},
})

minetest.register_alias("loader","ufos:furnace")
minetest.register_alias("loaderufo","ufos:furnace")
minetest.register_alias(modUFO.translate("loader"),"ufos:furnace")
minetest.register_alias(modUFO.translate("loaderufos"),"ufos:furnace")
