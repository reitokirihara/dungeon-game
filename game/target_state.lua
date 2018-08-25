TargetState = {
    draw = function(self){
        PlayState:draw()
        push:start()
        --draw cursor
        push:finish()
    }
}

function TargetState:init(self)

end

function TargetState:update(dt)
    PlayState:update(dt)
end

function TargetState:enter()
    --highlight tiles in range of ability
    --display cursor on one of the valid tiles
end

function TargetState:leave()
    --remove the tile hightlighting
end

function TargetState:keyreleased(key)
    --if our cursor is over a valid target, execute the ability
    --self.ability:execute()
end