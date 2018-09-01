ABILITY_IDS = {
    "attackA",
    "attackB"
}

ABILITY_TYPES = {
    ["attackA"] = {
        damage = 1,
        range = 1,
        cost = 0,
        cast = function(self)
            local tiles  = board:getNeighbors(self.owner.tilePos)
            TargetState.tiles = tiles
            TargetState.ability = self
            GameState.push(TargetState)
        end,
        execute = function(self, target)
            target:damage(self.damage)
            screen:shake(100)
            -- TargetState.ability = self
            -- TargetState.tiles = {}
            -- GameState.push(TargetState)
        end
    },
    ["attackB"] = {
        damage = 0
    }
}