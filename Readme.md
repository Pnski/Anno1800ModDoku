# TextSources.TextSourcesRoots (ts)
## Area
### CurrentSelectedArea (Current)
Effects the area your window is hovering over and displaying the Name of the Island.
```ts.Area.Current.CityName```
>Holds the current city name.

```ts.Area.Current.IsFireUnlocked```
>Boolean, gets if fires can take place, probably only relevant for OW where u can skip fires.

```ts.Area.Current.ID```
>Holds table with IslandID, AreaIndex, SessionID

```ts.Area.Current.Economy.SetCheatItem(GUID:Int)```
>Adds the Item with _GUID_ to the island storage.

```ts.Area.Current.AddAmount(GUID:Int, Amount:Int)```
```ts.Area.Current.AddAmount(Amount:Int)```
>Adds (or substracts) either only the amount for the GUID or for every unlocked source to the island storage.

```ts.Area.Current.Economy.SetCheatChangeWorkforceNet(500:Boolean)```
>True -> adds 500 workforce (every tier)
>False -> substracts 500 workforce (every tier)

```ts.Area.Current.Economy.ClearIslandStorage()```
>Wipes all goods of current island...
## AreaManager
```ts.AreaManager.AreaFestival.SetTriggerFestival()```
>triggers random festival

```ts.AreaManager.AreaFestival.SetStopFestival()```
>stops current festival
## AreaPopulation
```ts.AreaPopulation.PopulationCount```
>gives the current Population

```ts.AreaPopulation.SetFillAllResidencesOnIsland()```
>fills all residences to maximum
## AreaResidenceConsumption
```ts.AreaResidenceConsuption.GetIsDistributionPaused(GUID: int, Population_GUID:int)```
>returns true if selected good is paused.
## Cheat
```ts.Cheat.GlobalCheats.ToggleUpgradeCheck()```
>Everything? is instant upgradeable.

```ts.Cheat.GlobalCheats.ToggleSuperShipSpeed()```
>Enables/Disables all ships + 100 movementspeed

```ts.Cheat.GlobalCheats.ToggleIgnoreBuildingCosts()```
>u can go below 0 gold and still build

```ts.Cheat.GlobalCheats.ToggleIgnoreFertilities()```
>adds EVERY possible fertility to all islands.

```ts.Cheat.GlobalCheats.ToggleLOSDebugView()```
>makes stuff green around a selected building:Visible LineOfSight
## Items
```ts.Item.SetCheatAllItems()```
>generates random around 80 items in current island storage with undefined distribution

```ts.Item.SetCheatItems(GUID:int)```
>Adds the Item with <GUID> to the island storage.
## Newspaper
```ts.Newspaper.CreateNewspaper()```
>triggers new newspaper to be published in (5 min)

```ts.Newspaper.ShowLatestNewspaperUI()```
>Opens UI of latest Newspaper
## Weather
```ts.Weather.SetChangeWind()```
>Changes wind direction to a random new one.

```game.environmentSetWindDir(Direction:int)```
>Changes wind direction to set direction 0 is NE 90 is NW etc.
# game
```game.getCorporationTime()```
>get Session? time in ms

```game.environmentSetSnowDensity(Percent:float)```
>Sets the snow density in the ARCTIC (only) to int (0-1 with ',' instead of '.'). 0 is lowest but not gone...
everywhere else it just flickers snow for 1 gametick.
# session
```session.toggleResidentView()```
>goes into first Person mode to current selected Building

```session.killGameObject()```
forces ruins to current selected Object (Player or NPC) or destroys ship. Does not Work on stuff like Emperor Ketemas buildings.