TargetState = Class{
    draw = function(self)
        PlayState:draw()
        push:start()
        --draw cursor
        cursor:draw()
        push:finish()
    end
}

function TargetState:init(self)
end

-- function TargetState:update(dt)
--     PlayState:update(dt)
-- end

function TargetState:enter()
    --highlight tiles in range of ability
    --display cursor on one of the valid tiles
    cursor = Cursor(self.tiles[1].tilePos)

    for i, tile in ipairs(self.tiles) do
        tile.color = {0.6,0,0.9}
    end
    -- cursor.pos = tileToWorldPos(cursor.tilePos)
end

function TargetState:leave()
    --remove the tile hightlighting
    for i, tile in ipairs(self.tiles) do
        tile.color = tile.type.color
    end
end

function TargetState:keyreleased(key)
    --if our cursor is over a valid target, execute the ability
    --self.ability:execute()
end

function TargetState:keypressed(key)

    if key == "w" or key == "up" then
        cursor:move(VEC_UP)
    end
    if key == "a" or key == "left" then
        cursor:move(VEC_LEFT)
    end
    if key == "s" or key == "down" then
        cursor:move(VEC_DOWN)
    end
    if key == "d" or key == "right" then
        cursor:move(VEC_RIGHT)
    end

    if key == "e" or key == "return" then
        self:checkTarget()
    end

    if key == "escape" then
        GameState.pop()
    end
end

function TargetState:checkTarget()
    local tile = board:getTile(cursor.tilePos)
    local actor = board:getActor(tile.tilePos)

    if tile ~= nil then
        if contains(self.tiles, tile) then
            if actor ~= nil then
                self.ability:execute(actor)
            end
        end
    end

    GameState.pop()
end