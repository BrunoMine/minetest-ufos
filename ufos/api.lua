minetest.register_privilege(
	"parkingman",  {
		description=modUFO.translate("Control the UFOs of other players."), 
		give_to_singleplayer=false,
	}
)

--[[
modUFO.floor_pos = function(pos)
	return {x=math.floor(pos.x),y=math.floor(pos.y),z=math.floor(pos.z)}
end
--]]

modUFO.play_fail = function(object)
	minetest.sound_play(
		"sfx_falha", 
		{object = object, gain = 2.0, max_hear_distance = 5}
	)
end

modUFO.send_message = function(self, playername, message)
	local newmsg = core.get_color_escape_sequence("#00FF00").."["
	if self and self.shipname~="" then
		newmsg=newmsg
		--..modUFO.translate("ufo"):upper().. " "
		..self.shipname:upper()
	else
		newmsg=newmsg..modUFO.translate("ufo"):upper()
	end
	newmsg=newmsg.."] "..core.get_color_escape_sequence("#FFFFFF")..message
	minetest.chat_send_player(playername, newmsg)
end


modUFO.getItemImage = function (objFuel)
	local props = minetest.registered_items[objFuel]
	if props.inventory_image == nil then 
		props.inventory_image = "" 
	end
	return props.inventory_image
end

modUFO.getItemName = function(objFuel)
	local props = minetest.registered_items[objFuel]
	return props.description
end

modUFO.getFomTheme = function()
	return "bgcolor[#636D76FF;false]"
		..default.gui_bg_img
		..default.gui_slots
	--..default.gui_bg
end

modUFO.doFiveTones = function(self, player)
	--S Key + 'Run Key'(R or Ctrl) = Sound effect of 'five tones' of film 'close encounters of the third kind'.
	if self.soundHandle~=nil then minetest.sound_stop(self.soundHandle) end
	self.soundHandle = minetest.sound_play(
		"sfx_five_tones",	{
			object = player
			,gain = 2.0
			,max_hear_distance = 5 --super near only to not boring other players.
		}
	)
end

modUFO.doButtonFail = function(self, playername, modname)
	modUFO.send_message(
		self, playername, 
		modUFO.translate("This function only work if admin install mod '%s'!"):
		format(
			core.get_color_escape_sequence("#00FF00")
			..modname
			..core.get_color_escape_sequence("#FFFFFF")
			)
	)
	modUFO.play_fail(self.object)
end

modUFO.onForgeStep = function(self)
	if self.forge.upgrade_temperature~=os.time() then
		self.forge.upgrade_temperature=os.time()
		if self.forge.enabled and modUFO.get_fuel(self) > 0 then
			if self.forge.source then
				local srcList = self.forge.source:get_list("src")
				local dstList = self.forge.source:get_list("dst")
				local endPoint = (modUFO.forge.sizeSrc.width * modUFO.forge.sizeSrc.height)
				--modUFO.send_message(self, self.owner_name, "endPoint="..endPoint)
				if not self.forge.source:is_empty("src") and srcList[endPoint]:is_empty() then
					while srcList[endPoint]:is_empty() do
						for i=endPoint, 1, -1 do
							--modUFO.send_message(self, self.owner_name, "srcList["..i.."]:get_name()="..srcList[i]:get_name())
							if i < endPoint and not srcList[i]:is_empty() then
								self.forge.source:set_stack(
									"src", i+1, 
									self.forge.source:get_stack("src", i)
								)
								self.forge.source:set_stack("src", i, {})
							end
						end
						srcList = self.forge.source:get_list("src")
					end
				end

				local cooked, aftercooked = minetest.get_craft_result({
					method="cooking", width=1,  items={ srcList[endPoint] }
				})
				local cookable = cooked.time ~= 0
				if cookable then
					if not srcList[endPoint]:is_empty() then
						self.forge.cook_time_end = cooked.time
						self.forge.cook_time_count = self.forge.cook_time_count + (1 * self.forge.temperature/100)
						if self.forge.cook_time_count >= cooked.time then
							if self.forge.source:room_for_item("dst", cooked.item) then
								self.forge.cook_time_count = 0
								self.forge.source:add_item("dst", cooked.item)
								self.forge.source:set_stack("src", endPoint, aftercooked.items[1])
							else
								self.forge.enabled = false
								self.forge.cook_time_count = 0
								if self.owner_name~="" then
									local owner = minetest.get_player_by_name(self.owner_name)
									if owner:is_player() then
										modUFO.send_message(
											self,
											self.owner_name, 
											modUFO.translate("The forge was turned off for lack of space for cooked items.")
										)
										modUFO.play_fail(self.object)
									end
								end
							end
						end
					end
				else
					self.forge.enabled = false
					self.forge.cook_time_count = 0
					if self.owner_name~="" then
						local owner = minetest.get_player_by_name(self.owner_name)
						if owner:is_player() then
							modUFO.send_message(
								self,
								self.owner_name, 
								modUFO.translate("The forge was turned off for lack of cookable items.")
							)
							modUFO.play_fail(self.object)
						end
					end
				end
			end --if self.forge.source then
			if self.forge.enabled == true then
				if self.forge.temperature < 100 then
					self.forge.temperature = self.forge.temperature + 10
					if self.forge.temperature > 100 then self.forge.temperature = 100 end
				end
				modUFO.set_fuel(self, modUFO.get_fuel(self) - modUFO.forge.fuel_use)
			end
		elseif 
			(not self.forge.enabled or modUFO.get_fuel(self) <= 0) 
			and self.forge.temperature > 0 
		then
			self.forge.temperature = self.forge.temperature - 5
			if self.forge.temperature < 0 then 
				self.forge.temperature = 0 
			end			
			if self.forge.enabled then
				self.forge.cook_time_count = 0
				self.forge.enabled = false
				if self.owner_name~="" then
					local owner = minetest.get_player_by_name(self.owner_name)
					if owner:is_player() then
						modUFO.send_message(
							self,
							self.owner_name, 
							modUFO.translate("The forge was turned off for empty fuel.")
						)
						modUFO.play_fail(self.object)
					end
				end
			end

		end
	end
end

modUFO.doButtonForge = function(self, driver)
	self.forge.upgrade_formspec=os.time()
	local drivername = driver:get_player_name()
	if self.forge.source == nil then
		--modUFO.send_message(self, drivername, "modUFO.get_fuel(self)"..modUFO.get_fuel(self))
		--self.forge.source = minetest.create_detached_inventory_raw("frmForge")
		self.forge.source = minetest.create_detached_inventory("frmForge", {
			-- Called when a player wants to move items inside the inventory
			allow_move = function(inv, from_list, from_index, to_list, to_index, count, player) 
				local stack = inv:get_stack(from_list, from_index)
				if to_list == "src" then
					return stack:get_count()
				elseif to_list == "dst" then
					return 0
				end
			end,
			-- Called when a player wants to put items into the inventory
			allow_put = function(inv, listname, index, stack, player) 
				if listname == "src" then
					return stack:get_count()
				elseif listname == "dst" then
					return 0
				end
			end,
			-- Called when a player wants to take items out of the inventory
			allow_take = function(inv, listname, index, stack, player) 
				return stack:get_count()
			end,
			-- on_* - no return value
			-- Called after the actual action has happened, according to what was allowed.
			on_move = function(inv, from_list, from_index, to_list, to_index, count, player) 
			end,
			on_put = function(inv, listname, index, stack, player) 
				--modUFO.setSafeInventory(player:get_player_name(), inv:get_list("safe"))
				minetest.log('action',
					modUFO.translate("The Captain '%s' has placed %02d '%s' in UFO Eletric Forge!"):
					format(player:get_player_name(), stack:get_count(), stack:get_name())
				)
			end,
			on_take = function(inv, listname, index, stack, player) 
				--modUFO.setSafeInventory(player:get_player_name(), inv:get_list("safe"))
				minetest.log('action',
					modUFO.translate("The Captain '%s' has removed %02d '%s' in UFO Eletric Forge!"):
					format(player:get_player_name(), stack:get_count(), stack:get_name())
				)
			end,
		
		})
		self.forge.source:set_size("src", modUFO.forge.sizeSrc.width*modUFO.forge.sizeSrc.height)
		self.forge.source:set_size("dst", modUFO.forge.sizeDst.width*modUFO.forge.sizeDst.height)
	end
	--[[
	if self.forge.enabled and modUFO.get_fuel(self) > 0 and self.forge.temperature < 100 then
		self.forge.temperature = self.forge.temperature + 20
	elseif (not self.forge.enabled or modUFO.get_fuel(self) <= 0) and self.forge.temperature > 0 then
		self.forge.temperature = self.forge.temperature - 20
	end
	--]]
	local end_item = 0
	if self.forge.cook_time_end > 0 then
		end_item = math.floor(self.forge.cook_time_count / self.forge.cook_time_end * 100)
	end
	minetest.show_formspec(
		drivername,
		"frmForge",
		--modUFO.getFormSpecs.forge(self, driver, fuel_percent, item_percent)
		modUFO.getFormSpecs.forge(
			self, driver, 
			self.forge.temperature, 
			end_item
		)
	)
end

modUFO.doButtonLeave = function(self, driver)
	local drivername = driver:get_player_name()
	local vel = self.object:getvelocity()
	if vel~=nil and vel.x and vel.y and vel.z then --Avoid BUG
		local velAverage = math.sqrt((vel.x^2)+(vel.y^2)+(vel.z^2))
		if velAverage<=0.01 then -- 0.01 m/s = (1cm/s) = 0.01 blocks per second
			local floorPos = self.object:getpos()
			floorPos.y = floorPos.y-1
			local nodename = minetest.env:get_node(floorPos).name
			--modUFO.send_message(self, drivername, "nodename="..nodename)
			if nodename == "air" then
				minetest.show_formspec(
					drivername,
					"frmUFO",
					modUFO.getFormSpecs.confirm_eject
				)				
			else
				driver:set_detach()
				self.driver = nil
				if self.soundHandle~=nil then 
					minetest.sound_stop(self.soundHandle) 
				end
			end
		else
			modUFO.send_message(
				self,
				drivername, 
				modUFO.translate("You have to brake that UFO before you leave!")..
				core.get_color_escape_sequence("#FFFFFF").." ("..
				core.get_color_escape_sequence("#FF0000")..
				string.format("%.3f", velAverage).." m/s"..
				core.get_color_escape_sequence("#FFFFFF")..")"
			)
			modUFO.play_fail(self.object)
		end
	end --FINAL OF if vel~=nil then
end

modUFO.getFormSpecs = {
	mainmenu = function(insecure)
		local myFormSpec =
		"size[8,4.80]"
		..modUFO.getFomTheme()
		.."label[0,0;"..minetest.formspec_escape(modUFO.translate("UFO SYSTEM CONTROL")..":").."]"
		.."button[0,0.50;4,1;btnControlHelp;"..minetest.formspec_escape(modUFO.translate("UFO MANUAL")).."]"
		.."button[4,0.50;4,1;btnShowFiveTones;"..minetest.formspec_escape(modUFO.translate("FIVE TONES")).."]"
		.."button[0,1.35;4,1;btnShowMailBox;"..minetest.formspec_escape(modUFO.translate("MAILBOX")).."]"
		.."button[4,1.35;4,1;btnShowTrunk;"..minetest.formspec_escape(modUFO.translate("CARRIER TRUNK")).."]"
		.."button[0,2.15;4,1;btnShowSettings;"..minetest.formspec_escape(modUFO.translate("UFO SETTINGS")).."]"
		.."button[4,2.15;4,1;btnShowForge;"..minetest.formspec_escape(modUFO.translate("ELETRIC FORGE")).."]"
		.."button[0,3.00;4,1;btnShowNavegation;"..minetest.formspec_escape(modUFO.translate("NAVEGATION")).."]"
		.."button[4,3.00;4,1;btnShowUpgrade;"..minetest.formspec_escape(modUFO.translate("UPGRADES")).."]"
				
		if insecure then
			myFormSpec = myFormSpec.."button[1,4.05;6,1;btnLeave;"..minetest.formspec_escape(modUFO.translate("EMERGENCY EJECTION")).."]"
		else
			myFormSpec = myFormSpec.."button_exit[1,4.05;6,1;btnLeave;"..minetest.formspec_escape(modUFO.translate("LEAVE UFO")).."]"
		end
		
		return myFormSpec
	end,
	controlhelp = "size[8.5,6.50]"
		..modUFO.getFomTheme()
		.."label[0,0.00;"..minetest.formspec_escape(modUFO.translate("UFO MANUAL - CONTROLS")..":").."]"
		.."label[0,0.75;"..minetest.formspec_escape(modUFO.translate("Key W (UP) ← Accelerator")).."]"
		.."label[0,1.25;"..minetest.formspec_escape(modUFO.translate("Key S (DOWN) ← Brake")).."]"
		.."label[0,1.75;"..minetest.formspec_escape(modUFO.translate("Key A (LEFT) ← Turn Lett")).."]"
		.."label[0,2.25;"..minetest.formspec_escape(modUFO.translate("Key D (RIGHT) ← Turn Right")).."]"
		.."label[0,2.75;"..minetest.formspec_escape(modUFO.translate("Key Spacebar (JUMP) ← To lift")).."]"
		.."label[0,3.25;"..minetest.formspec_escape(modUFO.translate("Key Shift (SNAKE) ← To down")).."]"
		.."label[0,4.00;"..minetest.formspec_escape(modUFO.translate("Key S (Brake) + Run Key (R or Ctrl) ← Five Tones")).."]"
		.."label[0,4.50;"..minetest.formspec_escape(modUFO.translate("Key Shift (SNAKE) + Run Key (R or Ctrl) ← Emergency Ejection")).."]"
		.."label[0,5.00;"..minetest.formspec_escape(modUFO.translate("Key Sides (A or D) + Key Run (R or Ctrl) ← Walks to the side")).."]"

		.."button[2.25,5.75; 4.00,1"..";btnMainMenu;"..minetest.formspec_escape(modUFO.translate("MENU BACK")).."]"
		.."button[6.25,5.75; 2.00,1"..";btnControlHelp2;"..minetest.formspec_escape(modUFO.translate("NEXT")).."]"
		.."",
	controlhelp2 = "size[8.5,6.50]"
		..modUFO.getFomTheme()
		.."label[0,0.00;"..minetest.formspec_escape(modUFO.translate("UFO MANUAL - MAINTENANCE")..":").."]"
		.."label[0,0.75;"..minetest.formspec_escape(modUFO.translate(
			"Do not forget your UFO in the garage. Your UFO can be deleted \nfrom the server when admin applies maintenance procedures on \nthe server. Save your UFO as an item."
		)).."]"

		.."button[0.25,5.75; 2.00,1"..";btnControlHelp;"..minetest.formspec_escape(modUFO.translate("PREVIOUS")).."]"
		.."button[2.25,5.75; 4.00,1"..";btnMainMenu;"..minetest.formspec_escape(modUFO.translate("MENU BACK")).."]"
		.."",
	confirm_eject = 
		"size[8,3.25]"
		..modUFO.getFomTheme()
		.."label[1.5,0;"..
			minetest.formspec_escape(
				"--== "..modUFO.translate("EMERGENCY EJECTION").." ==--"
			).."]"
		.."label[0,1.0;"..minetest.formspec_escape(
			modUFO.translate(
				"The UFO recommends that you land on a flat ground."
			)
		).."]"
		.."label[0,1.5;"..minetest.formspec_escape(
			modUFO.translate(
				"Do you really want to leave the UFO on this ground?"
			)
		).."]"
		.."button_exit[2,2.5;2,1;btnEjectOk;"..minetest.formspec_escape(modUFO.translate("YES")).."]"
		.."button[4,2.5;2,1;btnEjectCancel;"..minetest.formspec_escape(modUFO.translate("NOT")).."]"
		.."",
	settings = function(self)
		local myFormSpec ="size[8,4.50]"
		..modUFO.getFomTheme()
		.."label[0,0;"..minetest.formspec_escape(modUFO.translate("UFO SETTINGS")..":").."]"
		--field[X,Y;W,H;name;label;default]
		.."field[0.25,1.5;7.75,1;txtShipName;"
			..minetest.formspec_escape(modUFO.translate("Ship Name")..":")
			..";"..minetest.formspec_escape(self.shipname)
		.."]"
		--checkbox[X,Y;name;label;selected]
		.."checkbox[0,2.0;chkTracer;"
			..minetest.formspec_escape(modUFO.translate("Enable 'UFO tracer'."))..";"
			..self.waypoint_actived
		.."]"
		.."checkbox[0,2.75;chkInertiaCancel;"
			..minetest.formspec_escape(modUFO.translate("Enable 'Inertia Cancel'.\n(Spend fuel constantly if off)"))..";"
			..self.inertia_cancel
		.."]"

		myFormSpec = myFormSpec.."button[3.0,3.75;2,1;btnSaveSettings;"..minetest.formspec_escape(modUFO.translate("OK")).."]"
		
		return myFormSpec
	end,
	forge = function(self, driver, temperature_perc, item_percent)
		local formspec = "size[8,9.0]"
			..modUFO.getFomTheme()
			.."label[0,0;"..minetest.formspec_escape(modUFO.translate("ELETRIC FORGE")..":").."]"
			.."list[detached:frmForge;src;0.75,1.0;"..modUFO.forge.sizeSrc.width..","..modUFO.forge.sizeSrc.height..";]"
			.."image[2.75,2.0;1,1;default_furnace_fire_bg.png^[lowpart:"..(temperature_perc)..":default_furnace_fire_fg.png]"
			.."image[3.75,2.0;1,1;gui_forge_arrow_bg.png^[lowpart:"..(item_percent)..":gui_forge_arrow_fg.png^[transformR270]"			
			if self.forge.enabled then
				formspec=formspec.."button[0.75,3.10;3,1;btnForgeOff;"..minetest.formspec_escape(modUFO.translate("DISABLE")).."]"
			else
				formspec=formspec.."button[0.75,3.10;3,1;btnForgeOn;"..minetest.formspec_escape(modUFO.translate("ENABLE")).."]"
			end
			formspec=formspec.."list[detached:frmForge;dst;4.75,1.46;"..modUFO.forge.sizeDst.width..","..modUFO.forge.sizeDst.height..";]"
			.."list[current_player;main;0,4.75; 8,1;]"
			..default.get_hotbar_bg(0, 4.75)
			.."list[current_player;main;0,6.00; 8,3;8]"
			.."listring[detached:frmForge;dst]"
			.."listring[current_player;main]"
			.."listring[detached:frmForge;src]"
			.."listring[current_player;main]"
		return formspec
	end,
	furnace = 
		"size[8,6.5]"
		..modUFO.getFomTheme()
		.."list[current_name;fuel;0,0.25;1,1;]"
		.."image[1.0,0.2;0.8,0.8;"..minetest.formspec_escape(modUFO.getItemImage(modUFO.fuel_type)).."]"
		.."label[1.65,0.2;"..
			minetest.formspec_escape(
				"← "..modUFO.translate("Fuel: %s"):format(modUFO.getItemName(modUFO.fuel_type))
			) .." ]"
		.."label[0  ,1.4; "..minetest.formspec_escape(modUFO.translate("1º ← You need to park your UFO next to this!")).."]"
		.."label[0  ,1.8; "..minetest.formspec_escape(modUFO.translate("2º ← Press 'run key'(Key E) in your UFO to reload!")).."]"
		.."list[current_player;main;0,2.5;8,4;]"
		.."listring[current_name;fuel]"
		.."listring[current_player;main]"
	.."",
}

modUFO.on_player_receive_fields = function(self, sender, formname, fields)
	local sendername = sender:get_player_name()
	--modUFO.send_message(self, sendername, dump(sendername)..">>"..dump(formname)..">>"..dump(fields))
	if formname == "frmUFO" then -- This is your form name
		if fields.btnMainMenu then
			minetest.show_formspec(
				sender:get_player_name(),
				"frmUFO",
				modUFO.getFormSpecs.mainmenu()
			)
		elseif fields.btnLeave then
			modUFO.doButtonLeave(self, sender)
		elseif fields.btnEjectOk then
			sender:set_detach()
			self.driver = nil
			if self.soundHandle~=nil then 
				minetest.sound_stop(self.soundHandle) 
			end
		elseif fields.btnEjectCancel then
			minetest.show_formspec(
				sender:get_player_name(true),
				"frmUFO",
				modUFO.getFormSpecs.mainmenu(true)
			)
		elseif fields.btnControlHelp then
			minetest.show_formspec(
				sender:get_player_name(),
				"frmUFO",
				modUFO.getFormSpecs.controlhelp
			)
		elseif fields.btnControlHelp2 then
			minetest.show_formspec(
				sender:get_player_name(),
				"frmUFO",
				modUFO.getFormSpecs.controlhelp2
			)
		elseif fields.btnShowFiveTones then
			modUFO.doFiveTones(self, sender)
		elseif fields.btnShowForge then
			self.forge.visibled = true
			--modUFO.doButtonForge(self, sender)
		elseif fields.btnShowMailBox then
			if self.driver then
				if minetest.get_modpath("correio") and modCorreio~=nil then
					modCorreio.openinbox(sendername)
				else
					modUFO.doButtonFail(self, sendername, "correio")
				end
			end
		elseif fields.btnShowTrunk then
			if self.driver then
				if minetest.get_modpath("minertrade") and modMinerTrade~=nil then
					local drivername = self.driver:get_player_name()
					local inv = modMinerTrade.getDetachedInventory(self.owner_name)
					minetest.show_formspec(
						drivername,
						"safe_"..self.owner_name,
						modMinerTrade.getFormspec(
							self.owner_name, 
							modUFO.translate("CARRIER TRUNK owned by '%s':"):format(self.owner_name)
						)
					)
				else
					modUFO.doButtonFail(self, sendername, "minertrade")
				end
			end
		elseif fields.btnShowSettings then
			minetest.show_formspec(
				sender:get_player_name(),
				"frmSettings",
				modUFO.getFormSpecs.settings(self)
			)
		end
	elseif formname == "frmForge" then
		if fields.btnForgeOn then
			self.forge.enabled = true
		elseif fields.btnForgeOff then
			self.forge.enabled = false
		elseif fields.quit then
			self.forge.visibled = false
		end
	elseif formname == "frmSettings" then
		--filling fields
		if fields.txtShipName then
			self.shipname = fields.txtShipName or ""
			self.waypoint_position = nil --this line exit to update the waypoint
		end
		if fields.chkTracer then
			self.waypoint_actived = fields.chkTracer
		end
		if fields.chkInertiaCancel then
			self.inertia_cancel = fields.chkInertiaCancel
		end
		if fields.btnSaveSettings	 then
			minetest.show_formspec(
				sender:get_player_name(true),
				"frmUFO",
				modUFO.getFormSpecs.mainmenu()
			)
		end
		
	end
end

modUFO.fuel_from_wear = function(wear)
	local fuel
	if wear == 0 then
		fuel = 0
	else
		fuel = (65535-(wear-1))*100/65535
	end
	return fuel
end

modUFO.wear_from_fuel = function(fuel)
	local wear = (100-(fuel))*65535/100+1
	if wear > 65535 then wear = 0 end
	return wear
end

modUFO.get_fuel = function(self)
	return self.fuel
end

modUFO.set_fuel = function(self,fuel,object)
	self.fuel = fuel
end

modUFO.ufo_to_item = function(self)
	local wear = modUFO.wear_from_fuel(modUFO.get_fuel(self))
	local itemstack = ItemStack("ufos:ship")
	itemstack:set_wear(wear)
	
	local data = {
		shipname = self.shipname or "",
		waypoint_actived = self.waypoint_actived or false,
		inertia_cancel = self.inertia_cancel or true,
	}
	itemstack:get_meta():from_table({fields = data})
	return itemstack
	
	--[[
	return {
		name="ufos:ship",
		wear=wear
	}
	--]]
end

modUFO.ufo_from_item = function(itemstack, placer, pointed_thing)
	-- set owner
	modUFO.next_owner = placer:get_player_name()
	-- restore the fuel inside the item
	local wear = itemstack:get_wear()
	modUFO.set_fuel(
		modUFO.ufo, 
		modUFO.fuel_from_wear(wear)
	)
	-- add the entity
	ship = minetest.env:add_entity(pointed_thing.above, "ufos:ship")
	ship:setyaw(placer:get_look_yaw() - math.pi / 2)

	local meta = itemstack:get_meta()
	local old_data = minetest.deserialize(itemstack:get_metadata())
	if old_data then
		meta:from_table({ fields = old_data })
	end
	local data = meta:to_table().fields
	if data then
		ship:get_luaentity().shipname = data.shipname or ""
		ship:get_luaentity().waypoint_actived = data.waypoint_actived or false
		ship:get_luaentity().inertia_cancel = data.inertia_cancel or true
	end
	
	-- remove the item
	itemstack:take_item()
	
	-- reset owner for next ufo
	modUFO.next_owner = ""
end

modUFO.check_owner = function(self, player)
	local playername = player:get_player_name()	
	if self.owner_name == "" then
		minetest.chat_send_player(playername, "This UFO was not protected, you are now its owner !")
		self.owner_name = playername
		return true
	elseif playername == self.owner_name then
		return true
	elseif minetest.get_player_privs(playername).parkingman then
		if player:get_player_control().aux1 then
			return true
		else
			modUFO.send_message(self, playername, 
				modUFO.translate("Hold 'Run Key'(R or Ctrl) and Click to control the UFO owned by '%s'!"):format(self.owner_name)
			)
			modUFO.play_fail(self.object)
			return false
		end
	end
end

modUFO.next_owner = ""


