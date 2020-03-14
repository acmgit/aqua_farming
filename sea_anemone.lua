local S = aqua_farming.S

local step = 5
local light = 8
local del = 8
local chan = 5
local name = "sea_anemone"
local desc = S("Sea Anemone")

local def
def = {
        sand =          {
                            basenode = "default:sand",
                            nodename = name,
                            description = desc,
                            steps = step,
                            min_light = light,
                            drop = {items = {
                                            {items = {"aqua_farming:" .. name .. "_item"}}
                                    },
                            },
                            delay = del,
                            chance = chan,
                        }, -- sand

        desert_sand =   {
                            basenode = "default:desert_sand",
                            nodename = name,
                            description = desc,
                            steps = step,
                            min_light = light,
                            drop = {items = {
                                            {items = {"aqua_farming:" .. name .. "_item"}}
                                    },
                            },
                            delay = del,
                            chance = chan,
                        }, -- desert_sand

        silver_sand =   {
                            basenode = "default:silver_sand",
                            nodename = name,
                            description = desc,
                            steps = step,
                            min_light = light,
                            drop = {items = {
                                            {items = {"aqua_farming:" .. name .. "_item"}}
                                    },
                            },
                            delay = del,
                            chance = chan,
                        }, -- silver_sand

        gravel =   {
                            basenode = "default:gravel",
                            nodename = name,
                            description = desc,
                            steps = step,
                            min_light = light,
                            drop = {items = {
                                            {items = {"aqua_farming:" .. name .. "_item"}}
                                    },
                            },
                            delay = del,
                            chance = chan,
                        }, -- gravel

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

minetest.register_craftitem("aqua_farming:" .. name .. "_item", {
        description = desc,
        groups = {food = 1, food_vegan = 1},
        inventory_image = "aqua_farming_" .. name .. "_item.png",
        on_use = minetest.item_eat(5),
})

dofile(aqua_farming.modpath .. "/mapgen_" .. name .. ".lua")

aqua_farming.report(" module " .. name .. ".lua loaded.")
