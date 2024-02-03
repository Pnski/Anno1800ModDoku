```lua
file = io.open("globals.txt","a") for k, v in pairs (_G) do file:write ("Global: ", tostring (k), " = value: ", tostring (v), "\n") end file:close()
```
```lua
function weakref(data) local weak = setmetatable({content=data}, {__mode="v"}) return function() return weak.content end end
```
```lua
function vc(x) print(debug.getlocal(1, 1)) end
```