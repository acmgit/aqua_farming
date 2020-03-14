local S = aqua_farming.S

local def
def = {
        sand =          {
                            basenode = "default:sand",
                            nodename = "alga",
                            description = S("Green Alga"),
                            steps = 6,
                            min_light = 12,
                            drop = {items = {
                                            {items = {"aqua_farming:alga_item"}}
                                    },
                            },
                            delay = 10,
                            chance = 10,
                        }, -- sand

        desert_sand =   {
                            basenode = "default:desert_sand",
                            nodename = "alga",
                            description = S("Green Alga"),
                            steps = 6,
                            min_light = 12,
                            drop = {items = {
                                            {items = {"aqua_farming:alga_item"}}
                                        },
                                    },
                            delay = 10,
                            chance = 10,
                        }, -- desert_sand

        silver_sand =   {
                            basenode = "default:silver_sand",
                            nodename = "alga",
                            description = S("Green Alga"),
                            steps = 6,
                            min_light = 12,
                            drop = {items = {
                                            {items = {"aqua_farming:alga_item"}}
                                        },
                                    },
                            delay = 10,
                            chance = 10,
                        }, -- silver_sand

        dirt =          {
                            basenode = "default:dirt",
                            nodename = "alga",
                            description = S("Green Alga"),
                            steps = 6,
                            min_light = 12,
                            drop = {items = {
                                            {items = {"aqua_farming:alga_item"}}
                                    },
                            },
                            delay = 10,
                            chance = 10,
                        }, -- dirt
    }

for _,value in pairs(def) do
    aqua_farming.register_plant(value)

end

minetest.register_craftitem("aqua_farming:alga_item", {
        description = S("Green Alga"),
        groups = {food = 1, food_vegan = 1},
        inventory_image = "aqua_farming_alga_item.png",
        on_use = minetest.item_eat(1),
})

dofile(aqua_farming.modpath .. "/mapgen_alga.lua")

aqua_farming.report(" module alga.lua loaded.")
