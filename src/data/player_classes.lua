p_type = {
    ['ranger'] = {
        startingWeapon = item_type['bow'],
        
        maxHp = 10,
        hpRegen = 0,
        lifeSteal = 0,
        damage = 1,
        meleeDamage = 0,
        rangedDamage = 0,
        magicDamage = 0,
        attackSpeed = 0,
        critChance = 0,
        critDamage = 1.5,
        range = 10,
        armor = 0,
        dodge = 0,
        speed = 3,
        luck = 0,
        harvesting = 0,

        --animations to be fixed at later date.
        texture = 'ranger',
        animations = {
            ['idle'] = {
                frames = {1},
                interval = 1
            },
            ['walking-left'] = {
                frames = {2,3,4,2},
                interval = 0.2
            }
        },
    },


    ['sorceror'] = {
        startingWeapon = 'wand',

        maxHp = 10,
        hpRegen = 0,
        lifeSteal = 0,
        damage = 1,
        meleeDamage = 0,
        rangedDamage = 0,
        magicDamage = 0,
        attackSpeed = 0,
        critChance = 0,
        critDamage = 1.5,
        range = 10,
        armor = 0,
        dodge = 0,
        speed = 2,
        luck = 0,
        harvesting = 0,

        texture = 'sorceror',
        animations = {
            ['idle'] = {
                frames = {1},
                interval = 1
            },
            ['walking-left'] = {
                frames = {2,3,4,2},
                interval = 0.2
            }
        },
    },

    ['berserker'] = {
        startingWeapon = 'great-club',
        
        maxHp = 10,
        hpRegen = 0,
        lifeSteal = 0,
        damage = 0,
        meleeDamage = 0,
        rangedDamage = 0,
        magicDamage = 0,
        attackSpeed = 0,
        critChance = 0,
        critDamage = 1.25,
        range = 10,
        armor = 0,
        dodge = 0,
        speed = 2,
        luck = 0,
        harvesting = 0,

        texture = 'soldier',
        animations = {
            ['idle'] = {
                frames = {1},
                interval = 1
            },
            ['walking-left'] = {
                frames = {2,3,4,2},
                interval = 0.2
            }
        },
    },
}


e_type = {
    ['goblin'] = {
        health = 10,
        speed = 4,
        texture = 'goblin',
        animations = {
            ['idle'] = {
                frames = {1},
                interval = 1
            },
            ['walking-left'] = {
                frames = {2,3,4,2},
                interval = 0.2
            }
        },
        weapon = 'club',
        aggresive = true,
        sleepsAtNight = true,
        flammable = true
    }
}
