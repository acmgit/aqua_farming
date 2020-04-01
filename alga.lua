local S = aqua_farming.S

local step = 6
local light = 10
local del = 10
local chan = 10
local name = "aqua_farming:alga"
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
                                        {items = {name .. "_item 1"}},
                                        {items = {name .. "_seed 2"}},
                                        {items = {name .. "_item 2", rarity = 10}},

                                },-- items
                        }, -- drop

            } -- def

aqua_farming.register_plant(def)

minetest.register_craftitem(name .. "_item", {
        description = desc,
        groups = {food = 1, food_vegan = 1, seafood = 1},
        inventory_image = "aqua_farming_" .. name:split(":")[2] .. "_item.png",
        on_use = minetest.item_eat(1),
})

dofile(aqua_farming.modpath .. "/mapgen_" .. name:split(":")[2] .. ".lua")

if(signs_bot) then
    local fs = signs_bot.register_farming_seed
    local fc = signs_bot.register_farming_crop

    fs(name .. "_seed", name .. "_1")
	fc(name .. "_" .. step, name .. "_item", name .. "_seed")

end


aqua_farming.report(" module " .. name .. ".lua loaded.")
