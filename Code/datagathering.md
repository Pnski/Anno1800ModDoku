```lua
file = io.open("globals.txt","a") for k, v in pairs (_G) do file:write ("Global: ", tostring (k), " = value: ", tostring (v), "\n") end file:close()
```
```lua
function weakref(data) local weak = setmetatable({content=data}, {__mode="v"}) return function() return weak.content end end
```
```lua
function vc(x) print(debug.getlocal(1, 1)) end
```
taubenangriff:
```lua
for j=1,50 do 
    for possibleSession = 1,20 do -- Sessions are dynamic :frowning:
        local AreaID = {
            SessionID = possibleSession,
            AreaIndex = 1,
            IslandID = j
        }
        if(ts.Area.GetArea(AreaID).IsOwnedByCurrentParticipant) then --only use Player area
            -- do shit for player area
        end
    end
end
```
```lua
function toIntRepres(AreaID)
    -- bitshift sessionid to 13 left, fill bottom 13 with 0
    -- bitshift islandid 6 to left, fill bottom 6 with 0
    -- AND everything 
end 

function toAreaID(int_AreaID)
    -- sessionID: AND with 111 00000 0000 0000, bitshift 13 to right 
    -- islandID: AND with 000 1111111 00 0000, bitshift 6 to right
    -- areaID: AND with 0000 0000 0000 1111 
    -- construct areaID 
end

function toObjectID(objectId, areaID) 
-- x = toIntRepres(AreaID)
-- bitshift areaID by 32 to left
-- OR with x 
end
```
```
Taubenangriff: let's take 8514. In binary

0b0010 0001 0100 0010
regrouped:
0b001 0000101 000010

converts to: 

3 bit areaindex: 0b001 = 1 
7 bit islandID: 0b0000101 = 5
6 bit sessionID: 0b000010 = 2
```
```lua
for n = 1,2 do
  for m = 5,26 do
    print((n << 13)+(m << 6)+2)
  end
end
_test =8514
local t= {}
  t[1] = ((_test & 57344)>>13)
  t[2] = ((_test & 8128)>>6)
  t[3] = (_test & 15)
print(t[1],t[2],t[3])
_test =8514
local t= {}
  t[1] = ((_test & 0xE000)>>13)
  t[2] = ((_test & 0x1FC0)>>6)
  t[3] = (_test & 0xF)
print(t[1],t[2],t[3])
```
```lua
print(12884901925,(3<<32)+(37))
print(8589934626,(2<<32)+(34))
print('hand:',(2<<32)+34)
print('eimer:',(3<<32)+34)
print('kühlschrank:',(4<<32)+34)
print('hand:',(2<<32)+34)
SessionID = 2 --OW
ObjectID = 32 --Schiff/Kitkat
print('OW:',(SessionID<<32)+ObjectID)
SessionID = 3 --NW
print('NW:',(SessionID<<32)+ObjectID)
SessionID = 2 --OW
print('OW:',(SessionID<<32)+ObjectID)
```