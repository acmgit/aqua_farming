local S = aqua_farming.S

local step = 6
local light = 10
local del = 10
local chan = 10

local def
def = {
        sand =          {
                            basenode = "default:sand",
                            nodename = "alga",
                            description = S("Green Alga"),
                            steps = step,
                            min_light = light,
                            drop = {items = {
                                            {items = {"aqua_farming:alga_item"}}
                                    },
                            },
                            delay = del,
                            chance = chan,
                        }, -- sand

        desert_sand =   {
                            basenode = "default:desert_sand",
                            nodename = "alga",
                            description = S("Green Alga"),
                            steps = step,
                            min_light = light,
                            drop = {items = {
                                            {items = {"aqua_farming:alga_item"}}
                                    },
                            },
                            delay = del,
                            chance = chan,
                        }, -- desert_sand

        silver_sand =   {
                            basenode = "default:silver_sand",
                            nodename = "alga",
                            description = S("Green Alga"),
                            steps = step,
                            min_light = light,
                            drop = {items = {
                                            {items = {"aqua_farming:alga_item"}}
                                    },
                            },
                            delay = del,
                            chance = chan,
                        }, -- silver_sand

        dirt =          {
                            basenode = "default:dirt",
                            nodename = "alga",
                            description = S("Green Alga"),
                            steps = step,
                            min_light = light,
                            drop = {items = {
                                            {items = {"aqua_farming:alga_item"}}
                                    },
                            },
                            delay = del,
                            chance = chan,
                        }, -- dirt
    }

local basename

for _,value in pairs(def) do
    aqua_farming.register_plant(value)

    basename = aqua_farming.get_nodename(value.basenode)

    minetest.register_craft({
        output = "aqua_farming:" .. basename .. "_with_" .. value.nodename,
        recipe = {
                      {value.basenode, "aqua_farming:" .. value.nodename .. "_item"},
                },
    })

end

minetest.register_craftitem("aqua_farming:alga_item", {
        description = S("Green Alga"),
        groups = {food = 1, food_vegan = 1},
        inventory_image = "aqua_farming_alga_item.png",
        on_use = minetest.item_eat(1),
})

dofile(aqua_farming.modpath .. "/mapgen_alga.lua")

aqua_farming.report(" module alga.lua loaded.")
