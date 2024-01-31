_ttable = {} -- init empty table

-- metatables have __index as a stored function, the absence of the function in a table shows its not a metatable
local function check_mt(_table)
  if _table.__index ~= nil then
    return true -- is a metatable
  else
    return false --is NOT a metatable
  end
end

local function getkvtable(_table)
  if check_mt(_table) == true then
    return = getmetatable(_table)
  else
    return _table
  end
end

local function resetTable()
  _ttable = {}
end

local function getDeepTable(_table, int)
  local int = int or 0
  if type(_table) == 'table' then
    _table = getkvtable(_table)
    for k,v in pairs(_table) do
      if type(v) == 'table' then
        getDeepTable(k, int+1)
      end
    end
  else
    table.insert(_ttable, string.rep('\t', int)..tostring(k).." : "..tostring(v))
  end
end

local function saveTableToFile(_table,fileName)
  file = io.open(fileName,"a")
  for i = 1,tableLength(_table) do
    file:write(_table[i])
  end
  file:close()
end

function tableLength(T)
  local count = 0
  for _ in pairs(T) do
    count = count + 1
  end
  return count
end


amods = {
  getDeepTable = getDeepTable,
  saveTable = saveTableToFile
}
print("anno-mods.lua loaded")