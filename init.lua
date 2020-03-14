--[[
	**********************************************
	***             Aqua farming               ***
    ***                                        ***
    ***  Aqua farming is a Mod for Minetest    ***
    ***  and provides underwater growing       ***
    ***  plants.                               ***
    ***                                        ***
    ***  License: GPL 3.0 by A.C.M.            ***
    ***                                        ***
	**********************************************
]]--


aqua_farming = {}

aqua_farming.ver = 1
aqua_farming.rev = 0

aqua_farming.modpath = minetest.get_modpath(minetest.get_current_modname())
aqua_farming.modname = minetest.get_current_modname()

local S

if(minetest.get_translator) then
   S = minetest.get_translator(aqua_farming.modname)

else
    S = function ( s ) return s end

end

aqua_farming.S = S


dofile(aqua_farming.modpath .. "/lib.lua")
dofile(aqua_farming.modpath .. "/alga.lua")
dofile(aqua_farming.modpath .. "/sea_strawberry.lua")
dofile(aqua_farming.modpath .. "/sea_grass.lua")
dofile(aqua_farming.modpath .. "/sea_anemone.lua")

aqua_farming.report(" successfully loaded.")
