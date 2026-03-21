Bullet = Object:extend()

function Bullet:new(x, y, speed, dx, dy, range, t)
    self.t = t
    self.x, self.y = x, y
    self.y = y
    self.speed = speed
    self.dx = dx
    self.dy = dy
    self.r = 5
    self.traveled = 0
    self.distance = 0
end

function Bullet:update(dt)
    --check for range of bullet and determine if at range(delete if so)
    self:move(dt)
    self.dx, self.dy = self:updateAngle(dt)
end

function Bullet:draw()
    love.graphics.setColor(.4, .4, .4, 1)
    love.graphics.circle("fill", self.x, self.y, self.r)
end



function Bullet:updateAngle(dt)
    for i = #enemies, 1, -1 do
        if enemies[i].id == self.t then
            local angle = getAngle(enemies[i].y, self.y, enemies[i].x, self.x)
            local dx = math.cos(angle)
            local dy = math.sin(angle)
            return dx, dy
        end
    end
    return self.dx, self.dy
end

function Bullet:move(dt)
    self.x = self.x + self.dx * self.speed * dt
    self.y = self.y + self.dy * self.speed * dt
    print(self.x, self.y)
end





