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

