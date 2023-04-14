local S = aqua_farming.S

local step = 5
local light = 4
local del = 10
local chan = 15
local name = "aqua_farming:sponge"
local desc = S("Sponge")

local def = {
                basenode = "default:dirt",
                nodename = name,
                description = desc,
                steps = step,
                min_light = light,
                delay = del,
                chance = chan,
                drop = {items = {
                                    {items = {name .. "_seed 2"}},
                                    {items = {name .. " 4"}},
                                    {items = {name .. "_seed 3", rarity = 15}},
                                },
                        },
            } -- def

minetest.register_node(name, {
	description = desc,
	drawtype = "nodebox",
	inventory_image = "aqua_farming_sponge_inventory_item.png",
	wield_image = "aqua_farming_sponge_inventory_item.png",
	paramtype = "light",
	paramtype2 = "facedir",
	is_ground_content = false,
	walkable = false,
	--on_use = minetest.item_eat(2, "vessels:glass_bottle"),
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, -0.375, 0.4375, -0.4375, 0.3125}, -- NodeBox1
			{-0.3125, -0.4375, -0.3125, 0.375, -0.125, 0.25}, -- NodeBox2
			{-0.375, -0.125, -0.375, 0.5, 0, 0.3125}, -- NodeBox4
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {-0.5, -0.5, -0.5, 0.5, 0.1, 0.5}
	},
	groups = {dig_immediate=1, oddly_breakable_by_hand=3},
	tiles = {
		"aqua_farming_sponge.png",
		"aqua_farming_sponge.png",
		"aqua_farming_sponge.png",
		"aqua_farming_sponge.png",
		"aqua_farming_sponge.png",
		"aqua_farming_sponge.png"
	},
	sounds = default.node_sound_leaves_defaults(),
})

aqua_farming.register_plant(def)
dofile(aqua_farming.modpath .. "/mapgen_" .. name:split(":")[2] .. ".lua")

if(minetest.get_modpath("signs_bot")) then

    local fs = signs_bot.register_farming_plant
    --local ts = signs_bot.register_tree_saplings

    --local fs = signs_bot.register_farming_seed
    --local fc = signs_bot.register_farming_crop

    fs(name .. "_seed", name .. "_1", name .. "_" .. step)
	--fc(name .. "_" .. step, name .. "_item", name .. "_seed")

end

--[[
if(signs_bot) then
    local fs = signs_bot.register_farming_seed
    local fc = signs_bot.register_farming_crop

    fs(name .. "_seed", name .. "_1")
	fc(name .. "_" .. step, name .. "_item", name .. "_seed")

end
]]--

dofile(aqua_farming.modpath .. "/sea_strawberry_recipes.lua")

aqua_farming.report(" module " .. name .. ".lua loaded.")
