local S = aqua_farming.S

local step = 5
local light = 8 -- minimum Light needed
local del = 8  -- all 8 Seconds a
local chan = 5 -- Chance of 1 to 5
local name = "aqua_farming:sea_anemone"
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
                                        {items = {name .. "_item 2"}},
                                        {items = {name .. "_seed 2"}},
                                        {items = {name .. "_item 3", rarity = 8}},
                                        {items = {name .. "_seed 3", rarity = 10}},

                                }, -- items

                        }, -- drop

            } -- def

minetest.register_craftitem(name .. "_item", {
        description = desc .. " " .. S("(raw)"),
        groups = {food = 1, food_vegan = 1, seafood = 1},
        inventory_image = "aqua_farming_" .. name:split(":")[2] .. "_item.png",
        on_use = minetest.item_eat(5),
})

aqua_farming.register_plant(def)

dofile(aqua_farming.modpath .. "/mapgen_" .. name:split(":")[2] .. ".lua")

if(signs_bot) then
    local fs = signs_bot.register_farming_seed
    local fc = signs_bot.register_farming_crop

    fs(name .. "_seed", name .. "_1")
	fc(name .. "_" .. step, name .. "_item", name .. "_seed")

end

aqua_farming.report(" module " .. name .. ".lua loaded.")
