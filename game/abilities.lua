Ability = Class{
    init = function(self, def, owner)
        self.owner = owner
        self.damage = def.damage or 0
        self.range = def.range or 0
        self.cost = def.cost or 0

        self.cast = def.cast or function() end
        self.execute = def.execute or function() end
        
    end
}