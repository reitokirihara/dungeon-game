ABILITY_IDS = {
    "attackA",
    "attackB"
}

ABILITY_TYPES = {
    ["attackA"] = {
        damage = 1,
        execute = function()
            TargetState.ability = self
            TargetState.tiles = {}
            gameState.push(TargetState)
        end
    },
    ["attackB"] = {
        damage = 0
    }
}