local S = aqua_farming.S

function aqua_farming.check_water(pos)
    local checkpos = pos
    local above = minetest.get_node_or_nil({x = checkpos.x, y = checkpos.y + 2, z = checkpos.z})

        if (above ~= nil and above.name == "default:water_source" or above.name == "default:river_water_source") then
            return true
        end -- if(above

        return false

end -- aqua_farming.check_water(

function aqua_farming.check_light(pos)
    local checkpos = pos
    local above = {x = checkpos.x, y = checkpos.y + 1, z = checkpos.z}
    local meta = minetest.get_meta(pos)
    local lightlevel = meta:get_int("lightlevel")
    local light

    if(minetest.get_node_or_nil(above) ~= nil) then
        light = minetest.get_node_light({x = checkpos.x, y = checkpos.y + 1, z = checkpos.z})
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

function aqua_farming.register_plant(node_def)

    if(minetest.registered_nodes[node_def.basenode] == nil) then
        aqua_farming.report("Unknown Basenode: " .. node_def.basenode .. ".")
        return
    end -- if(not minetest_registered_nodes

    if(node_def.steps <= 0 or node_def.steps == nil) then
        aqua_farming.report("Node: aqua_farming:" .. node_def.nodename .. " has no steps.")
        return
    end -- if(steps

    local min_light = node_def.min_light

    if(node_def.min_light <= 0) then
        min_light = 0

    end -- if(min_light < 0

    if(min_light >= default.LIGHT_MAX) then
        min_light = default.LIGHT_MAX - 1

    end -- if(min_light > light_max

    local basename = aqua_farming.get_nodename(node_def.basenode)
    local base_description = minetest.registered_nodes[node_def.basenode].description

    minetest.register_node("aqua_farming:" .. basename .. "_with_" .. node_def.nodename, {
        description = base_description .. S(" with ") .. node_def.description,
        tiles = minetest.registered_nodes[node_def.basenode].tiles,
        groups = minetest.registered_nodes[node_def.basenode].groups,
        after_place_node = function(pos, placer, itemstack, pointed_thing)
            local meta = minetest.get_meta(pos)
            meta:set_int("lightlevel", min_light)
        end,
    })

    local abm_name, next_abm
    abm_name = "aqua_farming:" .. basename .. "_with_" .. node_def.nodename
    next_abm = "aqua_farming:" .. basename .. "_with_" .. node_def.nodename .. "_1"
    aqua_farming.register_abm(abm_name, next_abm, node_def.delay, node_def.chance)

    for step = 1, node_def.steps - 1  do

        minetest.register_node("aqua_farming:" .. basename .. "_with_" .. node_def.nodename .. "_" .. step,{
            description = basename .. S(" with ") .. node_def.description .. "_" .. step,
            drawtype = "plantlike_rooted",
            waving = 1,
            paramtype = "light",
            tiles = minetest.registered_nodes[node_def.basenode].tiles,
            special_tiles = {
                             {name = "aqua_farming_" .. node_def.nodename .. "_" .. step .. ".png",
                              tileable_vertical = false}
                            },
            inventory_image = "aqua_farming_" .. node_def.nodename .. "_" .. step .. ".png",
            groups = {snappy = 3, growing = 1, attached_node = 1, plant = 1, dig_immediate = 1},
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
                local meta
                minetest.swap_node(pos, {name = "aqua_farming:".. basename .. "_with_" .. node_def.nodename})
                meta = minetest.get_meta(pos)
                meta:set_int("lightlevel", min_light)
            end,
        })

        abm_name = "aqua_farming:" .. basename .. "_with_" .. node_def.nodename .. "_" .. step
        next_abm = "aqua_farming:" .. basename .. "_with_" .. node_def.nodename .. "_" .. step + 1
        aqua_farming.register_abm(abm_name, next_abm, node_def.delay, node_def.chance)

    end -- for step

    minetest.register_node("aqua_farming:" .. basename .. "_with_" .. node_def.nodename .. "_" .. node_def.steps,{
        description = node_def.description,
        drawtype = "plantlike_rooted",
        waving = 1,
        paramtype = "light",
        tiles = minetest.registered_nodes[node_def.basenode].tiles,
        special_tiles = {
                         {name = "aqua_farming_" .. node_def.nodename .. "_" .. node_def.steps .. ".png",
                          tileable_vertical = false}
                        },
        inventory_image = "aqua_farming_" .. node_def.nodename .. "_" .. node_def.steps .. ".png",
        groups = {snappy = 3, growing = 1, attached_node = 1, plant = 1, dig_immediate = 1},
        sounds = default.node_sound_leaves_defaults(),
        drop = node_def.drop,
        selection_box = {
            type = "fixed",
            fixed = {
                --{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5},
                {-4/16, 0.5, -4/16, 4/16, 1.5, 4/16},
            },
        },
        after_destruct = function(pos, oldnode)
            local meta
            minetest.swap_node(pos, {name = "aqua_farming:".. basename .. "_with_" .. node_def.nodename})
            meta = minetest.get_meta(pos)
            meta:set_int("lightlevel", min_light)
        end,
    })

end -- function register_plant

function aqua_farming.get_nodename(nodename)
    local find = string.find(nodename, ":")

    return string.sub(nodename, find + 1)

end -- get_nodename

function aqua_farming.report(text)
    minetest.log("info", "[MOD] aqua_farming: " .. text)

end
