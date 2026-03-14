Bullet = Object:extend()

function Bullet:new(x, y, speed, dx, dy)
    self.x = x
    self.y = y
    self.speed = speed
    self.dx = dx
    self.dy = dy
    self.r = 5
    self.camX = null
    self.camY = null
    self.xWorld, self.yWorld = CM.toWorldCoords(self.x, self.y)
end

function Bullet:update(dt)
    self:checkHitboxes(dt)
    self:move(dt)
    self.camX, self.camY = CM.toCameraCoords(self.x, self.y)
end

function Bullet:draw()
    love.graphics.setColor(.4, .4, .4, 1)
    love.graphics.circle("fill", self.camX, self.camY, self.r)
end


function Bullet:checkHitboxes(dt)

end


function Bullet:move(dt)
    self.x = self.x + self.dx * self.speed * dt
    self.y = self.y + self.dy * self.speed * dt
end