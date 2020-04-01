    local af_items = {
      --                Name                       Saturation      Replace with                Poison  Heal    Sound
      -- crops
      {'aqua_farming:alga_items',                  1,              nil,                        nil,    nil,     nil},
      {'aqua_farming:sea_strawberry_item',         3,              nil,                        nil,    nil,     nil},
      {'aqua_farming:sea_anemone_item',            3,              nil,                        nil,    1,       nil},
      {'aqua_farming:sea_cucumber_item',           4,              nil,                        nil,    nil,     nil},
      {'aqua_farming:sea_strawberry_cake_piece',   4,              nil,                        nil,    nil,     nil},

    }


--   *******************************************
--   *****           Hunger-Support        *****
--   *******************************************

if(minetest.get_modpath("hunger")) then
    for key, item in pairs(af_items) do
        hunger.register_food(item)

    end -- for key, data

end -- hunger

--   **********************************************
--   *****           Hunger_ng-Support        *****
--   **********************************************

if(minetest.get_modpath("hunger_ng")) then
    local add = hunger_ng.add_hunger_data

    for key, item in pairs(af_items) do
        add(item[1], {satiates = item[2], returns = item[3], heals = math.floor((item[5] or 0)), timeout = 0})

    end -- for key, data

end -- hunger_ng

--   *******************************************
--   *****           Diet-Support          *****
--   *******************************************

if(minetest.get_modpath("diet")) then

    local function overwrite(name, hunger_change, replace_with_item, poisen, heal)
        local tab = minetest.registered_items[name]
        if not tab then
            return
        end
        tab.on_use = diet.item_eat(hunger_change, replace_with_item, poisen, heal)
    end -- local function overwrite

    for key,item in pairs(af_items) do
        overwrite(item[1], item[2], item[3], item[4], item[5])

    end -- for key,item

end -- if(minetest.get_modpath("diet
