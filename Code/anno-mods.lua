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
    return debug.getmetatable(_table)
  else
    return _table
  end
end

local function resetTable()
  _ttable = {}
end

local function getDeepTable(_table, indent)
  local indent = indent or 0
  print(indent)
  if type(_table) ~= 'table' or indent >= 8 then
    -- stop at depth of 8 to prevent endless loops.... still takes ages to finish looping
    print("error, no table given")
    return
  end
  -- convert every array or metatable to array (pairs might fail if C-API call is blocked)
  local _kvtable = getkvtable(_table)
 -- table.insert(_ttable, " - "..tostring(_table)"\n")
  for k,v in pairs(_kvtable) do
    --print(k, type(_table[k]))
    if type(_table[k]) == 'table' then
      table.insert(_ttable, string.rep('\t', indent).." - "..tostring(k).." : "..tostring(v).."\n")
      getDeepTable(_table[k], indent + 1)
    else
      table.insert(_ttable, string.rep('\t', indent).." - "..tostring(k).." : "..tostring(v).."\n")
    end
  end
  return
end

local function saveTableToFile(_table,fileName)
  if type(fileName) ~= 'string' then
    print("error no string given as filename")
    return
  end -- errorhandling
  file = io.open(fileName,"a")
  print("opening done attempting to write")
  for i = 1,#_table do
    file:write(_table[i])
  end
  print("finished writing -> closing file")
  file:close()
  -- flush table after printing
  resetTable()
end

amods = {
  getDeepTable = getDeepTable,
  saveTable = saveTableToFile,
  reset = resetTable
}

print("anno-mods.lua loaded")