local S = aqua_farming.S

local step = 5
local light = 8 -- minimum Light needed
local del = 8  -- all 8 Seconds a
local chan = 5 -- Chance of 1 to 5
local name = "sea_anemone"
local desc = S("Sea Anemone")

local def = {
                basenode = "default:gravel",
                nodename = name,
                description = desc,
                steps = step,
                min_light = light,
                delay = del,
                chance = chan,
                drop = {items = {
                                    {
                                        items = {"aqua_farming:" .. name .. "_item 2"},
                                        items = {"aqua_farming:" .. name .. "_seed 2"},
                                        items = {"aqua_farming:" .. name .. "_item 3", rarity = 8},
                                        items = {"aqua_farming:" .. name .. "_seed 3", rarity = 10},
                                    },

                                }, -- items

                        }, -- drop

            } -- def

aqua_farming.register_plant(def)

minetest.register_craftitem("aqua_farming:" .. name .. "_item", {
        description = desc,
        groups = {food = 1, food_vegan = 1},
        inventory_image = "aqua_farming_" .. name .. "_item.png",
        on_use = minetest.item_eat(5),
})

dofile(aqua_farming.modpath .. "/mapgen_" .. name .. ".lua")

aqua_farming.report(" module " .. name .. ".lua loaded.")
