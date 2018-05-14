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
	output = "ufos:light",
	recipe = {
		{"default:glass",	"default:glass", 			""},
		{"default:glass", 	"default:mese_crystal", 	"default:glass"},
		{"", 				"default:glass", 			"ufos:steel_spiral"}
	}
})

minetest.register_craft({
	output = "ufos:gauge",
	recipe = {
		{"default:glass",	"default:glass", 		"default:stick"},
		{"default:glass", 	"default:steel_ingot", 	"default:glass"},
		{"default:glass", 	"default:glass",		"default:glass"}
	}
})

minetest.register_craft({
	output = "ufos:cylinder",
	recipe = {
		{"",						"ufos:gauge", 				""},
		{"default:steel_block", 	"", 						"default:steel_block"},
		{"default:steel_block", 	"default:steel_block",		"default:steel_block"}
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
		{"", 						"default:steel_ingot", 		""},
		{"default:steel_ingot", 	"default:steel_ingot",		"default:steel_ingot"}
	}
})

minetest.register_craft({
	output = "ufos:copper_wire",
	recipe = {
		{"",						"", 						"default:copper_ingot"},
		{"", 						"default:copper_ingot", 	""},
		{"default:copper_ingot", 	"",							""}
	}
})

minetest.register_craft({
	output = "ufos:copper_coil",
	recipe = {
		{"ufos:copper_wire",	"ufos:steel_core", 	"ufos:copper_wire"},
		{"ufos:copper_wire", 	"ufos:steel_core", 	"ufos:copper_wire"},
		{"ufos:copper_wire", 	"ufos:steel_core",		"ufos:copper_wire"}
	}
})

minetest.register_craft({
	output = "ufos:pump",
	recipe = {
		{"default:steel_block",		"ufos:steel_pipe", 		"default:steel_block"},
		{"ufos:copper_coil", 		"ufos:steel_pipe", 		"ufos:copper_coil"},
		{"default:steel_block", 	"ufos:steel_pipe",		"default:steel_block"}
	}
})

minetest.register_craft({
	output = "ufos:bioplastic_mass",
	recipe = {
		{"ufos:bioresin",	"ufos:bioresin", 	"ufos:bioresin"},
		{"ufos:bioresin", 	"default:coal_lump", 	"ufos:bioresin"},
		{"ufos:bioresin", 	"ufos:bioresin",	"ufos:bioresin"}
	}
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
		{"default:paper",		"", 			"default:paper"},
		{"ufos:bioplastic_ingot", 	"default:paper", 	"ufos:bioplastic_ingot"},
		{"ufos:bioplastic_ingot", 	"ufos:copper_coil",	"ufos:bioplastic_ingot"}
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
	recipe = {"ufos:cylinder",	"ufos:pump", 	"ufos:printed_circuit"}

})

minetest.register_craft({
	output = "ufos:button",
	recipe = {
		{"ufos:bioplastic_ingot",	"", 	""},
		{"default:stick", 		"", 	""},
		{"ufos:copper_wire", 		"",	""}
	}
})


--[[
minetest.register_craft({
	output = "ufos:xxxxxx",
	recipe = {
		{"",	"", 	""},
		{"", 	"", 	""},
		{"", 	"",		""}
	}
})
--]]

