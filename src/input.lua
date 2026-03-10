function love.keypressed(key)
    if key == "tab" or key == "escape" then
        love.event.quit()
    end
end
