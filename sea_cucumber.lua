local S = aqua_farming.S

local step = 8
local light = 6
local del = 9
local chan = 10
local name = "aqua_farming:sea_cucumber"
local desc = S("Sea Cucumber")

local def = {
                basenode = "default:sand",
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
        groups = {food = 1, food_vegan = 1, seafood = 1, food_cucumber = 1},
        inventory_image = "aqua_farming_" .. name:split(":")[2] .. "_item.png",
        on_use = minetest.item_eat(4),
})

dofile(aqua_farming.modpath .. "/mapgen_" .. name:split(":")[2] .. ".lua")

if(signs_bot) then
    local fs = signs_bot.register_farming_seed
    local fc = signs_bot.register_farming_crop

    fs(name .. "_seed", name .. "_1")
	fc(name .. "_" .. step, name .. "_item", name .. "_seed")

end

aqua_farming.report(" module " .. name .. ".lua loaded.")
