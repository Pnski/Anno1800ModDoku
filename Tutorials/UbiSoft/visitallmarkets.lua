function marketVisitor()

    local markets
    while true do
        markets = session.getObjectGroupByProperty(735) -- market property. TODO: provide property enum
        if #markets > 1 then
            break
        end
        system.waitForGameTimeDelta(20000)       -- wait for 20s
    end

    markets[1]:select() -- select any market

    while true do
        session.selectNextObjectInWorld(true)    -- selects the next marketplace and moves the camera to it
        print("marketVisitor laeuft!\n")
        system.waitForGameTimeDelta(20000)       -- wait for 20s
    end
end

system.start(marketVisitor, "marketVisitor")     -- will be resumed by GameTick
