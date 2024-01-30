```lua
file = io.open("globals.txt","a") for k, v in pairs (_G) do file:write ("Global: ", tostring (k), " = value: ", tostring (v), "\n") end file:close()
```