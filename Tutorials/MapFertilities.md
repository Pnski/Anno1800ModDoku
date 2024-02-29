# Table of Contents
- [Table of Contents](#table-of-contents)
- [Fertilities](#fertilities)
  - [Datamine](#datamine)
  - [Fertility Sets](#fertility-sets)
    - [Example](#example)
  - [Generation](#generation)
    - [ResourceSetCondition](#resourcesetcondition)
    - [AllowedRegion](#allowedregion)
    - [AllowedIslandDifficulty](#allowedislanddifficulty)
    - [AllowedIslandDifficulty](#allowedislanddifficulty-1)
    - [AllowedResourceAmounts](#allowedresourceamounts)
  - [Modding Fertility Sets](#modding-fertility-sets)
    - [Restrictions](#restrictions)
    - [Removing Fertilities](#removing-fertilities)

# Fertilities
Short introduction on how fertilities are determined and a little how they are included into the map generation[^1].
[^1]: Original by Hier0nimus; Got permission to copy this via discord. Rewritten and modified by me.
--Fertilities are defined for every island and depend on the type of island.
## Datamine
In this section we take first a look at possible (vanilla) datasets[^2], as a basis to learn which combinations might be possible. Datasets can be easy looked up at [a1800.net](http://a1800.net/). For further investigation it is given to always have the vanilla version.
<div align="center">
    <table>
        <tr><td>
            Types of islands:
            <ul><li>Normal</li>
            <li>Starter</li>
            <li>Decoration</li>
            <li>ThirdParty</li>
            <li>PirateIsland</li>
            <li>CliffIsland</li></ul>
        </td><td>
            Difficulty of islands:
            <ul><li>Normal</li>
            <li>Hard</li></ul>
            Resource Amount:
            <ul><li>Low</li>
            <li>Medium</li>
            <li>High</li></ul>
        </td></tr>
    </table>
</div>

[^2]: Dataset: IslandType (Id: 431); IslandDifficulty (Id: 429); ResourceAmount (Id: 433)

## Fertility Sets
Taking a look inside the assets.xml or on [a1800.net](http://a1800.net/?itemSearch=FertilitySet&prevSearch=) shows that there are 121 different fertily sets. Every set has its own combinations of the possible datasets, combined with a certain amount of fertilities.
### Example
For this example we use fertility "Set 1" with Guid 141508[^3] with potatoe and grain fertility.
[^3]: [a1800.net](http://a1800.net/?itemSearch=141508)
```xml
<Asset>
    <Template>FertilitySet</Template>
    <Values>
        <Standard>
            <GUID>141508</GUID>
            <Name>Set 1</Name>
        </Standard>
        <ResourceSetCondition>
            <AllowedRegion>Moderate</AllowedRegion>
            <AllowedIslandType>Normal;Starter</AllowedIslandType>
            <AllowedIslandDifficulty>Normal;Hard</AllowedIslandDifficulty>
            <AllowedResourceAmounts>Low</AllowedResourceAmounts>
        </ResourceSetCondition>
        <FertilitySet>
            <Fertilities>
                <Item>
                    <Fertility>1010569</Fertility>
                    <!--Potato Fertility-->
                </Item>
                <Item>
                    <Fertility>1010571</Fertility>
                    <!--Grain Fertility-->
                </Item>
            </Fertilities>
        </FertilitySet>
    </Values>
</Asset>
```
## Generation
Depending on the seed and difficultysettings at the start of the game are islands and their respective fertilities. Choosing a fixed setup means also fixed fertilities. After entering the new game, the islands and fertilities are predetermined and cannot be changed unless the player is starting a new game.
Which islands the game chooses depends on the difficulty settings choosen at the setup of the game. Each setup combination has its own map pool to chose from, thus it uses the pool from the `fertilitysets`.
>A starter island for example always has potatoes and oil.
### ResourceSetCondition
Looking at the [Example](#example-3) `<ResourceSetCondition>` defines the conditions for this set.
### AllowedRegion
`<AllowedRegion>Moderate</AllowedRegion>` The region this set is used is in the moderate region, which is Old World and Cape. It is possible to add the New World, Arctic, New World and/or Enbesa here, this would make those fertilities also there available. 
### AllowedIslandType
`<AllowedIslandType>Normal;Starter</AllowedIslandType>` tells on which island types this set is used. `Normal` or `Starter`. The starter island is the one a harbor is build when choosing starting conditions "Harbour". Normal are the island which have the same size as the starter island but have some things less because starter islands are given some fixed things like oil and potatoes.
### AllowedIslandDifficulty
`<AllowedIslandDifficulty>Normal;Hard</AllowedIslandDifficulty>` tells on which diffifulty setting this fertilityset is used.
### AllowedResourceAmounts
`<AllowedResourceAmounts>Low</AllowedResourceAmounts>` Here we see another setting that is defined when you setup the game, the Allowed resources. When this setting is set to LOW, this fertilityset will be used. Otherwise if you would habe choosen PLENTY and the other I can not remember at the moment. This set will not be given to an island.
## Modding Fertility Sets
After having an idea, its up to the modder to be active and modify the fertilities as he pleases.
### Restrictions
Providing only one fertility per island for a harder experience is very restrictive and might, if combined with AI player(s), break the game. Without the right fertility on the wrong setup, the player cannot advance, without (passive) trade, to te next population tier. The fertilities are chosen depending on the seed, so there are probably seeds that might work and others that will not work. Depending on the seed there might even be games without a specific needed fertility at all. The AI will not try to compensate these absent fertilities with specialists like a human player might do.
### Removing Fertilities
Editing every 121 possible fertilityset is possible, and best be done with for example:`<ModOp Type="remove" Path="//Assets/Values/FertilitySet/Fertilities/Item/Fertility[GUID = 1010571]">` this would remove *_EVERY_* grain fertility from every fertility set. Depending on what the mod shall achieve it might be better to edit certain sets instead of every.
