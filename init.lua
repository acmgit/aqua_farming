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
aqua_farming.rev = 1

aqua_farming.modpath = minetest.get_modpath(minetest.get_current_modname())
aqua_farming.modname = minetest.get_current_modname()

local S

if(minetest.get_translator) then
   S = minetest.get_translator(aqua_farming.modname)

else
    S = function ( s ) return s end

end

aqua_farming.S = S

minetest.register_node("aqua_farming:water_soil", {
	description = S("Water Soil"),
	tiles = {minetest.registered_nodes["default:silver_sand"].tiles[1] .. "^aqua_farming_water_soil.png",
             minetest.registered_nodes["default:silver_sand"].tiles[1]},
    drop = "default:silver_sand",
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
})

minetest.register_craft({
                            output = "aqua_farming:water_soil 2",
                            recipe = {
                                        {"default:gravel", "group:seafood", "group:sand"}
                                     },
                         })

aqua_farming.plants = {
                    "alga",
                    "sea_strawberry",
                    "sea_grass",
                    "sea_anemone",
                    "sea_cucumber",
                }

dofile(aqua_farming.modpath .. "/lib.lua")

for _,name in pairs(aqua_farming.plants) do
    dofile(aqua_farming.modpath .. "/" .. name .. ".lua")

end

--[[
dofile(aqua_farming.modpath .. "/sea_strawberry.lua")
dofile(aqua_farming.modpath .. "/sea_grass.lua")
dofile(aqua_farming.modpath .. "/sea_anemone.lua")
]]--

dofile(aqua_farming.modpath .. "/support_mods.lua")

aqua_farming.report(" successfully loaded.")
