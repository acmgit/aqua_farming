-- Sea Strawberry

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:dirt"},
    place_offset_y = -1,
    sidelen = 4,
    noise_params = {
        offset = -4,
        scale = 4,
        spread = {x = 50, y = 50, z = 50},
        seed = 7013,
        octaves = 3,
        persist = 0.7,
    },
    biomes = {
        "savanna_ocean",
        "rainforest_ocean",
        "grassland_ocean",
    },
    y_max = -2,
    y_min = -8,
    flags = "force_placement",
        decoration = {"aqua_farming:dirt_with_sea_strawberry_8"},
})

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:dry_dirt"},
    place_offset_y = -1,
    sidelen = 4,
    noise_params = {
        offset = -4,
        scale = 4,
        spread = {x = 50, y = 50, z = 50},
        seed = 7013,
        octaves = 3,
        persist = 0.7,
    },
    biomes = {
        "savanna_ocean",
        "rainforest_ocean",
        "grassland_ocean",
    },
    y_max = -2,
    y_min = -8,
    flags = "force_placement",
    decoration = {"aqua_farming:dirt_with_sea_strawberry_8"},
})

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:sand"},
    place_offset_y = -1,
    sidelen = 4,
    noise_params = {
        offset = -4,
        scale = 4,
        spread = {x = 50, y = 50, z = 50},
        seed = 7013,
            octaves = 3,
            persist = 0.7,
        },
    biomes = {
        "savanna_ocean",
        "rainforest_ocean",
        "grassland_ocean",
    },
    y_max = -2,
    y_min = -8,
    flags = "force_placement",
        decoration = {"aqua_farming:dirt_with_sea_strawberry_8"},
})
