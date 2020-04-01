local S = aqua_farming.S

function aqua_farming.check_water(pos)
    local checkpos = pos
    local above = minetest.get_node_or_nil({x = checkpos.x, y = checkpos.y + 2, z = checkpos.z})

        if (above ~= nil and (above.name == "default:water_source" or above.name == "default:river_water_source")) then
            return true
        end -- if(above

        return false

end -- aqua_farming.check_water(

function aqua_farming.check_light(pos)
    local checkpos = pos
    local above = {x = checkpos.x, y = checkpos.y + 1, z = checkpos.z}
    local meta = minetest.get_meta(checkpos)
    local lightlevel = meta:get_int("lightlevel")
    local light

    if(minetest.get_node_or_nil(above) ~= nil) then
        light = minetest.get_node_light(above)
        if(light >= lightlevel) then return true end

    end -- if(minetest.get_node_or_nil(

    return false

end -- function aqua_farming.check_light

function aqua_farming.register_abm(nodename, newnodename, delay, percent)

    if(minetest.registered_nodes[nodename] ~= nil or minetest.registered_nodes[newnodename] ~= nil) then

        if(delay == nil) then
            delay = 1

        end -- if(delay

        if(percent == nil) then
            percent = 1

        end -- if(percent

        minetest.register_abm({
            nodenames = {nodename},
            neighbors = {"default:water_source", "default:river_water_source"},
            interval = delay, -- Run every 5 seconds
            chance = percent, -- Select every 1 in 50 nodes
            action = function(pos, node, active_object_count, active_object_count_wider)
                local nodepos = pos
                if(aqua_farming.check_water(nodepos)) then
                    if(aqua_farming.check_light(nodepos)) then
                        minetest.swap_node(nodepos, {name = newnodename})

                    end -- if(aqua_farming.check_light

                end -- if(aqua_farming.check_water

            end, -- function(

        }) -- minetest.register_abm({

    end -- if(nodename ~= nil

end -- function aqua_farming.register_abm

function aqua_farming.plant_seed(node_def, pointed_thing)
    if(pointed_thing.type == "node") then
        local node = minetest.get_node(minetest.get_pointed_thing_position(pointed_thing, false)) -- pointed_thing.under
        if(node.name == "aqua_farming:water_soil") then
            minetest.set_node(pointed_thing.under, {name = node_def.nodename .. "_seed"})
            return true
        end -- if(node.name

        return false

    end -- if(pointed_thing.type

end

function aqua_farming.register_plant(node_def)

    local modname = node_def.nodename:split(":")[1]
    local nodename = node_def.nodename:split(":")[2]
    if(node_def.steps <= 0 or node_def.steps == nil) then
        aqua_farming.report("Node: " .. modname .. ":" .. node_def.nodename .. " has no steps.")
        return
    end -- if(steps

    local min_light = node_def.min_light

    if(node_def.min_light <= 0) then
        min_light = 0

    end -- if(min_light < 0

    if(min_light >= default.LIGHT_MAX) then
        min_light = default.LIGHT_MAX - 1

    end -- if(min_light > light_max

    minetest.register_node(":" .. modname .. ":" .. nodename .. "_seed", {
        description = node_def.description .. " " .. S("Seeds"),
        tiles = minetest.registered_nodes["aqua_farming:water_soil"].tiles,
        special_tiles = {
                            {name = modname .. "_" .. nodename .. "_seed.png",tileable_vertical = true},
                        },
        inventory_image = modname .. "_" .. nodename .. "_seed.png",
        wield_image = modname .. "_" .. nodename .. "_seed.png",
        groups = {dig_immediate = 3, attached_node = 1},
        after_place_node = function(pos, placer, itemstack, pointed_thing)
            local meta = minetest.get_meta(pos)
            meta:set_int("lightlevel", min_light)
        end,

        on_place = function(itemstack, placer, pointed_thing)
            if(aqua_farming.plant_seed(node_def, pointed_thing)) then
                itemstack:take_item()
                return itemstack
            end

            return itemstack
        end,

        after_dig_node = function(pos, oldnode, oldmetadata, digger)
                                minetest.set_node(pos, {name = "aqua_farming:water_soil"})

                        end, -- function

    })

    local abm_name, next_abm
    abm_name = modname .. ":" .. nodename .. "_seed"
    next_abm = modname .. ":" .. nodename .. "_1"
    aqua_farming.register_abm(abm_name, next_abm, node_def.delay, node_def.chance)

    for step = 1, node_def.steps - 1  do

        minetest.register_node(":" .. modname .. ":".. nodename .. "_" .. step,{
            description = node_def.description .. "_" .. step,
            drawtype = "plantlike_rooted",
            waving = 1,
            paramtype = "light",
            tiles = minetest.registered_nodes["aqua_farming:water_soil"].tiles,
            special_tiles = {
                             {name = modname .. "_" .. nodename .. "_" .. step .. ".png",
                              tileable_vertical = false},
                            },
            groups = {not_in_creative_inventory=1, snappy = 3, growing = 1,
                      attached_node = 1, plant = 1, dig_immediate = 1},
            sounds = default.node_sound_leaves_defaults(),
            drop = {},
            selection_box = {
                type = "fixed",
                fixed = {
                    --{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
                    {-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
                },
            },
            after_destruct = function(pos, oldnode)
                minetest.set_node(pos, {name = "aqua_farming:water_soil"})
            end,
        })

        abm_name = modname .. ":" .. nodename .. "_" .. step
        next_abm = modname .. ":" .. nodename .. "_" .. step + 1
        aqua_farming.register_abm(abm_name, next_abm, node_def.delay, node_def.chance)

    end -- for step

    -- Last Plantnode
    minetest.register_node(":" .. modname .. ":" .. nodename .. "_" .. node_def.steps,{
        description = node_def.description .. "_" .. node_def.steps,
        drawtype = "plantlike_rooted",
        waving = 1,
        paramtype = "light",
        tiles = minetest.registered_nodes["aqua_farming:water_soil"].tiles,
        special_tiles = {
                         {name = modname .. "_" .. nodename .. "_" .. node_def.steps .. ".png",
                          tileable_vertical = false}
                        },
        groups = {not_in_creative_inventory=1, snappy = 3, attached_node = 1, plant = 1, dig_immediate = 1},
        sounds = default.node_sound_leaves_defaults(),
        drop = node_def.drop,
        selection_box = {
            type = "fixed",
            fixed = {
                --{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
                {-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
            },
        },
        after_dig_node = function(pos, oldnode, oldmetadata, digger)
                                minetest.set_node(pos, {name = "aqua_farming:water_soil"})

                        end, -- function
    })

    -- Wild Plantnode
    minetest.register_node(":" .. modname .. ":" .. nodename .. "_wild",{
        description = S("Wild") .. " " .. node_def.description,
        drawtype = "plantlike_rooted",
        waving = 1,
        paramtype = "light",
        tiles = minetest.registered_nodes[node_def.basenode].tiles,
        special_tiles = {
                         {name = modname .. "_" .. nodename .. "_" .. node_def.steps .. ".png",
                          tileable_vertical = false}
                        },
        groups = {not_in_creative_inventory=1, snappy = 3, attached_node = 1, plant = 1, dig_immediate = 1},
        sounds = default.node_sound_leaves_defaults(),
        drop = node_def.drop,
        selection_box = {
            type = "fixed",
            fixed = {
                --{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
                {-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
            },
        },
        after_dig_node = function(pos, oldnode, oldmetadata, digger)
                                minetest.set_node(pos, {name = node_def.basenode})

                        end, -- function
    })

end -- function register_plant

function aqua_farming.report(text)
    print("[MOD] aqua_farming: " .. text)
    minetest.log("info", "[MOD] aqua_farming: " .. text)

end
