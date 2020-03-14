local S = aqua_farming.S

local step = 8
local light = 8
local del = 10
local chan = 15
local name = "sea_strawberry"
local desc = S("Sea Strawberry")

local def
def = {
        dirt =          {
                            basenode = "default:dirt",
                            nodename = name,
                            description = desc,
                            steps = step,
                            min_light = light,
                            drop = {items = {
                                                {items = {"aqua_farming:" .. name .. "_stem"}},
                                                {items = {"aqua_farming:" .. name .. "_item 4"}},
                                    },
                            },
                            delay = del,
                            chance = chan,
                        }, -- dirt
        dry_dirt =      {
                            basenode = "default:dry_dirt",
                            nodename = name,
                            description = desc,
                            steps = step,
                            min_light = light,
                            drop = {items = {
                                                {items = {"aqua_farming:" .. name .. "_stem"}},
                                                {items = {"aqua_farming:" .. name .. "_item 4"}},
                                    },
                            },
                            delay = del,
                            chance = chan,
                        }, -- dry_dirt

    }

local basename

for _,value in pairs(def) do
    aqua_farming.register_plant(value)

    basename = aqua_farming.get_nodename(value.basenode)

    minetest.register_craft({
        output = "aqua_farming:" .. basename .. "_with_" .. value.nodename,
        recipe = {
                      {value.basenode, "aqua_farming:" .. name .. "_stem"},
                },
    })

end



minetest.register_craftitem("aqua_farming:" .. name .. "_item", {
        description = desc,
        groups = {food = 1, food_vegan = 1},
        inventory_image = "aqua_farming_" .. name .. "_item.png",
        on_use = minetest.item_eat(3),
})

minetest.register_craftitem("aqua_farming:" .. name .. "_stem", {
        description = desc .. S(" Stem"),
        groups = {food = 1, food_vegan = 1},
        inventory_image = "aqua_farming_" .. name .. "_stem.png",
})

dofile(aqua_farming.modpath .. "/mapgen_" .. name .. ".lua")

aqua_farming.report(" module " .. name .. ".lua loaded.")
