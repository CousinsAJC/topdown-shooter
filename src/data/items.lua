item_type = {
    ['great-club'] = {
        complete = false,
        name = 'Great Club',
        type = 'weapon',
        class = {'bludgeon', 'giant', 'melee'},
        damage = 10,
        damageScaling = 'melee',
        scalingPercent = 90,
        attackSpeed = 2.0,
        timer = 0,
        critDamage = 1.25,
        critChance = 1,
        range = 5,
        lifesteal = 0,
        specialEffect = 'none',
        basePrice = 20,
        unlocked = true,
        --texture = love.graphics.newImage('src/assets/great-club.png'),
        animations = {
            ['attack'] = {
                frames = {1},
                interval = 1
            }
        }
    },

    ['bow'] = {
        complete = false,
        type = 'weapon',
        class = {'piercing', 'ranged'},
        damage = 7,
        damageScaling = 'ranged',
        scalingPercent = 70,
        attackSpeed = 1,
        timer = 0,
        critDamage = 1.50,
        critChance = 2,
        range = 300,
        lifesteal = 0,
        specialEffect = 'none',
        basePrice = 20,
        unlocked = true,
        texture = love.graphics.newImage("src/assets/bow.png"),
        animations = {
            ['attack'] = {
                frames = {1},
                interval = 1
            },
        },
    },

    ['wand'] = {
        complete = false,
        type = 'weapon',
        class = {'magic', 'ranged'},
        damage = 6,
        damageScaling = 'magic',
        scalingPercent = 80,
        attackSpeed = 1.0,
        timer = 0,
        critDamage = 1.25,
        critChance = 1,
        range = 300,
        lifesteal = 2,
        specialEffect = 'none',
        basePrice = 20,
        unlocked = true,
        --texture = love.graphics.newImage("src/assets/wand.png"),
        animations = {
            ['attack'] = {
                frames = {1},
                interval = 1
            },
        },
    }
}