local S = aqua_farming.S

local step = 6
local light = 10
local del = 10
local chan = 10
local name = "alga"
local desc = S("Green Alga")

local def = {
                basenode = "default:sand",
                nodename = name,
                description = desc,
                steps = step,
                min_light = light,
                delay = del,
                chance = chan,
                drop = {items = {
                                    {
                                        items = {"aqua_farming:" .. name .. "_item 1"},
                                        items = {"aqua_farming:" .. name .. "_seed 2"},
                                    },

                                }, -- items

                        }, -- drop

            } -- def

aqua_farming.register_plant(def)

minetest.register_craftitem("aqua_farming:" .. name .. "_item", {
        description = desc,
        groups = {food = 1, food_vegan = 1},
        inventory_image = "aqua_farming_" .. name .. "_item.png",
        on_use = minetest.item_eat(1),
})

dofile(aqua_farming.modpath .. "/mapgen_" .. name .. ".lua")

aqua_farming.report(" module " .. name .. ".lua loaded.")
