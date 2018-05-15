minetest.register_craft({
	output = "ufos:steel_wire",
	recipe = {
		{"", 						"", 					"default:steel_ingot"},
		{"", 						"default:steel_ingot", 	""},
		{"default:steel_ingot", 	"", 					""}
	}
})

minetest.register_craft({
	output = "ufos:steel_spiral",
	recipe = {
		{"ufos:steel_wire", "ufos:steel_wire", "ufos:steel_wire"},
		{"ufos:steel_wire", "ufos:steel_wire", "ufos:steel_wire"},
		{"ufos:steel_wire", "ufos:steel_wire", "ufos:steel_wire"}
	}
})

minetest.register_craft({
	output = "ufos:eletric_lamp",
	recipe = {
		{"default:glass",		"default:glass", 				""},
		{"default:glass", 	"default:mese_crystal", 	"default:glass"},
		{"", 						"default:glass", 				"ufos:steel_spiral"}
	}
})

minetest.register_craft({
	output = "ufos:gauge",
	recipe = {
		{"default:glass",		"default:glass", 			"default:stick"},
		{"default:glass", 	"default:steel_ingot", 	"default:glass"},
		{"default:glass", 	"default:glass",			"default:glass"}
	}
})

minetest.register_craft({
	output = "ufos:cylinder",
	recipe = {
		{"ufos:gauge",				"", 		""},
		{"default:steelblock", 	"", 		""},
		{"default:steelblock", 	"",		""}
	}
})

minetest.register_craft({
	output = "ufos:steel_pipe",
	recipe = {
		{"default:steel_ingot",		"", 	"default:steel_ingot"},
		{"default:steel_ingot", 	"", 	"default:steel_ingot"},
		{"default:steel_ingot", 	"",		"default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "ufos:steel_core",
	recipe = {
		{"default:steel_ingot",		"default:steel_ingot", 		"default:steel_ingot"},
		{"",		 						"default:steelblock", 		""},
		{"default:steel_ingot", 	"default:steel_ingot",		"default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "ufos:copper_wire",
	recipe = {
		{"",								"",						 		"default:copper_ingot"},
		{"",						 		"default:copper_ingot", 	""},
		{"default:copper_ingot", 	"",								""}
	}
})

minetest.register_craft({
	output = "ufos:copper_coil",
	recipe = {
		{"ufos:copper_wire",		"ufos:steel_core", 	"ufos:copper_wire"},
		{"ufos:copper_wire", 	"ufos:steel_core", 	"ufos:copper_wire"},
		{"ufos:copper_wire", 	"ufos:steel_core",	"ufos:copper_wire"}
	}
})

minetest.register_craft({
	output = "ufos:eletric_pump",
	recipe = {
		{"ufos:copper_wire",		"ufos:capacitor",			"ufos:steel_pipe"},
		{"ufos:switch_button",	"ufos:copper_coil",		"default:steelblock"},
		{"ufos:copper_wire",		"ufos:printed_circuit",	"ufos:steel_pipe"}
	}
})

-- Dig 'ufos:bioresin' in 'default:pine_tree'
local drops = {}
table.insert(drops, {items = {'default:pine_tree'}})
table.insert(drops, {items = {'ufos:bioresin'},rarity = 8}) -- rarity:8 = 1/8 = 12,5%
minetest.override_item("default:pine_tree", {drop = {max_items=#drops, items=drops}}) --2 items per dig



minetest.register_craft({
	output = "ufos:ionized_bioresin 9",
	recipe = {
		{"ufos:bioresin",		"ufos:bioresin", 							"ufos:bioresin"},
		{"ufos:bioresin", 	"default:mese_crystal_fragment", 	"ufos:bioresin"},
		{"ufos:bioresin", 	"ufos:bioresin",							"ufos:bioresin"}
	}
})


minetest.register_craft({
	type = "shapeless",
	output = "ufos:bioplastic_mass",
	recipe = {"ufos:bioresin",	"default:coal_lump"}
})

minetest.register_craft({
    type = "cooking",
    output = "ufos:bioplastic_ingot",
    recipe = "ufos:bioplastic_mass",
    cooktime = 10,
})

minetest.register_craft({
	output = "ufos:speaker",
	recipe = {
		{"default:paper",		"ufos:bioplastic_ingot",	"ufos:bioplastic_ingot"},
		{"", 						"default:paper", 				"ufos:copper_coil"},
		{"default:paper", 	"ufos:bioplastic_ingot",	"ufos:bioplastic_ingot"}
	}
})

minetest.register_craft({
	output = "ufos:printed_circuit",
	recipe = {
		{"default:copper_ingot",	"ufos:bioplastic_ingot", 	"default:copper_ingot"},
		{"ufos:bioplastic_ingot", 	"default:copper_ingot", 	"ufos:bioplastic_ingot"},
		{"default:copper_ingot", 	"ufos:bioplastic_ingot",	"default:copper_ingot"}
	}
})

minetest.register_craft({
	type = "shapeless",
	output = "ufos:oxigen_system",
	recipe = {"ufos:cylinder",	"ufos:eletric_pump", 	"ufos:printed_circuit"}

})

minetest.register_craft({
	output = "ufos:switch_button",
	recipe = {
		{"default:steel_ingot",			"", 								""},
		{"ufos:bioplastic_ingot", 		"ufos:bioplastic_ingot", 	"ufos:bioplastic_ingot"},
		{"ufos:copper_wire", 			"default:copper_ingot",		"ufos:copper_wire"}
	}
})

minetest.register_craft({
	output = "ufos:microwave_resonance_chamber",
	recipe = {
		{"default:steel_ingot",		"ufos:copper_coil",		 	"default:steel_ingot"},
		{"default:steel_ingot", 	"default:mese_crystal", 	"default:steel_ingot"},
		{"default:steel_ingot", 	"ufos:copper_coil",			"default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "ufos:batery",
	recipe = {
		{"default:obsidian_glass",		"default:tin_ingot", 		"default:obsidian_glass"},
		{"default:obsidian_glass", 	"ufos:bioresin", 				"default:obsidian_glass"},
		{"default:obsidian_glass", 	"default:copper_ingot",		"default:obsidian_glass"}
	}
})

minetest.register_craft({
	output = "ufos:power_cell",
	recipe = {
		{"default:steelblock",		"default:steelblock", 		"default:steelblock"},
		{"ufos:batery", 				"ufos:batery", 				"ufos:batery"},
		{"default:diamondblock", 	"default:diamondblock",		"default:diamondblock"}
	}
})

minetest.register_craft({
	output = "ufos:emdrive",
	recipe = {
		{"default:steel_ingot",		"default:steel_ingot", 	"ufos:printed_circuit"},
		{"", 								"default:steel_ingot", 	"ufos:microwave_resonance_chamber"},
		{"default:steel_ingot", 	"default:steel_ingot",	"ufos:power_cell"}
	}
})

minetest.register_craft({
	output = "ufos:pilot_manche",
	recipe = {
		{"ufos:bioplastic_ingot",	"", 								"ufos:bioplastic_ingot"},
		{"default:steel_ingot", 	"default:steelblock", 		"default:steel_ingot"},
		{"", 								"default:steelblock",		""}
	}
})

minetest.register_craft({
	output = "ufos:upholstered_chair",
	recipe = {
		{"",	"", 				"wool:red"},
		{"", 	"", 				"wool:red"},
		{"", 	"wool:red",		"default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "ufos:panel",
	recipe = {
		{"ufos:gauge",					"ufos:gauge", 					"ufos:gauge"},
		{"ufos:switch_button", 		"ufos:switch_button", 		"ufos:switch_button"},
		{"ufos:speaker", 				"ufos:computer",				"default:key"}
	}
})

minetest.register_craft({
	output = "ufos:resistor",
	recipe = {
		{"",								"ufos:bioplastic_ingot", 	"ufos:copper_wire"},
		{"ufos:bioplastic_ingot", 	"default:coalblock",			"ufos:bioplastic_ingot"},
		{"ufos:copper_wire", 		"ufos:bioplastic_ingot",	""}
	}
})

minetest.register_craft({
	output = "ufos:capacitor",
	recipe = {
		{"ufos:bioplastic_ingot",	"default:paper", 	"ufos:bioplastic_ingot"},
		{"ufos:bioplastic_ingot", 	"default:paper", 	"ufos:bioplastic_ingot"},
		{"ufos:steel_wire", 			"",					"ufos:steel_wire"}
	}
})

minetest.register_craft({
	output = "ufos:steel_ring",
	recipe = {
		{"",								"default:steel_ingot", 	""},
		{"default:steel_ingot", 	"",						 	"default:steel_ingot"},
		{"",							 	"default:steel_ingot",	""}
	}
})

minetest.register_craft({
	output = "ufos:copper_coil_toroidal",
	recipe = {
		{"ufos:copper_wire",		"ufos:copper_wire", 	"ufos:copper_wire"},
		{"ufos:copper_wire", 	"ufos:steel_ring", 	"ufos:copper_wire"},
		{"ufos:copper_wire", 	"ufos:copper_wire",	"ufos:copper_wire"}
	}
})

minetest.register_craft({
	output = "ufos:ram_memory",
	recipe = {
		{"ufos:switch_button",		"ufos:switch_button", 	"ufos:switch_button"},
		{"ufos:microprocessor", 	"ufos:microprocessor", 	"ufos:microprocessor"},
		{"ufos:printed_circuit", 	"ufos:printed_circuit",	"ufos:printed_circuit"}
	}
})

minetest.register_craft({
	output = "ufos:gold_wire",
	recipe = {
		{"",							"",						 	"default:gold_ingot"},
		{"",					 		"default:gold_ingot", 	""},
		{"default:gold_ingot", 	"",							""}
	}
})


minetest.register_craft({
	output = "ufos:dna_checker",
	recipe = {
		{"default:obsidian_glass",	"default:diamond", 				"default:obsidian_glass"},
		{"ufos:gold_wire", 			"ufos:copper_coil_toroidal",	"ufos:gold_wire"},
		{"ufos:printed_circuit", 	"ufos:printed_circuit",			"ufos:printed_circuit"}
	}
})

minetest.register_craft({
	output = "ufos:microprocessor",
	recipe = {
		{"ufos:bioplastic_ingot",	"ufos:gold_wire",		"ufos:bioplastic_ingot"},
		{"ufos:bioplastic_ingot", 	"default:diamond",	"ufos:bioplastic_ingot"},
		{"ufos:bioplastic_ingot", 	"ufos:gold_wire",		"ufos:bioplastic_ingot"}
	}
})

minetest.register_craft({
	output = "ufos:computer",
	recipe = {
		{"ufos:resistor",			"ufos:copper_coil_toroidal",		"ufos:capacitor"},
		{"ufos:dna_checker", 	"ufos:microprocessor", 				"ufos:switch_button"},
		{"ufos:copper_wire",		"ufos:printed_circuit",				"ufos:ram_memory"}
	}
})

--[[
minetest.register_craft({
	output = "ufos:xxxxxx",
	recipe = {
		{"",	"", 	""},
		{"", 	"", 	""},
		{"", 	"",	""}
	}
})
--]]

minetest.register_craft({
	output = "ufos:cockpit",
	recipe = {
		{"",							"", 							""},
		{"ufos:panel", 			"ufos:pilot_manche", 	"ufos:upholstered_chair"},
		{"default:steelblock", 	"default:steelblock",	"default:steelblock"}
	}
})

minetest.register_craft( {
	output = 'ufos:ship',
	recipe = {
		{ "", 							"default:glass", 		""},
		{ "default:glass", 			"ufos:cockpit", 		"default:glass"},
		{ "ufos:eletric_lamp", 		"ufos:emdrive", 		"ufos:oxigen_system"},
	},
})

--[[
Ship: 
 x 2 x	← 1 = Oxigen System*
 2 3 2	← 2 = Glass*
 5 4 1	← 3 = Cockpit*
			← 4 = EmDrive*
			← 5 = Lamp*
--]]


