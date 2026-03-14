Gold = Object:extend()

function Gold:new(x, y)
    self.x = x
    self.y = y
    self.r = 10
    self.color = color.yellow
    self.pickup = false
end

function Gold:update(dt)
    local distance = getDistance(self.x, self.y, p1.x, p1.y)
    if distance <= self.r + p1.r then
        self.pickup = true
    end
end

function Gold:draw()
    love.graphics.setColor(self.color)
    love.graphics.circle('fill', self.x, self.y, self.r)
end