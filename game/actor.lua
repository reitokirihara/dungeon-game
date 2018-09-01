Actor = Class{
    init = function(self, pos, def)
        self.tilePos = pos
        self.pos = tileToWorldPos(self.tilePos) + vector(0, -TILE_SIZE * love.math.random(8))
        self.actor_def = def
        self.isMoving = false
        self.scale = def.scale or 1
        self.energy = def.energy or 3
        self.offset = vector((TILE_SIZE - (TILE_SIZE * self.scale))/2, (TILE_SIZE - (TILE_SIZE * self.scale))/2)
        self.abilities = def.abilities or {}
        self.hp = def.hp or 5
        self.isAlive = true

        flux.to(self.pos, 0.75, 
        		{
        			x = self.pos.x, 
        			y = tileToWorldPos(self.tilePos).y
        		})
        		:ease("backout")
                :delay(math.random()/(self.tilePos.y+1))
        board.tiles[self.tilePos.y][self.tilePos.x].isOccupied = true
        board.tiles[self.tilePos.y][self.tilePos.x].actor = self
    end,
    draw = function(self)
        love.graphics.setColor(self.actor_def.color)
        love.graphics.rectangle("fill", self.pos.x + self.offset.x, self.pos.y + self.offset.y, TILE_SIZE * self.scale, TILE_SIZE * self.scale)
    end
}

function Actor:move(dir)
    if not self.isMoving then
        local newPos = self.tilePos + dir
        if not board.tiles[newPos.y][newPos.x].isOccupied then
            if not board:isSolid(newPos) then
                self.isMoving = true
                board.tiles[self.tilePos.y][self.tilePos.x].isOccupied = false
                board.tiles[self.tilePos.y][self.tilePos.x].actor = nil
                self.tilePos = newPos
                flux.to(self.pos, 0.5, 
                        {
                            x = tileToWorldPos(self.tilePos).x,
                            y = tileToWorldPos(self.tilePos).y
                        })
                        :oncomplete(function()
                            self.isMoving = false
                            board.tiles[self.tilePos.y][self.tilePos.x].isOccupied = true
                            board.tiles[self.tilePos.y][self.tilePos.x].actor = self
                        end)
                
            end
        end    
    end 
end

function Actor:cast(i)
    if self.energy >= self.abilities[i].cost and self.abilities[i] ~= nil then
        Ability(self.abilities[i], self):cast()
    end
end

function Actor:damage(dmg)
    self.hp = self.hp - dmg
    if self.hp <= 0 then
        --kill the actor
        self:destroySelf()
    end
end

function Actor:destroySelf()
    self.isAlive = false
    local tile = board:getTile(self.tilePos)

    tile.actor = nil
    tile.isOccupied = false
end