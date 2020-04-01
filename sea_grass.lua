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

minetest.register_craftitem(name .. "_roasted_item", {
        description = desc .. " (" .. S("dry") .. ")",
        groups = {food = 1, food_vegan = 1},
        inventory_image = "aqua_farming_" .. name:split(":")[2] .. "_roasted_item.png",
})

minetest.register_craftitem("aqua_farming:salt", {
        description = S("Sea Salt"),
        groups = {food = 1, food_vegan = 1, food_salt = 1},
        inventory_image = "aqua_farming_salt.png",
})

minetest.register_craft({
	type = "cooking",
	cooktime = 10,
	output = name .. "_roasted_item",
	recipe = name .. "_item",
})

minetest.register_craft({
    type = "shapeless",
    output = "aqua_farming:salt",
    recipe = {name .. "_roasted_item"},
    replacements = {{name .. "_roasted_item", "dye:dark_green"}}
})

dofile(aqua_farming.modpath .. "/mapgen_" .. name:split(":")[2] .. ".lua")

if(signs_bot) then
    local fs = signs_bot.register_farming_seed
    local fc = signs_bot.register_farming_crop

    fs(name .. "_seed", name .. "_1")
	fc(name .. "_" .. step, name .. "_item", name .. "_seed")

end

aqua_farming.report(" module " .. name .. ".lua loaded.")
