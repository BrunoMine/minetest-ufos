modUFO.ufo = {
	shipname="",
	waypoint_handler = nil,
	waypoint_position = nil;
	waypoint_actived = "false",
	inertia_cancel = "true",
	forge = {
		source = nil,
		temperature = 0, --0 to 100%
		enabled = false,
		visibled = false,
		upgrade_formspec = 0,
		upgrade_temperature = 0,
		cook_time_count = 0,
		cook_time_end = 0,
	},
	physical = true,
	collisionbox = {-1.5,-0.5,-1.5	 ,1.5,1.0,1.5}, --top retracted to use sword as it flies.
	visual = "mesh",
	mesh = "ufo.x",
	textures = {"ufo_0.png"},
	
	driver = nil,
	owner_name = "",
	v = 0,
	fuel = 0,
	fueli = 0, -- ← Fuel Image
	soundHandle=nil,
}

function modUFO.ufo:on_rightclick (clicker)
	if not clicker or not clicker:is_player() then
		return
	end
	
	if self.driver and clicker == self.driver then
		local floorPos = self.object:getpos()
		floorPos.y = floorPos.y-1
		local nodename = minetest.env:get_node(floorPos).name
		--[[
		local vel = self.object:getvelocity()
		local velAverage = math.sqrt((vel.x^2)+(vel.y^2)+(vel.z^2))
		local ctrl = self.driver:get_player_control()
		--]]
		
		minetest.register_on_player_receive_fields(function(sender, formname, fields)
			modUFO.on_player_receive_fields(self, sender, formname, fields)
		end)

		minetest.show_formspec(
			clicker:get_player_name(),
			"frmUFO",
			modUFO.getFormSpecs.mainmenu(nodename=="air")
		)
	elseif not self.driver then
		if modUFO.check_owner(self,clicker) then
			self.driver = clicker
			clicker:set_attach(self.object, "", {x=0,y=7.5,z=0}, {x=0,y=0,z=0})
			if clicker:get_player_name() == self.owner_name then
				modUFO.send_message(self, clicker:get_player_name(), 
					modUFO.translate("Welcome to your ship, Captain %s!"):format(self.owner_name)
				)
				minetest.sound_play(
					modUFO.translate("welcome_en"), 
					{object = self.object, gain = 2.0, max_hear_distance = 5}
				)
			end
			self.soundHandle=minetest.sound_play(
				"sfx_ufo",
				{object = self.object, gain = 2.0, max_hear_distance = 5, loop = true,}
			)
		end
	end
end

function modUFO.ufo:on_activate (staticdata, dtime_s)
	if modUFO.next_owner ~= "" then
		self.owner_name = modUFO.next_owner
		modUFO.next_owner = ""
	else
		local data = staticdata:split(';')
		self.owner_name = data[1] or ""
		self.fuel = tonumber(data[2] or 0)
		self.shipname = tostring(data[3] or "")
		self.waypoint_actived = data[4] or "false"
		self.inertia_cancel = data[5] or "true"
	end
	if self.waypoint_handler and self.owner_name~="" then
		local owner = minetest.get_player_by_name(self.owner_name)
		if owner:is_player() then
			owner:hud_remove(self.waypoint_handler)
			self.waypoint_handler = nil
		end
	end
	self.object:set_armor_groups({immortal=1})	
end

function modUFO.ufo:on_punch (puncher, time_from_last_punch, tool_capabilities, direction)
	if puncher and puncher:is_player() then
		if modUFO.check_owner(self,puncher) then
			if not self.driver then
				if self.soundHandle~=nil then 
					minetest.sound_stop(self.soundHandle) 
				end
				puncher:get_inventory():add_item("main", modUFO.ufo_to_item(self))
				if self.waypoint_handler then
					puncher:hud_remove(self.waypoint_handler)
					self.waypoint_handler = nil
				end
				self.object:remove()
			else
				modUFO.send_message(self, puncher:get_player_name(), 
					modUFO.translate(
						"It is not possible to shrink this vehicle before the captain '%s' comes out of it!"
					):format(self.owner_name)
				)
				modUFO.play_fail(self.object)
			end
		end
	end
end

function modUFO.ufo:on_step (dtime)
	local fuel = modUFO.get_fuel(self)
	if self.driver then
		self.driver:set_breath(11)
		local ctrl = self.driver:get_player_control()
		local vel = self.object:getvelocity()
		if fuel == nil then fuel = 0 end
		
		if fuel > 0 and ctrl.up then
			vel.x = vel.x + math.cos(self.object:getyaw()+math.pi/2)*modUFO.ship_acceleration
			vel.z = vel.z + math.sin(self.object:getyaw()+math.pi/2)*modUFO.ship_acceleration
			fuel = fuel - modUFO.ship_fuel_use
		elseif self.inertia_cancel=="true" or fuel <= 0 then
			if not ctrl.aux1 or fuel <= 0 then
				vel.x = vel.x*.99
				vel.z = vel.z*.99
			end
		else --Spend fuel constantly if you disable the 'Inertia Override'.
			fuel = fuel - (modUFO.ship_fuel_use / 2) -- Constant fuel expense will less in 50%.
		end
		if fuel > 0 and ctrl.left then
			if not ctrl.aux1 then
				self.object:setyaw(self.object:getyaw()+math.pi/120*modUFO.ship_turn_speed)
			else
				vel.x = vel.x + (math.cos(self.object:getyaw()-math.pi)*modUFO.ship_acceleration)
				vel.z = vel.z + (math.sin(self.object:getyaw()+math.pi)*modUFO.ship_acceleration)
				fuel = fuel - modUFO.ship_fuel_use
			end
		elseif fuel > 0 and ctrl.right then
			if not ctrl.aux1 then
				self.object:setyaw(self.object:getyaw()-math.pi/120*modUFO.ship_turn_speed)
			else
				vel.x = vel.x - (math.cos(self.object:getyaw()-math.pi)*modUFO.ship_acceleration)
				vel.z = vel.z - (math.sin(self.object:getyaw()+math.pi)*modUFO.ship_acceleration)
				fuel = fuel - modUFO.ship_fuel_use
			end
		end
		if ctrl.down then --The brake not waste fuel.
			vel.x = vel.x * modUFO.ship_brake
			vel.y = vel.y * modUFO.ship_brake
			vel.z = vel.z * modUFO.ship_brake
		end
		if fuel > 0 and ctrl.jump then
			vel.y = vel.y + modUFO.ship_acceleration
			fuel = fuel - modUFO.ship_fuel_use
		elseif ctrl.sneak then --landing does not waste fuel.
			vel.y = vel.y - modUFO.ship_acceleration
		else --No disable 'Inertia Override' to up or down the UFO.
			vel.y = vel.y * 0.9
		end
		
		if vel.x > modUFO.ship_max_speed then vel.x = modUFO.ship_max_speed end
		if vel.x < -modUFO.ship_max_speed then vel.x = -modUFO.ship_max_speed end
		if vel.y > modUFO.ship_max_speed then vel.y = modUFO.ship_max_speed end
		if vel.y < -modUFO.ship_max_speed then vel.y = -modUFO.ship_max_speed end
		if vel.z > modUFO.ship_max_speed then vel.z = modUFO.ship_max_speed end
		if vel.z < -modUFO.ship_max_speed then vel.z = -modUFO.ship_max_speed end
		self.object:setvelocity(vel)
		
		if ctrl.down and ctrl.aux1 then 
			--S Key + 'Run Key'(R or Ctrl) = Sound effect of 'five tones' of film 'close encounters of the third kind'.
			if self.soundHandle~=nil then minetest.sound_stop(self.soundHandle) end
			self.soundHandle=minetest.sound_play(
				"sfx_five_tones",
				{object = self.object, gain = 2.0, max_hear_distance = 50}
			)
		end
		if ctrl.sneak and ctrl.aux1 then --emergency eject
			self.driver:set_detach()
			self.driver = nil
			if self.soundHandle~=nil then 
				minetest.sound_stop(self.soundHandle) 
			end
		end
		if ctrl.aux1 then --recharge fuel
			local pos = self.object:getpos()
			local t = {{x=2,z=0},{x=-2,z=0},{x=0,z=2},{x=0,z=-2}}
			for _, i in ipairs(t) do
				pos.x = pos.x + i.x; pos.z = pos.z + i.z;
				if minetest.env:get_node(pos).name == "ufos:furnace" then
					meta = minetest.env:get_meta(pos)
					if fuel < 100 and meta:get_int("charge") > 0 then
						fuel = fuel + 1
						meta:set_int("charge",meta:get_int("charge")-1)
						meta:set_string("formspec", 
							modUFO.getFormSpecs.furnace
							--.. "label[0,0;Charge: "..meta:get_int("charge"))
							.. "label[1.95,0.6; "..modUFO.translate("Charge: %02d GWh (Gigawatts Hour)"):format(meta:get_int("charge")).. "]"
						)
					end
				end
				pos.x = pos.x - i.x; pos.z = pos.z - i.z;
			end
		end
		if self.waypoint_handler then
			self.driver:hud_remove(self.waypoint_handler)
			self.waypoint_handler = nil
		end
		if self.forge.visibled and self.forge.upgrade_formspec~=os.time() then
			modUFO.doButtonForge(self, self.driver)
		end
	else --if self.driver then
		local vel = self.object:getvelocity()
		vel.y = vel.y - 0.5
		self.object:setvelocity(vel)
		
		if self.owner_name~="" then
			local owner = minetest.get_player_by_name(self.owner_name)
			if owner:is_player() then
				if self.waypoint_actived=="true"	then
					if self.waypoint_position ~= self.object:getpos() then
						self.waypoint_position = self.object:getpos()
						if self.waypoint_handler then
							--owner:hud_remove(self.waypoint_handler)
							owner:hud_change(self.waypoint_handler, "name", self.shipname:upper())
							owner:hud_change(self.waypoint_handler, "world_pos", self.object:getpos())
						else
							self.waypoint_handler = owner:hud_add({
								hud_elem_type = "waypoint",
								name = self.shipname:upper(),
								--number = modbeacon2.huds.doRgb2hex(thisBeacon.color),
								number = "0x8888FF",  
								world_pos = self.object:getpos()
							})
						end
					end
				elseif self.waypoint_handler then
					owner:hud_remove(self.waypoint_handler)
					self.waypoint_handler = nil
				end
			end
		end
	end --if self.driver then
	
	if fuel < 0 then 
		fuel = 0 
		local vel = self.object:getvelocity()
		vel.y = vel.y - 0.5
		self.object:setvelocity(vel)
	elseif fuel > 100 then 
		fuel = 100 
	end
	
	if self.fueli ~= math.ceil(fuel*8/100) then
		self.fueli = math.ceil(fuel*8/100)
		--print(self.fueli)
		self.textures = {"ufo_"..self.fueli..".png"}
		self.object:set_properties(self)
	end

	modUFO.set_fuel(self,fuel)	
	
	modUFO.onForgeStep(self)	
	
	

end

function modUFO.ufo:get_staticdata()
	--[[
	if self.waypoint_handler and self.owner_name~="" then
		local owner = minetest.get_player_by_name(self.owner_name)
		if owner:is_player() then
			owner:hud_remove(self.waypoint_handler)
			self.waypoint_handler = nil
		end
	end
	--]]
	return 
		tostring(self.owner_name)
		..";"..tostring(self.fuel)
		..";"..tostring(self.shipname or "")
		..";"..tostring(self.waypoint_actived)
		..";"..tostring(self.inertia_cancel)
end

minetest.register_entity("ufos:ship", modUFO.ufo)


minetest.register_tool("ufos:ship", {
	description = modUFO.translate("ufo"):upper(),
	inventory_image = "ufos_inventory.png",
	wield_image = "ufos_inventory.png",
	tool_capabilities = {load=0,max_drop_level=0, groupcaps={fleshy={times={}, uses=100, maxlevel=0}}},
	
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.type ~= "node" then
			return
		end
		
		if placer and not placer:get_player_control().sneak then -- Call on_rightclick if the pointed node defines it
			local n = minetest.get_node(pointed_thing.under)
			local nn = n.name
			if minetest.registered_nodes[nn] and minetest.registered_nodes[nn].on_rightclick then
				return minetest.registered_nodes[nn].on_rightclick(pointed_thing.under, n, placer, itemstack) or itemstack
			end
		end
		
		modUFO.ufo_from_item(itemstack,placer,pointed_thing)
		return itemstack
	end,
})

minetest.register_craft( {
	output = 'ufos:ship',
	recipe = {
		{ "", "default:glass", ""},
		{ "default:mese_crystal_fragment", "", "default:mese_crystal_fragment"},
		{ "default:steelblock", "default:mese", "default:steelblock"},
	},
})

--[[
-- ufos box kept for compatibility only
minetest.register_node("ufos:box", {
	description = "UFO BOX (you hacker you!)",
	tiles = {"ufos_box.png"},
	groups = {not_in_creative_inventory=1},
	on_rightclick = function(pos, node, clicker, itemstack)
		meta = minetest.env:get_meta(pos)
		if meta:get_string("owner") == clicker:get_player_name() then
			-- set owner
			modUFO.next_owner = meta:get_string("owner")
			-- restore the fuel inside the node
			modUFO.set_fuel(modUFO.ufo,meta:get_int("fuel"))
			-- add the entity
			e = minetest.env:add_entity(pos, "ufos:ship")
			-- remove the node
			minetest.env:remove_node(pos)
			-- reset owner for next ufo
			modUFO.next_owner = ""
		end
	end,
})
--]]

minetest.register_alias("ufo","ufos:ship")
minetest.register_alias(modUFO.translate("ufo"),"ufos:ship")
minetest.register_alias(modUFO.translate("ship"),"ufos:ship")