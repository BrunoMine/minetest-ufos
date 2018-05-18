minetest.register_craftitem("ufos:steel_wire", {
	description = modUFO.translate("Steel Wire"),
	inventory_image = "obj_steel_wire_64.png",
})
minetest.register_craft({
	output = "ufos:steel_wire",
	recipe = {
		{"", 				"",		"default:steel_ingot"},
		{"", 						"default:steel_ingot", 	""},
		{"default:steel_ingot", 	"", 					""}
	}
})

--########################################################################################################################

minetest.register_craftitem("ufos:steel_spiral", {
	description = modUFO.translate("Steel Spiral"),
	inventory_image = "obj_steel_spiral_64.png",
})
minetest.register_craft({
	output = "ufos:steel_spiral",
	recipe = {
		{"ufos:steel_wire", "ufos:steel_wire", "ufos:steel_wire"},
		{"ufos:steel_wire", "ufos:steel_wire", "ufos:steel_wire"},
		{"ufos:steel_wire", "ufos:steel_wire", "ufos:steel_wire"}
	}
})

--########################################################################################################################

minetest.register_craftitem("ufos:eletric_lamp", {
	description = modUFO.translate("Eletric Lamp"),
	inventory_image = "obj_eletric_lamp_64.png",
})
minetest.register_craft({
	output = "ufos:eletric_lamp",
	recipe = {
		{"default:glass",		"default:glass", 				""},
		{"default:glass", 	"default:mese_crystal", 	"default:glass"},
		{"", 						"default:glass", 				"ufos:steel_spiral"}
	}
})

--########################################################################################################################

minetest.register_craftitem("ufos:gauge", {
	description = modUFO.translate("Gauge"),
	inventory_image = "obj_gauge_64.png",
})
minetest.register_craft({
	output = "ufos:gauge",
	recipe = {
		{"default:glass",		"default:glass", 			"default:stick"},
		{"default:glass", 	"default:steel_ingot", 	"default:glass"},
		{"default:glass", 	"default:glass",			"default:glass"}
	}
})

--########################################################################################################################

minetest.register_craftitem("ufos:cylinder", {
	description = modUFO.translate("Cylinder"),
	inventory_image = "obj_cylinder_64.png",
})
minetest.register_craft({
	output = "ufos:cylinder",
	recipe = {
		{"ufos:gauge",				"", 		""},
		{"default:steelblock", 	"", 		""},
		{"default:steelblock", 	"",		""}
	}
})

--########################################################################################################################

minetest.register_craftitem("ufos:steel_pipe", {
	description = modUFO.translate("Steel Pipe"),
	inventory_image = "obj_steel_pipe_96.png",
})
minetest.register_craft({
	output = "ufos:steel_pipe",
	recipe = {
		{"default:steel_ingot",		"", 	"default:steel_ingot"},
		{"default:steel_ingot", 	"", 	"default:steel_ingot"},
		{"default:steel_ingot", 	"",		"default:steel_ingot"}
	}
})

--########################################################################################################################

minetest.register_craftitem("ufos:steel_core", {
	description = modUFO.translate("Steel Core"),
	inventory_image = "obj_steel_core_64.png",
})
minetest.register_craft({
	output = "ufos:steel_core",
	recipe = {
		{"default:steel_ingot",		"default:steel_ingot", 		"default:steel_ingot"},
		{"",		 						"default:steelblock", 		""},
		{"default:steel_ingot", 	"default:steel_ingot",		"default:steel_ingot"}
	}
})

--########################################################################################################################

minetest.register_craftitem("ufos:copper_wire", {
	description = modUFO.translate("Copper Wire"),
	inventory_image = "obj_copper_wire_64.png",
})
minetest.register_craft({
	output = "ufos:copper_wire",
	recipe = {
		{"",				"",		 		"default:copper_ingot"},
		{"",				"default:copper_ingot", 	""},
		{"default:copper_ingot", 	"",				""}
	}
})

--########################################################################################################################

minetest.register_craftitem("ufos:copper_coil", {
	description = modUFO.translate("Copper Coil"),
	inventory_image = "obj_copper_coil_64.png",
})
minetest.register_craft({
	output = "ufos:copper_coil",
	recipe = {
		{"ufos:copper_wire", 	"ufos:steel_core",	"ufos:copper_wire"}
	}
})

--########################################################################################################################

minetest.register_craftitem("ufos:eletric_pump", {
	description = modUFO.translate("Eletric Pump"),
	inventory_image = "obj_eletric_pump_64.png",
})
minetest.register_craft({
	output = "ufos:eletric_pump",
	recipe = {
		{"ufos:copper_wire",		"ufos:capacitor",			"ufos:steel_pipe"},
		{"ufos:switch_button",	"ufos:copper_coil",		"default:steelblock"},
		{"ufos:copper_wire",		"ufos:printed_circuit",	"ufos:steel_pipe"}
	}
})

--########################################################################################################################

minetest.register_craftitem("ufos:bioresin", {
	description = modUFO.translate("Bioresin"),
	inventory_image = "obj_bioresin_16.png",
})
-- Dig 'ufos:bioresin' in 'default:pine_tree'
local drops = {}
table.insert(drops, {items = {'default:pine_tree'}})
table.insert(drops, {items = {'ufos:bioresin'},rarity = 5}) -- rarity:5 = 1/5 = 20%
minetest.override_item("default:pine_tree", {drop = {max_items=#drops, items=drops}}) --2 items per dig


--########################################################################################################################

minetest.register_craftitem("ufos:ionized_bioresin", {
	description = modUFO.translate("Ionized Bioresin"),
	inventory_image = "obj_ionized_bioresin_32.png",
})
minetest.register_craft({
	output = "ufos:ionized_bioresin 9",
	recipe = {
		{"ufos:bioresin",	"ufos:bioresin",			"ufos:bioresin"},
		{"ufos:bioresin", 	"default:mese_crystal_fragment", 	"ufos:bioresin"},
		{"ufos:bioresin", 	"ufos:bioresin",			"ufos:bioresin"}
	}
})




--########################################################################################################################

minetest.register_craftitem("ufos:bioplastic_mass", {
	description = modUFO.translate("Bioplastic Mass"),
	inventory_image = "obj_bioplastic_mass_16.png",
})
minetest.register_craft({
	type = "shapeless",
	output = "ufos:bioplastic_mass",
	recipe = {"ufos:bioresin",	"default:coal_lump"}
})

--########################################################################################################################

minetest.register_craftitem("ufos:bioplastic_ingot", {
	description = modUFO.translate("Bioplastic Ingot"),
	inventory_image = "obj_bioplastic_ingot_16.png",
})
minetest.register_craft({
    type = "cooking",
    output = "ufos:bioplastic_ingot",
    recipe = "ufos:bioplastic_mass",
    cooktime = 10,
})

--########################################################################################################################

minetest.register_craftitem("ufos:speaker", {
	description = modUFO.translate("Speaker"),
	inventory_image = "obj_speaker_64.png",
})
minetest.register_craft({
	output = "ufos:speaker",
	recipe = {
		{"default:paper",	"ufos:bioplastic_ingot",	"ufos:bioplastic_ingot"},
		{"", 			"default:paper", 		"ufos:copper_coil"},
		{"default:paper", 	"ufos:bioplastic_ingot",	"ufos:bioplastic_ingot"}
	}
})

--########################################################################################################################

minetest.register_craftitem("ufos:printed_circuit", {
	description = modUFO.translate("Printed Circuit"),
	inventory_image = "obj_printed_circuit_96.png",
})
minetest.register_craft({
	output = "ufos:printed_circuit",
	recipe = {
		{"default:copper_ingot",	"ufos:bioplastic_ingot", 	"default:copper_ingot"},
		{"ufos:bioplastic_ingot", 	"default:copper_ingot", 	"ufos:bioplastic_ingot"},
		{"default:copper_ingot", 	"ufos:bioplastic_ingot",	"default:copper_ingot"}
	}
})


--########################################################################################################################

minetest.register_craftitem("ufos:oxigen_system", {
	description = modUFO.translate("Oxigen System"),
	inventory_image = "obj_oxigen_system_64.png",
})
minetest.register_craft({
	type = "shapeless",
	output = "ufos:oxigen_system",
	recipe = {"ufos:cylinder",	"ufos:eletric_pump", 	"ufos:printed_circuit"}

})

--########################################################################################################################

minetest.register_craftitem("ufos:switch_button", {
	description = modUFO.translate("Switch Button"),
	inventory_image = "obj_switch_button_on_96.png",
})
minetest.register_craft({
	output = "ufos:switch_button",
	recipe = {
		{"default:steel_ingot",			"", 								""},
		{"ufos:bioplastic_ingot", 		"ufos:bioplastic_ingot", 	"ufos:bioplastic_ingot"},
		{"ufos:copper_wire", 			"default:copper_ingot",		"ufos:copper_wire"}
	}
})

--########################################################################################################################

--[[
Panel:
1 1 1	← 1 = Gauge*
2 2 2	← 2 = Button*
3 4 3	← 3 = Bioplastic Ingot*
			← 4 = Computer*

--]]

minetest.register_craftitem("ufos:panel", {
	description = modUFO.translate("Panel"),
	inventory_image = "obj_panel_96.png",
})
minetest.register_craft({
	output = "ufos:panel",
	recipe = {
		{"ufos:gauge",					"ufos:gauge", 					"ufos:gauge"},
		{"ufos:switch_button", 		"ufos:switch_button", 		"ufos:switch_button"},
		{"ufos:speaker", 				"ufos:computer",				"default:key"}
	}
})

--########################################################################################################################

--[[

Manche:
1 x 1	← 1 = Bioplastic Ingot*
2 2 2	← 2 = Steel Ingot*
x 2 x
--]]

minetest.register_craftitem("ufos:pilot_manche", {
	description = modUFO.translate("Pilot Manche"),
	inventory_image = "obj_pilot_manche_96.png",
})
minetest.register_craft({
	output = "ufos:pilot_manche",
	recipe = {
		{"ufos:bioplastic_ingot",	"", 								"ufos:bioplastic_ingot"},
		{"default:steel_ingot", 	"default:steelblock", 		"default:steel_ingot"},
		{"", 								"default:steelblock",		""}
	}
})



--########################################################################################################################

--[[
Upholstered Chair:
x x 1	← 1 = Wool Group*
x x 1	← 2 = Steel Ingot*
x 1 2
--]]

minetest.register_craftitem("ufos:upholstered_chair", {
	description = modUFO.translate("Upholstered Chair"),
	inventory_image = "obj_upholstered_chair_96.png",
})
minetest.register_craft({
	output = "ufos:upholstered_chair",
	recipe = {
		{"",	"", 				"wool:red"},
		{"", 	"", 				"wool:red"},
		{"", 	"wool:red",		"default:steel_ingot"}
	}
})

--########################################################################################################################

--[[
Steel Ring:
1 1 1	← 1 = Steel Block
1 x 1
1 1 1
--]]

minetest.register_craftitem("ufos:steel_ring", {
	description = modUFO.translate("Steel Ring"),
	inventory_image = "obj_steel_ring_32.png",
})
minetest.register_craft({
	output = "ufos:steel_ring",
	recipe = {
		{"",								"default:steel_ingot", 	""},
		{"default:steel_ingot", 	"",						 	"default:steel_ingot"},
		{"",							 	"default:steel_ingot",	""}
	}
})

--########################################################################################################################

--[[
Toroidal Copper Coil:
1 1 1	← 1 = Copper Wire
1 2 1	← 2 = Steel Ring
1 1 1
--]]

minetest.register_craftitem("ufos:copper_coil_toroidal", {
	description = modUFO.translate("Toroidal Copper Coil"),
	inventory_image = "obj_cooper_coil_toroidal_64.png",
})
minetest.register_craft({
	output = "ufos:copper_coil_toroidal",
	recipe = {
		{"ufos:copper_wire",		"ufos:copper_wire", 	"ufos:copper_wire"},
		{"ufos:copper_wire", 	"ufos:steel_ring", 	"ufos:copper_wire"},
		{"ufos:copper_wire", 	"ufos:copper_wire",	"ufos:copper_wire"}
	}
})


--########################################################################################################################

--[[
Microwave Resonance Chamber: 
 1 2 1	 ← 1 = Steel Ingot*
 1 3 1	 ← 2 = Copper Coil*
 1 2 1	 ← 3 = Mese Crystal*
--]]

minetest.register_craftitem("ufos:microwave_resonance_chamber", {
	description = modUFO.translate("Microwave Resonance Chamber"),
	inventory_image = "obj_microwave_resonance_chamber_96.png",
})
minetest.register_craft({
	output = "ufos:microwave_resonance_chamber",
	recipe = {
		{"default:steel_ingot",		"ufos:copper_coil",		 	"default:steel_ingot"},
		{"default:steel_ingot", 	"default:mese_crystal", 	"default:steel_ingot"},
		{"default:steel_ingot", 	"ufos:copper_coil",			"default:steel_ingot"}
	}
})

--########################################################################################################################

--[[
Emdrive:
 4 1 1	 ← 1 = Steel Ingot*
 3 1 x	 ← 2 = Power Cell*
 2 1 1	 ← 3 = Microwave Resonance Chamber*
		 	 ← 4 = Printed Circuits*
--]]

minetest.register_craftitem("ufos:emdrive", {
	description = modUFO.translate("Emdrive"),
	inventory_image = "obj_emdrive_96.png",
})
minetest.register_craft({
	output = "ufos:emdrive",
	recipe = {
		{"default:steel_ingot",		"default:steel_ingot", 	"ufos:printed_circuit"},
		{"", 								"default:steel_ingot", 	"ufos:microwave_resonance_chamber"},
		{"default:steel_ingot", 	"default:steel_ingot",	"ufos:power_cell"}
	}
})

--########################################################################################################################

--[[
Cockpit:
1 x 6	← 1 = Panel*
5 2 3	← 2 = Pilot Manches*
4 4 4	← 3 = Upholstered Chair*
			← 4 = Steel Block*
			← 5 = Computer
			← 6 = Speaker
--]]
minetest.register_craftitem("ufos:cockpit", {
	description = modUFO.translate("Cockpit"),
	inventory_image = "obj_cockpit_128.png",
})

minetest.register_craft({
	output = "ufos:cockpit",
	recipe = {
		{"",							"", 							""},
		{"ufos:panel", 			"ufos:pilot_manche", 	"ufos:upholstered_chair"},
		{"default:steelblock", 	"default:steelblock",	"default:steelblock"}
	}
})

--########################################################################################################################

--[[
Microprocessor:
 2 1 2	← 1 = Lingote de Ouro*
 2 3 2	← 2 = Bioplastic Ingot *
 2 1 2	← 3 = Cristal de Diamante*
--]]

minetest.register_craftitem("ufos:microprocessor", {
	description = modUFO.translate("Microprocessor"),
	inventory_image = "obj_microprocessor_96.png",
})
minetest.register_craft({
	output = "ufos:microprocessor",
	recipe = {
		{"ufos:bioplastic_ingot",	"ufos:gold_wire",		"ufos:bioplastic_ingot"},
		{"ufos:bioplastic_ingot", 	"default:diamond",	"ufos:bioplastic_ingot"},
		{"ufos:bioplastic_ingot", 	"ufos:gold_wire",		"ufos:bioplastic_ingot"}
	}
})

--########################################################################################################################

--[[
Power Cell:
 1 1 1	← 1 = Steel Block*
 2 2 2	← 2 = Pilhas/Batery (type D)*
 3 3 3	← 3 = Diamond Block*
--]]

minetest.register_craftitem("ufos:power_cell", {
	description = modUFO.translate("Power Cell"),
	inventory_image = "obj_power_cell_96.png",
})
minetest.register_craft({
	output = "ufos:power_cell",
	recipe = {
		{"default:steelblock",		"default:steelblock", 		"default:steelblock"},
		{"ufos:batery", 				"ufos:batery", 				"ufos:batery"},
		{"default:diamondblock", 	"default:diamondblock",		"default:diamondblock"}
	}
})

--########################################################################################################################

--[[
Pilhas/Batery (Type D):
 1 2 1	← 1 = Glass*
 1 3 1	← 2 = Tin Block*
 1 4 1	← 3 = Bioresin*
		 	← 4 = Cooper Block*
--]]

minetest.register_craftitem("ufos:batery", {
	description = modUFO.translate("Batery (Type D"),
	inventory_image = "obj_batery_96.png",
})
minetest.register_craft({
	output = "ufos:batery",
	recipe = {
		{"default:obsidian_glass",		"default:tin_ingot", 		"default:obsidian_glass"},
		{"default:obsidian_glass", 	"ufos:bioresin", 				"default:obsidian_glass"},
		{"default:obsidian_glass", 	"default:copper_ingot",		"default:obsidian_glass"}
	}
})

--########################################################################################################################

--[[
Resistor:
x 1 2	← 1 = Bioplastic Ingot*
1 3 1	← 2 = Copper Wire*
2 1 x	← 3 = Coal*
--]]

minetest.register_craftitem("ufos:resistor", {
	description = modUFO.translate("Resistor"),
	inventory_image = "obj_resistor_96.png",
})
minetest.register_craft({
	output = "ufos:resistor",
	recipe = {
		{"",								"ufos:bioplastic_ingot", 	"ufos:copper_wire"},
		{"ufos:bioplastic_ingot", 	"default:coalblock",			"ufos:bioplastic_ingot"},
		{"ufos:copper_wire", 		"ufos:bioplastic_ingot",	""}
	}
})

--########################################################################################################################

--[[
Capacitor:
3 1 3	← 1 = Paper*
3 1 3	← 2 = Steel Wire*
2 x 2	← 3 = Bioplastic Ingot**
--]]

minetest.register_craftitem("ufos:capacitor", {
	description = modUFO.translate("Capacitor"),
	inventory_image = "obj_capacitor_96.png",
})
minetest.register_craft({
	output = "ufos:capacitor",
	recipe = {
		{"ufos:bioplastic_ingot",	"default:paper", 	"ufos:bioplastic_ingot"},
		{"ufos:bioplastic_ingot", 	"default:paper", 	"ufos:bioplastic_ingot"},
		{"ufos:steel_wire", 			"",					"ufos:steel_wire"}
	}
})

--########################################################################################################################

--[[
RAM Memory:
3 3 3	← 1 = Microprocessor
1 1 1	← 2 = Printed Circuits
2 2 2	← 3 = button
--]]

minetest.register_craftitem("ufos:ram_memory", {
	description = modUFO.translate("RAM Memory"),
	inventory_image = "obj_ram_memory_96.png",
})
minetest.register_craft({
	output = "ufos:ram_memory",
	recipe = {
		{"ufos:switch_button",		"ufos:switch_button", 	"ufos:switch_button"},
		{"ufos:microprocessor", 	"ufos:microprocessor", 	"ufos:microprocessor"},
		{"ufos:printed_circuit", 	"ufos:printed_circuit",	"ufos:printed_circuit"}
	}
})

--########################################################################################################################

minetest.register_craftitem("ufos:gold_wire", {
	description = modUFO.translate("Gold Wire"),
	inventory_image = "obj_gold_wire_64.png",
})

minetest.register_craft({
	output = "ufos:gold_wire",
	recipe = {
		{"",							"",						 	"default:gold_ingot"},
		{"",					 		"default:gold_ingot", 	""},
		{"default:gold_ingot", 	"",							""}
	}
})


--########################################################################################################################

--[[
DNA Checker:
 5 1 5	← 1 = Toroidal Copper Coil*
 2 3 2	← 2 = Gold Wire*
 4 4 4	← 3 = Microprocessor*
		 	← 4 = Printed Circuit*
		 	← 5 = Obsidian Glass*
--]]

minetest.register_craftitem("ufos:dna_checker", {
	description = modUFO.translate("DNA Checker"),
	inventory_image = "obj_dna_checker_96.png",
})
minetest.register_craft({
	output = "ufos:dna_checker",
	recipe = {
		{"default:obsidian_glass",	"default:diamond", 				"default:obsidian_glass"},
		{"ufos:gold_wire", 			"ufos:copper_coil_toroidal",	"ufos:gold_wire"},
		{"ufos:printed_circuit", 	"ufos:printed_circuit",			"ufos:printed_circuit"}
	}
})

--########################################################################################################################

--[[
Computer:
 1 2 3	← 1 = Resistor*
 4 5 6	← 2 = Copper Wire*
 7 8 9	← 3 = Capacitor*
		 	← 4 = DNA Checker*
		 	← 5 = Microprocessor*
		 	← 6 = Gauge*
		 	← 7 = Bonina Toroidal de Copper*
		 	← 8 = Printed Circuit*
		 	← 9 = RAM Memory*
--]]

minetest.register_craftitem("ufos:computer", {
	description = modUFO.translate("Computer"),
	inventory_image = "obj_computer_128.png",
})
minetest.register_craft({
	output = "ufos:computer",
	recipe = {
		{"ufos:resistor",			"ufos:copper_coil_toroidal",		"ufos:capacitor"},
		{"ufos:dna_checker", 	"ufos:microprocessor", 				"ufos:switch_button"},
		{"ufos:copper_wire",		"ufos:printed_circuit",				"ufos:ram_memory"}
	}
})

--########################################################################################################################

--[[
Ship: 
 x 2 x	← 1 = Oxigen System*
 2 3 2	← 2 = Glass*
 5 4 1	← 3 = Cockpit*
			← 4 = EmDrive*
			← 5 = Lamp*
--]]
minetest.register_craft( {
	output = 'ufos:ship',
	recipe = {
		{ "", 							"default:glass", 		""},
		{ "default:glass", 			"ufos:cockpit", 		"default:glass"},
		{ "ufos:eletric_lamp", 		"ufos:emdrive", 		"ufos:oxigen_system"},
	},
})
