PlayState = {
    init = function(self)
        board = Board()
        -- cursor = Cursor(vector(2,2))
        player = Actor(vector(2,2), ACTOR_TYPES["player"])
        enemy = Actor(vector(7,7), ACTOR_TYPES["enemy"])
        actors = {player, enemy}

        local path = board:getShortestPath(player, enemy)
        for i, tile in ipairs(path) do
            tile.color = {0, 0.6, 0.2}
        end

    
    end,
    draw = function(self)
        push:start()
        board:draw()
        
        for i, actor in ipairs(actors) do
            if actor.isAlive then
                actor:draw()
            end
        end

        push:finish()
    end
}

function PlayState:update(dt)
end

function PlayState:keypressed(key)
    if key == "w" then
        player:move(DIRS[DIR_UP])
    elseif key == "d" then
        player:move(DIRS[DIR_RIGHT])
    elseif key == "a" then
        player:move(DIRS[DIR_LEFT])
    elseif key == "s" then 
        player:move(DIRS[DIR_DOWN])
    end 

    local path = board:getShortestPath(player, enemy)

    for i, tile in ipairs(path) do
        tile.color = {0, 0.6, 0.2}
    end

    if #path > 1 then
        enemy:move(path[1].tilePos - enemy.tilePos)
    end

    

    if key == "1" then
        player:cast(1)
    end

    if key == "return" then
        --select tile
        cursor.selectedTile = cursor.tilePos
        GameState.push(TileState)
    end
end

