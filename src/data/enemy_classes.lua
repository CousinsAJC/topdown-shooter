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
