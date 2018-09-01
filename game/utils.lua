function print_r ( t )
    local print_r_cache={}
    local function sub_print_r(t,indent)
        if (print_r_cache[tostring(t)]) then
            print(indent.."*"..tostring(t))
        else
            print_r_cache[tostring(t)]=true
            if (type(t)=="table") then
                for pos,val in pairs(t) do
                    if (type(val)=="table") then
                        print(indent.."["..pos.."] => "..tostring(t).." {")
                        sub_print_r(val,indent..string.rep(" ",string.len(pos)+8))
                        print(indent..string.rep(" ",string.len(pos)+6).."}")
                    elseif (type(val)=="string") then
                        print(indent.."["..pos..'] => "'..val..'"')
                    else
                        print(indent.."["..pos.."] => "..tostring(val))
                    end
                end
            else
                print(indent..tostring(t))
            end
        end
    end
    if (type(t)=="table") then
        print(tostring(t).." {")
        sub_print_r(t,"  ")
        print("}")
    else
        sub_print_r(t,"  ")
    end
    print()
end

function worldToTilePos(pos)
    return vector(math.floor((pos.x - BOARD_X_OFFSET)/TILE_SIZE) + 1, math.floor((pos.y - BOARD_Y_OFFSET)/TILE_SIZE) + 1)
end

function tileToWorldPos(pos)
    return vector((pos.x - 1)*TILE_SIZE + BOARD_X_OFFSET, (pos.y - 1)*TILE_SIZE + BOARD_Y_OFFSET)
end 

function contains(table, key)
    for i, n in ipairs(table) do
        if key == n then
            return true
        end
    end
    return false
end