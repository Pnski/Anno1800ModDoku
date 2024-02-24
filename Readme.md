- [TextSources.TextSourcesRoots](Readme.md#TextSources.TextSourcesRoots (ts))
- [Game](Readme.md#game)
- [Session](Readme.md#session)

# net
```net.showOverlayUrl(URL:string)```
>url can be anything e.g. ```"www.google.de"```

```net.forceDeSync()```
>forces desync...

```net.suspendStorm()```
>anno goes offline

```net.resumeStorm()```
>anno goes online
# TextSources.TextSourcesRoots (ts)
## Area
```ts.Area.GetArea({SessionID=SID:int,AreaIndex=AID:int,IslandID=IID:int})```
>
```ts.Area.GetAreaFromID(ID:int16)```
> ID is the bitshifted integer of the SessionID, AreaIndex and IslandID combined. Returns the defined area as an object.
### CurrentSelectedArea (Current)
Effects the area your window is hovering over and displaying the Name of the Island.
```ts.Area.Current.CityName```
>Holds the current city name.

```ts.Area.Current.IsFireUnlocked```
>Boolean, gets if fires can take place, probably only relevant for OW where u can skip fires.

```ts.Area.Current.ID```
>Holds table with IslandID, AreaIndex, SessionID

```ts.Area.Current.KontorID```
>Hold table with AsyncObjectFlag, AreaID (see ID), EditorFlag, ObjectID, EditorChunkID

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

```ts.AreaManager.AreaFestival.GetRemainingDurationEstimation()```
>returns the eta of the current running festival in ms

```ts.AreaManager.AreaFestival.SetIncreasePool(Duration:int)```
>increases or (if negative value) decreases the duration of the current festival. its not in ms, testing and calculating didnt bring results as how it is calculated, inserting a big number results in a long festival
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
## Contracts
```ts.Contracts.IncreaseGoodXP(GUID:int,Amount:int)```
>increases or decreases the export volume of GUID by Amount

```ts.Contracts.FillPyramid()```
>fills the pyramid of Tobias with random stuff... when pyramid is empty can be done again

## Items
```ts.Item.SetCheatAllItems()```
>generates random around 80 items in current island storage with undefined distribution

```ts.Item.SetCheatItems(GUID:int)```
>Adds the Item with <GUID> to the island storage.
## Mods
```ts.Mods.GetModName(ModIONumber:int)```
> getModName(3058150) -> gives back console of taubenangriff, im unsure if its corresponding to the internal number of mod.io or the foldername, needs further testing.
## Newspaper
```ts.Newspaper.CreateNewspaper()```
>triggers new newspaper to be published in (5 min)

```ts.Newspaper.ShowLatestNewspaperUI()```
>Opens UI of latest Newspaper
## Online
```ts.Online.FirstPartySignedIn```
>returns a bool

```ts.Online.FirstPartyAvailability```
>returns a bool
## Participants
```ts.Participants.Highscore.HighscoreData.GetDifficultyFactor()```
>Returns the difficulty as a Factor eg. 1.1 as mentioned in the profile highscoredata, but not rounded.

```ts.Participants.Current.Profile.CompanyName```
>Returns the name of the current savegame, which is equivalent to the name of the folder in your accountdata.

```ts.Participants.GetReputationTo(Participant1:int, Participant2:int)```
>Returns the reputationvalue between the 2 participants as a value between 0-100
## Weather
```ts.Weather.SetChangeWind()```
>Changes wind direction to a random new one.

```ts.Weather.ForcePreset(WeatherPreset:number,WeatherEffectType:number)```
>changes the weather to the designated preset (u can let it snow in enbesa if u want)
## Selection
```ts.Selection.DestructSelected()```
>only works on buildings, removes them (no ruins).

```ts.Selection.SelectIslandKontor()```
>opens the contor menue from the current island

```ts.Selection.Object.Residence.SetCheatFill()```
>fills the current selected residence to maximum capacity
# game
```game.getCorporationTime()```
>get Session? time in ms

```game.environmentSetSnowDensity(Percent:float)```
>Sets the snow density in the ARCTIC (only) to int (0-1 with ',' instead of '.'). 0 is lowest but not gone...
everywhere else it just flickers snow for 1 gametick.

```game.environmentSetWindDir(Direction:int)```
>Changes wind direction to set direction 0 is NE 90 is NW etc.

```game.GUIManager.isUIStartUpPastSceneCreation()```
>returns a bool; with console probably always true
>from log: rdui::SendTelemetryMarker: UI-Flow: Startup Complete (A)
after that it always returns true, probably impossible to get a false with lua

```game.TextSourceManager.setDebugTextSource(EmbedString:string)```
> 
# MetaGameManager
```ts.MetaGameManager.GetActiveSessionGUIDOfPeerInt(Peer: int)```
>gets the current Session (Arctic, OW, NW, CT, Enbesa etc.) of the Player (number/peer), guess only usefull for MP.
# session
```session.toggleResidentView()```
>goes into first Person mode to current selected Building

```session.killGameObject()```
forces ruins to current selected Object (Player or NPC) or destroys ship. Does not Work on stuff like Emperor Ketemas buildings.

```session.getSessionGUID()```
>returns... a number
```session.forceWeather(Weather:string)```
>forces the weather of the current session to Weather
> Possible values:
> - "Snow"
> - "Rain"
> - "Apocalyptic"
> - "Default"
# system
```system.waitForGameTimeDelta(MS:int)```
>wait for MS before doing next action in script

session.selectNextObject(True)
speed.Up()
# io
```io.popen(command:string)```
>opens a CMD; normal path is your anno 1800 path; it can delete files though use with caution
# debug