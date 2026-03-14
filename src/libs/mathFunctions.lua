function getDistance(x1, y1, x2, y2)
    local dx = x2 - x1
    local dy = y2 - y1
    return math.sqrt((dx * dx) + (dy * dy)) -- Or math.sqrt(dx^2 + dy^2)
end

function getAngle(y1, y2, x1, x2)
    return math.atan2(y1 - y2, x1 - x2)
end