# TextSources.TextSourcesRoots (ts)
## Area
### CurrentSelectedArea (Current)
Effects the area your window is hovering over and displaying the Name of the Island.
```ts.Area.Current.CityName```

Holds the current city name.

```ts.Area.Current.IsFireUnlocked```

Boolean, gets if fires can take place, probably only relevant for OW where u can skip fires.

```ts.Area.Current.ID```

Holds table with IslandID, AreaIndex, SessionID

```ts.Area.Current.Economy.SetCheatItem(GUID:Int)```

Adds the Item with <GUID> to the island storage.

```TextSources.TextSourcesRoots.Area.Current.AddAmount(GUID:Int, Amount:Int)```
```TextSources.TextSourcesRoots.Area.Current.AddAmount(Amount:Int)```

Adds (or substracts) either only the amount for the GUID or for every unlocked source to the island storage.

```ts.Area.Current.Economy.SetCheatChangeWorkforceNet(500:Boolean)```

True -> adds 500 workforce (every tier)
False -> substracts 500 workforce (every tier)

```ts.Area.Current.Economy.ClearIslandStorage()```

Wipes all goods of current island...