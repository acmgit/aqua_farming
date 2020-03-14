local S = aqua_farming.S

local step = 8
local light = 8
local del = 10
local chan = 15

local def
def = {
        dirt =          {
                            basenode = "default:dirt",
                            nodename = "sea_strawberry",
                            description = S("Sea Strawberry"),
                            steps = step,
                            min_light = light,
                            drop = {items = {
                                                {items = {"aqua_farming:sea_strawberry_stem"}},
                                                {items = {"aqua_farming:sea_strawberry_item 4"}},
                                    },
                            },
                            delay = del,
                            chance = chan,
                        }, -- dirt
        dry_dirt =      {
                            basenode = "default:dry_dirt",
                            nodename = "sea_strawberry",
                            description = S("Sea Strawberry"),
                            steps = step,
                            min_light = light,
                            drop = {items = {
                                                {items = {"aqua_farming:sea_strawberry_stem"}},
                                                {items = {"aqua_farming:sea_strawberry_item 4"}},
                                    },
                            },
                            delay = del,
                            chance = chan,
                        }, -- sand

    }

local basename

for _,value in pairs(def) do
    aqua_farming.register_plant(value)

    basename = aqua_farming.get_nodename(value.basenode)

    minetest.register_craft({
        output = "aqua_farming:" .. basename .. "_with_" .. value.nodename,
        recipe = {
                      {value.basenode, "aqua_farming:sea_strawberry_stem"},
                },
    })

end



minetest.register_craftitem("aqua_farming:sea_strawberry_item", {
        description = S("Sea Strawberry"),
        groups = {food = 1, food_vegan = 1},
        inventory_image = "aqua_farming_sea_strawberry_item.png",
        on_use = minetest.item_eat(3),
})

minetest.register_craftitem("aqua_farming:sea_strawberry_stem", {
        description = S("Sea Strawberry Stem"),
        groups = {food = 1, food_vegan = 1},
        inventory_image = "aqua_farming_sea_strawberry_stem.png",
})

dofile(aqua_farming.modpath .. "/mapgen_sea_strawberry.lua")

aqua_farming.report(" module sea_strawberry.lua loaded.")
