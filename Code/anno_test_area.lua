local function testArea(_index)
    if #(ts.Area.GetAreaFromID(_index).CityName) > 0 then
        print(_index.." =",ts.Area.GetAreaFromID(_index).CityName,ts.Area.GetAreaFromID(_index).ID)
    end
end

a1800 = {
    testArea = testArea
}

print("loaded",1)