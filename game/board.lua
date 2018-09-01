Board = Class{
    init = function(self)
        self.size = TILE_SIZE * TILES_PER_ROW
        self.position = vector(BOARD_X_OFFSET, BOARD_Y_OFFSET)
        self.color = {0,1,0}
        self.tiles = {}

        for y = 1, TILES_PER_ROW do
            table.insert(self.tiles, {})
            for x = 1, TILES_PER_ROW do
                if x == 1 or x == TILES_PER_ROW or y == 1 or y == TILES_PER_ROW then
                    self.tiles[y][x] = Tile(vector(x, y), TILE_TYPES["wall"])
                else 
                    self.tiles[y][x] = Tile(vector(x, y), TILE_TYPES["floor"])
                end
            end
        end
    end,
    draw = function(self)
        for y, row in ipairs(self.tiles) do
            for x, tile in ipairs(row) do
                love.graphics.setColor(tile.color)
                love.graphics.rectangle("fill", self.position.x + tile.boardPos.x - TILE_SIZE, self.position.y + tile.boardPos.y - TILE_SIZE, TILE_SIZE, TILE_SIZE)
                love.graphics.setColor(0,0,0)
                love.graphics.getLineWidth(TILE_SIZE/8)
                love.graphics.rectangle("line", self.position.x + tile.boardPos.x - TILE_SIZE, self.position.y + tile.boardPos.y - TILE_SIZE, TILE_SIZE, TILE_SIZE)
           end
        end
    end
}

function Board:isAdjacent(p1, p2)
    return Board:manhattan(p1,p2) == 1; 
end

function Board:manhattan(p1, p2)
    return math.abs(p1.x - p2.x) + math.abs(p1.y - p2.y)
end

function Board:isSolid(pos)
    return self.tiles[pos.y][pos.x].isSolid
end

function Board:isValid(pos)
    return pos.x <= #self.tiles[1] and pos.y <= #self.tiles and pos.x > 0 and pos.y > 0
end

function Board:getTile(pos)
    if self:isValid(pos) then
        return self.tiles[pos.y][pos.x]
    end
end

function Board:getNeighbors(pos)
    local neighbors = {}

    for i, dir in ipairs(DIRS) do
        local tile = board:getTile(pos + dir)
        if tile ~= nil and not tile.isSolid then
            table.insert(neighbors, tile)
        end
    end

    return neighbors
end

function Board:getActor(pos)
    local tile = board:getTile(pos)
    if tile.actor ~= nil then 
        return tile.actor
    end
end

function Board:getShortestPath(p1, p2)
    local frontier = {}
    local goal = self:getTile(p2.tilePos)
    table.insert(frontier, self:getTile(p1.tilePos))
    
    visited = {}
    cameFrom = {}

    while #frontier > 0 do
        current = table.remove(frontier, 1)

        if current == goal then
            --reconstruct path from goal backwards
            current = goal
            path = {}
            while current ~= self:getTile(p1.tilePos) do
                table.insert(path, current)
                current = cameFrom[current]
            end
            return path
        end

        local neighbors = self:getNeighbors(current.tilePos)
        for i, n in ipairs(neighbors) do
            if not visited[n] then
                table.insert(frontier, n)
                visited[n] = true
                cameFrom[n] = current
            end
        end
    end

    print("no path found")
    return {}
end