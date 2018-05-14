local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

dofile(minetest.get_modpath(modname).."/config.lua")
dofile(minetest.get_modpath(modname).."/intllib.lua")
dofile(minetest.get_modpath(modname).."/api.lua")
dofile(minetest.get_modpath(modname).."/ship.lua")
dofile(minetest.get_modpath(modname).."/furnace.lua")
dofile(minetest.get_modpath(modname).."/components_items.lua")
dofile(minetest.get_modpath(modname).."/components_crafts.lua")

minetest.log('action',"["..modname:upper().."] Loaded!")
