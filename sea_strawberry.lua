local S = aqua_farming.S

local step = 8
local light = 8
local del = 10
local chan = 15
local name = "aqua_farming:sea_strawberry"
local desc = S("Sea Strawberry")

local def = {
                basenode = "default:dirt",
                nodename = name,
                description = desc,
                steps = step,
                min_light = light,
                delay = del,
                chance = chan,
                drop = {items = {
                                    {items = {name .. "_seed 2"}},
                                    {items = {name .. "_item 4"}},
                                    {items = {name .. "_seed 3", rarity = 15}},
                                },
                        },
            } -- def

aqua_farming.register_plant(def)

minetest.register_craftitem(name .. "_item", {
        description = desc,
        groups = {food = 1, food_vegan = 1, seafood = 1, food_strawberry = 1},
        inventory_image = "aqua_farming_" .. name:split(":")[2] .. "_item.png",
        on_use = minetest.item_eat(3),
})

dofile(aqua_farming.modpath .. "/mapgen_" .. name:split(":")[2] .. ".lua")

if(signs_bot) then
    local fs = signs_bot.register_farming_seed
    local fc = signs_bot.register_farming_crop

    fs(name .. "_seed", name .. "_1")
	fc(name .. "_" .. step, name .. "_item", name .. "_seed")

end

dofile(aqua_farming.modpath .. "/sea_strawberry_recipes.lua")

aqua_farming.report(" module " .. name .. ".lua loaded.")
