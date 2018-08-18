Actor = Class{
    init = function(self, pos, def)
        self.tilePos = pos
        self.pos = tileToWorldPos(self.tilePos) + vector(0, -TILE_SIZE * love.math.random(8))
    end,
    draw = function(self)
    end
}