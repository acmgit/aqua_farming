# Aqua Farming
A mod for minetest to farm under water.

## Description

Under water is sometimes a little boring. Granted, since minetest 5.x at least corals have been added, but how would it be to have a whole garden under water that you can even plant yourself?

This mod gives you the possibility to plant and harvest even under water. The special thing about it is that these plants also only thrive under water.

## API
You can define and register your own plants and let them growing.

aqua_farming:register_plant({
                                basenode,      (a Node like default:sand or default:dirt, where the plant is growing)
                                nodename,      (the Name of the plant itself)
                                description,   ( ... )
                                steps,         (How many steps has the Plant to grow.)
                                min_light,     (do they really need full sunshine to grow?)
                                drop,          (Define your drops.)
                                delay,         (Every x seconds it is checked whether)
                                chance         (the plant is going to the next stage.)
                            })

## Licence
GPL 3.0

## Depends
default

## optional Depends

