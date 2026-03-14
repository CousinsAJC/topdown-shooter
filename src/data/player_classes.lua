p_type = {
    ['ranger'] = {
        str = 8,
        dex = 8,
        con = 8,
        int = 8,
        wis = 8,
        cha = 8,

        health = 10,
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
        weapon = 'bow'
    },


    ['sorceror'] = {
        str = 8,
        dex = 8,
        con = 8,
        int = 8,
        wis = 8,
        cha = 8,

        health = 8
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
        weapon = 'wand'
    },


    ['soldier'] = {
        str = 8,
        dex = 8,
        con = 8,
        int = 8,
        wis = 8,
        cha = 8,

        health = 12
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
        weapon = 'spear'
    }
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
