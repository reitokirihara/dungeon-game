Cursor = Class{
    init = function(self, pos)
        self.tilePos = pos
        self.pos = tileToWorldPos(self.tilePos)
        self.color = {1,1,1}
        self.selectedTile = nil
    end,
    draw = function(self)
        love.graphics.setColor(self.color)
        love.graphics.getLineWidth(TILE_SIZE/2)
        love.graphics.rectangle("line", self.pos.x, self.pos.y, TILE_SIZE, TILE_SIZE)
    end
}

function Cursor:move(dir)
    local newPos = self.tilePos + dir
    if board:isValid(newPos) then
        self.tilePos = newPos
        self.pos = tileToWorldPos(self.tilePos)
    end
end