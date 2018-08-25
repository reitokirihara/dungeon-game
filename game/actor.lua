Actor = Class{
    init = function(self, pos, def)
        self.tilePos = pos
        self.pos = tileToWorldPos(self.tilePos) + vector(0, -TILE_SIZE * love.math.random(8))
        self.actor_def = def
        self.isMoving = false

        flux.to(self.pos, 0.75, 
        		{
        			x = self.pos.x, 
        			y = tileToWorldPos(self.tilePos).y
        		})
        		:ease("backout")
                :delay(math.random()/(self.tilePos.y+1))
        board.tiles[self.tilePos.y][self.tilePos.x].isOccupied = true
    end,
    draw = function(self)
        love.graphics.setColor(self.actor_def.color)
        love.graphics.rectangle("fill", self.pos.x, self.pos.y, TILE_SIZE , TILE_SIZE)
    end
}

function Actor:move(dir)
    if not self.isMoving then
        local newPos = self.tilePos + dir
        if not board.tiles[newPos.y][newPos.x].isOccupied then
            if not board:isSolid(newPos) then
                self.isMoving = true
                board.tiles[self.tilePos.y][self.tilePos.x].isOccupied = false
                self.tilePos = newPos
                flux.to(self.pos, 0.5, 
                        {
                            x = tileToWorldPos(self.tilePos).x,
                            y = tileToWorldPos(self.tilePos).y
                        })
                        :oncomplete(function()
                            self.isMoving = false
                            board.tiles[self.tilePos.y][self.tilePos.x].isOccupied = true
                        end)
                
            end
        end    
    end 
end