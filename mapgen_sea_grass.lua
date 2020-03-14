-- Sea Grass

minetest.register_decoration({
    deco_type = "simple",
    place_on = {"default:sand", "default:silver_sand", "default:desert_sand", "default:dirt"},
    place_offset_y = -1,
    sidelen = 16,
    noise_params = {
        offset = -0.04,
        scale = 0.1,
        spread = {x = 200, y = 200, z = 200},
        seed = 87112,
        octaves = 3,
        persist = 0.7
    },
    biomes = {
        "taiga_ocean",
        "snowy_grassland_ocean",
        "grassland_ocean",
        "coniferous_forest_ocean",
        "deciduous_forest_ocean",
        "sandstone_desert_ocean",
        "cold_desert_ocean"},
    y_max = -5,
    y_min = -10,
    flags = "force_placement",
    decoration = "aqua_farming:sea_grass_5",
    param2 = 48,
    param2_max = 96,
})
