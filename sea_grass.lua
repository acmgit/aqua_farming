local S = aqua_farming.S

local step = 5
local light = 4
local del = 6
local chan = 10
local name = "aqua_farming:sea_grass"
local desc = S("Sea Grass")

local def = {
                basenode = "default:sand",
                nodename = name,
                description = desc,
                steps = step,
                min_light = light,
                delay = del,
                chance = chan,
                drop = {items = {
                                        {items = {name .. "_item 1"}},
                                        {items = {name .. "_seed 2"}},
                                        {items = {name .. "_seed 3", rarity = 10}},
                                 }, -- items
                        }, -- drop

            } -- def


aqua_farming.register_plant(def)

minetest.register_craftitem(name .. "_item", {
        description = desc,
        groups = {food = 1, food_vegan = 1, seafood = 1},
        inventory_image = "aqua_farming_" .. name:split(":")[2] .. "_item.png",
})

dofile(aqua_farming.modpath .. "/mapgen_" .. name:split(":")[2] .. ".lua")

aqua_farming.report(" module " .. name .. ".lua loaded.")
