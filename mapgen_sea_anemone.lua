-- Sea Anemone

local step = 5
local name = "sea_anemone"

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:sand"},
    place_offset_y = -1,
    sidelen = 16,
    noise_params = {
        offset = -0.04,
        scale = 0.3,
        spread = {x = 70, y = 70, z = 70},
        seed = 87112,
        octaves = 3,
        persist = 0.5
    },
    biomes = {
        "taiga_ocean",
        "tundra_ocean",
        "snowy_grassland_ocean",
        "coniferous_forest_ocean",
        "cold_desert_ocean",
        "icesheet_ocean",
        },
    y_max = -5,
    y_min = -10,
    flags = "force_placement",
    decoration = "aqua_farming:sand_with_".. name .. "_" .. step,
    param2 = 48,
    param2_max = 96,
})

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:silver_sand"},
    place_offset_y = -1,
    sidelen = 16,
    noise_params = {
        offset = -0.04,
        scale = 0.3,
        spread = {x = 70, y = 70, z = 70},
        seed = 87112,
        octaves = 3,
        persist = 0.5
    },
    biomes = {
        "taiga_ocean",
        "tundra_ocean",
        "snowy_grassland_ocean",
        "coniferous_forest_ocean",
        "cold_desert_ocean",
        "icesheet_ocean",
        },
    y_max = -5,
    y_min = -10,
    flags = "force_placement",
    decoration = "aqua_farming:silver_sand_".. name .. "_" .. step,
    param2 = 48,
    param2_max = 96,
})

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:gravel"},
    place_offset_y = -1,
    sidelen = 16,
    noise_params = {
        offset = -0.04,
        scale = 0.3,
        spread = {x = 70, y = 70, z = 70},
        seed = 87112,
        octaves = 3,
        persist = 0.5
    },
    biomes = {
        "taiga_ocean",
        "tundra_ocean",
        "snowy_grassland_ocean",
        "coniferous_forest_ocean",
        "cold_desert_ocean",
        "icesheet_ocean",
        },
    y_max = -5,
    y_min = -10,
    flags = "force_placement",
    decoration = "aqua_farming:gravel_".. name .. "_" .. step,
    param2 = 48,
    param2_max = 96,
})

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:desert_sand"},
    place_offset_y = -1,
    sidelen = 16,
    noise_params = {
        offset = -0.04,
        scale = 0.3,
        spread = {x = 70, y = 70, z = 70},
        seed = 87112,
        octaves = 3,
        persist = 0.5
    },
    biomes = {
        "taiga_ocean",
        "tundra_ocean",
        "snowy_grassland_ocean",
        "coniferous_forest_ocean",
        "cold_desert_ocean",
        "icesheet_ocean",
        },
    y_max = -5,
    y_min = -10,
    flags = "force_placement",
    decoration = "aqua_farming:desert_sand_".. name .. "_" .. step,
    param2 = 48,
    param2_max = 96,
})
