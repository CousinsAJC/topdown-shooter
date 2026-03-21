Player = Object:extend()

function Player:new(class)
    --obtain data from class
    self:getClass(class)

    --diagonal speeds
    self.pace = 1

    --set starting position
    self.r = 10
    self.x = WINWIDTH/2
    self.y = WINHEIGHT/2
    self.centerX = self.x
    self.centerY = self.y
    --position in world space
    self.originX = 0
    self.originY = 0


    --initialize hp and currency
    self.currentHp = self.maxHp
    self.gold = 0


    --shooting
    self.bulletSpeed = 700
end


function Player:update(dt)
    self:move(dt)

    for i=1, #self.weapons, 1 do
        self.weapons[i]:update(dt)
    end
end


function Player:draw()
    love.graphics.setColor(1, 0, 1, 1)
    love.graphics.circle("fill", self.x, self.y, self.r)
    love.graphics.setColor(1,1,1,1)
    for i = 1, #self.weapons, 1 do
        self.weapons[i]:draw()
    --love.graphics.draw(drawable,x,y,r,sx,sy,ox,oy)
    end
end


function Player:move(dt)
    if (love.keyboard.isDown("a") and (love.keyboard.isDown("w") or love.keyboard.isDown("s"))) or
        (love.keyboard.isDown("d") and (love.keyboard.isDown("w") or love.keyboard.isDown("s"))) then
            self.pace = .65
    else
        self.pace = 1
    end
    
    if love.keyboard.isDown("a") then
        self.x = self.x - self.speed * self.pace
    end
    if love.keyboard.isDown("d") then
        self.x = self.x + self.speed * self.pace
    end
    if love.keyboard.isDown("w") then
        self.y = self.y - self.speed * self.pace
    end
    if love.keyboard.isDown("s") then
        self.y = self.y + self.speed * self.pace
    end

    self:updateCenterPosition(dt)
end


function Player:updateCenterPosition(dt)
    if self.type == circle then
        self.centerX = self.x
        self.centerY = self.y
    else
        self.centerX = self.x - self.w/2
        self.centerY = self.y - self.h/2
    end
end



function Player:getClass(c)
    self.weapons = {}
    local weapon = Weapon(c['startingWeapon'])
    table.insert(self.weapons, weapon)
    self.maxHp = c['maxHp']
    self.hpRegen = c['hpRegen']
    self.lifeSteal = c['lifeSteal']
    self.damage = c['damage']
    self.meleeDamage = c['damage']
    self.rangedDamage = c['rangedDamge']
    self.magicDamage = c['magicDamage']
    self.attackSpeed = c['attackSpeed']
    self.critChance = c['critChance']
    self.critDamage = c['critDamage']
    self.range = c['range']
    self.armor = c['armor']
    self.dodge = c['dodge']
    self.speed = c['speed']
    self.luck = c['luck']
    self.harvesting = c['harvesting']

    self.texture = c['texture']
    self.animations = c['animations']

end