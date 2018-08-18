TileState = {
    init = function()
    end
}

debugText = ""

function TileState:draw()
    PlayState:draw()
    love.graphics.print(debugText, 0, 0)
end

function TileState:keypressed(key)
    if key == "w" then
        cursor:move(DIR_UP)
    elseif key == "d" then
        cursor:move(DIR_RIGHT)
    elseif key == "a" then
        cursor:move(DIR_LEFT)
    elseif key == "s" then 
        cursor:move(DIR_DOWN)
    end 
end

