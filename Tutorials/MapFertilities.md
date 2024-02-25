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
  - [FertilitySet](#fertilityset)
  - [dunno part 2](#dunno-part-2)
  - [Restrictions](#restrictions)

# Fertilities
[^1]
[^1]: Original by Hier0nimus; Got permission to copy this via discord. Rewritten and modified by me.
--Fertilities are defined for every island and depend on the type of island.
## Datamine
[^2]
In this section we take first a look at possible (vanilla) datasets, as a basis to learn which combinations might be possible. Datasets can be easy looked up at [a1800.net](http://a1800.net/). For further investigation it is given to always have the vanilla version.
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
[^3]
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
Looking at the [Example ^3](#example-3) `<ResourceSetCondition>` defines the conditions for this set.
### AllowedRegion
`<AllowedRegion>Moderate</AllowedRegion>` The region this set is used is in the moderate region, which is Old World and Cape. It is possible to add the New World, Arctic, New World and/or Enbesa here, this would make those fertilities also there available. 
### AllowedIslandDifficulty
`<AllowedIslandType>Normal;Starter</AllowedIslandType>` tells on which island types this set is used. `Normal` or `Starter`. The starter island is the one a harbor is build when choosing starting conditions "Harbour". Normal are the island which have the same size as the starter island but have some things less because starter islands are given some fixed things like oil and potatoes.
### AllowedIslandDifficulty
`<AllowedIslandDifficulty>Normal;Hard</AllowedIslandDifficulty>` tells on which diffifulty setting this fertilityset is used. This example will not be used when choosing the "easy" settings.
### AllowedResourceAmounts
`<AllowedResourceAmounts>Low</AllowedResourceAmounts>` Here we see another setting that is defined when you setup the game, the Allowed resources. When this setting is set to LOW, this fertilityset will be used. Otherwise if you would habe choosen PLENTY and the other I can not remember at the moment. This set will not be given to an island.
 ## FertilitySet
We see there 2 fertilities, Potato and Grain.
So, if this fertilityset is given to an island, that island will have potatoes and Grain as fertilities.
We now have analysed 1 of the 121 fertilitysets. Ever set has their own settings based on all the mentioned above proporties.
## dunno part 2
In your case there are I think a couple possibilities:
1: You overwrite every 121 fertilitysets removing the ones you do not want with a ModOp Type="remove". Leaving only 1  fertility in every set.
If you want to give yourself a bit less work, you could define which difficultysetting you will play and only adapt the ones that your difficultysetting would use. For example, only adapt the ones from the "Low" AllowedResourceAmounts. Do know that this Low Resource amount also affects Mines! And mines is a completly other path ... 😄
3: (Maybe the easiest) Remove ALL fertilitysets with a ModOp Type="remove" and then add 1 fertilityset for every type of fertility. Then you build them all up in combination with the right conditions.
## Restrictions
The reason is that there are a lot of fertilities. Only providing 1 fertility / island is really restrictive. If you would throw AI in the mix, that is just not going to work.
You could say that you have to conquer an island to get the fertility, but the limitation will be the randomly choosen fertilities by the game.
The reason there are at least 2 fertilities / island is because if you only have 1 fertility there is a big change that the game does not roll certain fertilities on ANY island.
And then... well... then you are in trouble. AI will also not advance because they do not have certain fertilities.
Unless you are ok with it that you need to use the fertility items to get a fertility. But AI do not use those.
You could say, "I'll just rerstart the game if I do not have a fertiliy on an island"
But... that would only work if you would already know what you will get in the Arctic, New World and Enbesa. The Old World you can see, but the other regions you only know later when you have already invested a lot of time into that game. You could use the "testmod" where you can enter every region from the start to see if all the islands provide the right fertilities. But that would be a lot of work if you need to restart over and over again untill you find the seed that gives you at least 1 fertility on every island in every region. If you do that, make sure to write down your seed every time and if you found the correct seed, RESTART the game WITHOUT the testmod. That mod breaks things in the game if you use it to actually play.