-- metatables have __index as a stored function, the absence of the function in a table shows its not a metatable
local function check_mt(_table)
  if _table.__index ~= nil then
    return true -- is a metatable
  else
    return false --is NOT a metatable
  end
end

local function getChilds(_table)
  if check_mt(_table) == true then
    return = getmetatable(_table)
  else
    return _table
  end
end

local function 

amods = {

}
print("anno-mods.lua loaded")