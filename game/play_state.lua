PlayState = {
    draw = function(self)
        push:start()
        board:draw()
        player:draw()
        -- cursor:draw()
        enemy:draw()
        push:finish()
    end
}

function PlayState:init()
    board = Board()
    -- cursor = Cursor(vector(2,2))
    player = Actor(vector(2,2), ACTOR_TYPES["player"])
    enemy = Actor(vector(7,7), ACTOR_TYPES["enemy"])
end

function PlayState:keypressed(key)
    if key == "w" then
        player:move(DIR_UP)
    elseif key == "d" then
        player:move(DIR_RIGHT)
    elseif key == "a" then
        player:move(DIR_LEFT)
    elseif key == "s" then 
        player:move(DIR_DOWN)
    end 

    if key == "return" then
        --select tile
        cursor.selectedTile = cursor.tilePos
        GameState.push(TileState)
    end
end

