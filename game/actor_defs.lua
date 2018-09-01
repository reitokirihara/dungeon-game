ACTOR_IDS = {
    "player",
    "enemy"
}

ACTOR_TYPES = {
    ["player"] = {
        color = {0, 0, 1},
        hp = 10,
        scale = 0.7,
        abilities = {
            ABILITY_TYPES["attackA"]
        }
    },
    ["enemy"] = {
        color = {1, 0, 0},
        hp = 3,
        scale = 0.7,
        abilities = {
            ABILITY_TYPES["attackA"]
        }
    }
}