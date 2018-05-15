minetest.register_craftitem("ufos:steel_wire", {
	description = modUFO.translate("Steel Wire"),
	inventory_image = "obj_steel_wire_64.png",
})

minetest.register_craftitem("ufos:steel_spiral", {
	description = modUFO.translate("Steel Spiral"),
	inventory_image = "obj_steel_spiral_64.png",
})

minetest.register_craftitem("ufos:eletric_lamp", {
	description = modUFO.translate("Eletric Lamp"),
	inventory_image = "obj_eletric_lamp_64.png",
})

minetest.register_craftitem("ufos:gauge", {
	description = modUFO.translate("Gauge"),
	inventory_image = "obj_gauge_64.png",
})

minetest.register_craftitem("ufos:cylinder", {
	description = modUFO.translate("Cylinder"),
	inventory_image = "obj_cylinder_64.png",
})

minetest.register_craftitem("ufos:steel_pipe", {
	description = modUFO.translate("Steel Pipe"),
	inventory_image = "obj_steel_pipe_96.png",
})

minetest.register_craftitem("ufos:steel_core", {
	description = modUFO.translate("Steel Core"),
	inventory_image = "obj_steel_core_64.png",
})

minetest.register_craftitem("ufos:copper_wire", {
	description = modUFO.translate("Copper Wire"),
	inventory_image = "obj_copper_wire_64.png",
})

minetest.register_craftitem("ufos:copper_coil", {
	description = modUFO.translate("Copper Coil"),
	inventory_image = "obj_copper_coil_64.png",
})

minetest.register_craftitem("ufos:eletric_pump", {
	description = modUFO.translate("Eletric Pump"),
	inventory_image = "obj_eletric_pump_64.png",
})

minetest.register_craftitem("ufos:bioresin", {
	description = modUFO.translate("Bioresin"),
	inventory_image = "obj_bioresin_16.png",
})

minetest.register_craftitem("ufos:ionized_bioresin", {
	description = modUFO.translate("Ionized Bioresin"),
	inventory_image = "obj_ionized_bioresin_32.png",
})


minetest.register_craftitem("ufos:bioplastic_mass", {
	description = modUFO.translate("Bioplastic Mass"),
	inventory_image = "obj_bioplastic_mass_16.png",
})

minetest.register_craftitem("ufos:bioplastic_ingot", {
	description = modUFO.translate("Bioplastic Ingot"),
	inventory_image = "obj_bioplastic_ingot_16.png",
})

minetest.register_craftitem("ufos:speaker", {
	description = modUFO.translate("Speaker"),
	inventory_image = "obj_speaker_64.png",
})

minetest.register_craftitem("ufos:printed_circuit", {
	description = modUFO.translate("Printed Circuit"),
	inventory_image = "obj_printed_circuit_96.png",
})

minetest.register_craftitem("ufos:oxigen_system", {
	description = modUFO.translate("Oxigen System"),
	inventory_image = "obj_oxigen_system_64.png",
})

minetest.register_craftitem("ufos:switch_button", {
	description = modUFO.translate("Switch Button"),
	inventory_image = "obj_switch_button_on_96.png",
})

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

minetest.register_craftitem("ufos:gold_wire", {
	description = modUFO.translate("Gold Wire"),
	inventory_image = "obj_gold_wire_64.png",
})


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

