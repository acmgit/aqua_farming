-- Sponge

local name = "aqua_farming:sponge"
local ymax = -10
local ymin = -60

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
        "rainforest_ocean",
        "sandstone_desert_ocean",
        "savanna_ocean",
        "desert_ocean",
        },
    y_max = ymax,
    y_min = ymin,
    flags = "force_placement",
    decoration = name .. "_wild",
    param2 = 48,
    param2_max = 96,
})

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:stone"},
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
        "rainforest_ocean",
        "savanna_ocean",
        "desert_ocean",
        },
    y_max = ymax,
    y_min = ymin,
    flags = "force_placement",
    decoration = name .. "_wild",
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
        "sandstone_desert_ocean",
        },
    y_max = ymax,
    y_min = ymin,
    flags = "force_placement",
    decoration = name .. "_wild",
    param2 = 48,
    param2_max = 96,
})

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:coral_brown"},
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
        "rainforest_ocean",
        "sandstone_desert_ocean",
        "savanna_ocean",
        "desert_ocean",
        },
    y_max = ymax,
    y_min = ymin,
    flags = "force_placement",
    decoration = name .. "_wild",
    param2 = 48,
    param2_max = 96,
})

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:coral_orange"},
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
        "rainforest_ocean",
        "sandstone_desert_ocean",
        "savanna_ocean",
        "desert_ocean",
        },
    y_max = ymax,
    y_min = ymin,
    flags = "force_placement",
    decoration = name .. "_wild",
    param2 = 48,
    param2_max = 96,
})

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:coral_skeleton"},
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
        "rainforest_ocean",
        "sandstone_desert_ocean",
        "savanna_ocean",
        "desert_ocean",
        },
    y_max = ymax,
    y_min = ymin,
    flags = "force_placement",
    decoration = name .. "_wild",
    param2 = 48,
    param2_max = 96,
})

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:desert_stone"},
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
        "sandstone_desert_ocean",
        },
    y_max = ymax,
    y_min = ymin,
    flags = "force_placement",
    decoration = name .. "_wild",
    param2 = 48,
    param2_max = 96,
})
