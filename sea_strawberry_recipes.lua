local S = aqua_farming.S
local name = "aqua_farming:sea_strawberry"
local desc = S("Sea Strawberry")

minetest.register_craftitem(name .. "_cake", {
        description = desc .. " " .. S("Cake"),
        groups = {food = 1, food_vegan = 1, food_sweet = 1},
        inventory_image = "aqua_farming_" .. name:split(":")[2] .. "_cake.png",
})

minetest.register_craftitem(name .. "_cake_piece", {
        description = desc .. " " .. S("Cake") .. " " .. S("Piece"),
        groups = {food = 1, food_vegan = 1, food_sweet = 1},
        inventory_image = "aqua_farming_" .. name:split(":")[2] .. "_cake_piece.png",
        on_use = minetest.item_eat(3)
})

minetest.register_craft({
                            output = name .. "_cake",
                            recipe = {
                                        {name .. "_item", name .. "_item", name .. "_item"},
                                        {"group:food_flour", "dye:pink", "group:food_flour"},
                                        {"",  "bucket:bucket_water", ""},
                                      },
                            replacements = {
                                            {"bucket:bucket_water", "bucket:bucket_empty"},
                                            },
                         })

minetest.register_craft({
                            output = name .. "_cake",
                            recipe = {
                                        {name .. "_item", name .. "_item", name .. "_item"},
                                        {"group:food_flour", "dye:pink", "group:food_flour"},
                                        {"",  "bucket:bucket_river_water", ""},
                                      },
                            replacements = {
                                            {"bucket:bucket_river_water", "bucket:bucket_empty"},
                                            },
                         })

minetest.register_craft({
                            output = name .. "_cake_piece 8",
                            recipe = {
                                        {name .. "_cake"},
                                      },
                         })
