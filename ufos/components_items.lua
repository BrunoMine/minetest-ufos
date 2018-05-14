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
Cockpit:
1 x 6	← 1 = Panel*
5 2 3	← 2 = Controls*
4 4 4	← 3 = Upholstered Chair*
			← 4 = Steel Block*
			← 5 = Computer
			← 5 = Speaker

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
	inventory_image = "obj_microwave_resonance_chamber.png",
})

--[[
Emdrive:
 2 1 1	 ← 1 = Steel Ingot*
 3 1 x	 ← 2 = Steel Spiral*
 2 1 1	 ← 3 = Microwave Resonance Chamber*
		 	 ← 4 = Printed Circuits*
--]]

minetest.register_craftitem("ufos:emdrive", {
	description = modUFO.translate("Emdrive"),
	inventory_image = "obj_emdrive.png",
})

--[[
Frame: 
 x 2 x	← 1 = Steel Block*
 2 3 2	← 2 = Glass*
 1 4 1	← 3 = Cockpit*
			← 4 = EmDrive
--]]

minetest.register_craftitem("ufos:frame", {
	description = modUFO.translate("UFO Frame"),
	inventory_image = "obj_frame.png",
})


--[[
Microprocessor:
 1 2 1	← 1 = Lingote de Ouro*
 1 3 1	← 2 = Bioplastic Ingot *
 1 2 1	← 3 = Cristal de Diamante*
--]]

minetest.register_craftitem("ufos:frame", {
	description = modUFO.translate("UFO Frame"),
	inventory_image = "obj_frame.png",
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
4 1 2	← 1 = Paper*
1 3 1	← 2 = Copper Wire*
2 1 4	← 3 = Coal*
		 	← 4 = Bioplastic Ingot*
--]]

minetest.register_craftitem("ufos:resistor", {
	description = modUFO.translate("Resistor"),
	inventory_image = "obj_resistor.png",
})

--[[
Capacitor:
4 1 2	← 1 = Paper*
1 3 1	← 2 = Steel Wire*
2 2 4	← 3 = Paper*
		 	← 4 = Bioplastic Ingot*
--]]

minetest.register_craftitem("ufos:capacitor", {
	description = modUFO.translate("Capacitor"),
	inventory_image = "obj_capacitor_96.png",
})

--[[
RAM Memory:
1 1 1	← 1 = Printed Circuits
2 2 2	← 2 = Microprocessor
3 3 3	← 3 = Copper Ingote
--]]

minetest.register_craftitem("ufos:ram_memory", {
	description = modUFO.translate("RAM Memory"),
	inventory_image = "obj_ram_memory.png",
})

--[[
Empty Syringe:
x 1 2	← 1 = Glass*
1 x 1	← 2 = Stick*
3 1 x	← 3 = Steel Ingot
--]]

minetest.register_craftitem("ufos:empty_syringe", {
	description = modUFO.translate("Empty Syringe"),
	inventory_image = "obj_empty_syringe.png",
})

--[[
Syringe with Blood: 
 * Use 'Empty Syringe' to take HP-1 of you self to transform this in Syringe with Blood
--]]

minetest.register_craftitem("ufos:syringe_with_blood", {
	description = modUFO.translate("Syringe with Blood"),
	inventory_image = "obj_syringe_with_blood.png",
})

--[[
Brain Interface:
 x 1 x	← 1 = Syringe with Blood*
 2 3 2	← 2 = Copper Wire*
 4 4 4	← 3 = Microprocessor*
		 	← 4 = Printed Circuit*
--]]

minetest.register_craftitem("ufos:brain_interface", {
	description = modUFO.translate("Brain Interface"),
	inventory_image = "obj_brain_interface.png",
})

--[[
Computer:
 1 2 3	← 1 = Resistor*
 4 5 6	← 2 = Copper Wire*
 7 8 9	← 3 = Capacitor*
		 	← 4 = Brain Interface*
		 	← 5 = Microprocessor*
		 	← 6 = Gauge*
		 	← 7 = Bonina Toroidal de Copper*
		 	← 8 = Printed Circuit*
		 	← 9 = RAM Memory*
--]]

minetest.register_craftitem("ufos:computer", {
	description = modUFO.translate("Computer"),
	inventory_image = "obj_computer.png",
})

