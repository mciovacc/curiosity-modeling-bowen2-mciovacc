#lang forge/froglet

open "../curiosity-modeling.frg"

// Test process:
// 1) Define helper predicates that describe edge case situations
// 2) Assert those situations are impossible when core model holds
// 3) Add concrete example instances so behavior is easier to check

// If globalCardRules holds, this asks whether a champion can still carry a
// hero or evolution designation, which should not be the case
pred championHasHeroOrEvolutionInsideGlobalRules {
    globalCardRules
    some c: Card |
        c.rarity = ChampionRarity and
        (some c.evolutionVersion or some c.heroVersion)
}

// checks that champion, evolution, and hero helper predicates can be satisfied
// with multiple cards
pred helperPredicatesAgree {
    some disj c1, c2, c3: Card | {
        isChampion[c1]
        hasEvolution[c2]
        isHeroDesignated[c3]
    }
}

// Lightweight wrapper to make assertions easier to read
pred helperPredicates {
    helperPredicatesAgree
}

// Illegal deck pattern, a card is actively evolved but is not chosen in the deck
pred activeEvolutionOutsideChosenInsideValidDeck {
    some d: Deck | {
        validDeck[d]
        some c: Card |
            d.activeEvolutions[c] = True and
            d.chosenCards[c] = False
    }
}

// Illegal deck pattern would be when a card is actively evolved but has no evolution version
pred activeEvolutionWithoutVersionInsideValidDeck {
    some d: Deck | {
        validDeck[d]
        some c: Card |
            d.activeEvolutions[c] = True and
            no c.evolutionVersion
    }
}

// Illegal deck patter for more than 2 active evolutions
pred tooManyActiveEvolutionsInsideValidDeck {
    some d: Deck | {
        validDeck[d]
        # { c: Card | d.activeEvolutions[c] = True } > 2
    }
}

// Illegal deck pattern for more than 2 total cards that are champion OR hero
pred tooManyChampionOrHeroInsideValidDeck {
    some d: Deck | {
        validDeck[d]
        # {
            c: Card |
                d.chosenCards[c] = True and
                (isChampion[c] or isHeroDesignated[c])
        } > 2
    }
}

// Illegal deck pattern for chosen card count is not exactly 8
pred wrongChosenCardCountInsideValidDeck {
    some d: Deck | {
        validDeck[d]
        # { c: Card | d.chosenCards[c] = True } != 8
    }
}

// need to check validDeck again before checking rules fully
pred modelChecks {
    someValidDeckExists
}


// verify champion cards cannot have hero/evolution versions
test suite for globalCardRules {
    // positive example where champion has no hero or evolution and non-champion can have one
    example globalRulesAllowValidChampionSetup is {globalCardRules} for {
        Card = `Champ + `Flex
        Rarity = `Common + `Rare + `Epic + `Legendary + `ChampionRarity
        Common = `Common
        Rare = `Rare
        Epic = `Epic
        Legendary = `Legendary
        ChampionRarity = `ChampionRarity
        Role = `WinCondition + `HighDamageSpell + `LowDamageSpell + `AirTankKiller +
               `GroundTankKiller + `AntiAirSplashDamage +
               `AntiGroundSplashDamage + `MiniTank
        WinCondition = `WinCondition
        HighDamageSpell = `HighDamageSpell
        LowDamageSpell = `LowDamageSpell
        AirTankKiller = `AirTankKiller
        GroundTankKiller = `GroundTankKiller
        AntiAirSplashDamage = `AntiAirSplashDamage
        AntiGroundSplashDamage = `AntiGroundSplashDamage
        MiniTank = `MiniTank
        ElixirCost = `E1 + `E2 + `E3 + `E4 + `E5 + `E6 + `E7 + `E8 + `E9 + `E10
        E1 = `E1
        E2 = `E2
        E3 = `E3
        E4 = `E4
        E5 = `E5
        E6 = `E6
        E7 = `E7
        E8 = `E8
        E9 = `E9
        E10 = `E10
        EvolutionVersion = `EV0
        HeroVersion = `HV0
        rarity = `Champ -> ChampionRarity + `Flex -> Rare
        cost = `Champ -> E4 + `Flex -> E3
        role = `Champ -> MiniTank + `Flex -> WinCondition
        evolutionVersion = `Flex -> `EV0
        heroVersion = `Flex -> `HV0
    }

    // negative example: champion cannot carry hero or evolution designation
    example globalRulesRejectChampionWithSpecialDesignation is {not globalCardRules} for {
        Card = `Champ
        Rarity = `Common + `Rare + `Epic + `Legendary + `ChampionRarity
        Common = `Common
        Rare = `Rare
        Epic = `Epic
        Legendary = `Legendary
        ChampionRarity = `ChampionRarity
        Role = `WinCondition + `HighDamageSpell + `LowDamageSpell + `AirTankKiller +
               `GroundTankKiller + `AntiAirSplashDamage +
               `AntiGroundSplashDamage + `MiniTank
        WinCondition = `WinCondition
        HighDamageSpell = `HighDamageSpell
        LowDamageSpell = `LowDamageSpell
        AirTankKiller = `AirTankKiller
        GroundTankKiller = `GroundTankKiller
        AntiAirSplashDamage = `AntiAirSplashDamage
        AntiGroundSplashDamage = `AntiGroundSplashDamage
        MiniTank = `MiniTank
        ElixirCost = `E1 + `E2 + `E3 + `E4 + `E5 + `E6 + `E7 + `E8 + `E9 + `E10
        E1 = `E1
        E2 = `E2
        E3 = `E3
        E4 = `E4
        E5 = `E5
        E6 = `E6
        E7 = `E7
        E8 = `E8
        E9 = `E9
        E10 = `E10
        EvolutionVersion = `EV0
        HeroVersion = `HV0
        rarity = `Champ -> ChampionRarity
        cost = `Champ -> E5
        role = `Champ -> WinCondition
        evolutionVersion = `Champ -> `EV0
        heroVersion = `Champ -> `HV0
    }

    assert globalCardRules is sat for exactly 2 Card, exactly 1 EvolutionVersion, exactly 1 HeroVersion
    assert {globalCardRules and championHasHeroOrEvolutionInsideGlobalRules} is unsat for exactly 2 Card, exactly 1 EvolutionVersion, exactly 1 HeroVersion
}

// helper predicates should be independently realizable.
test suite for helperPredicates {
    assert {helperPredicates and helperPredicatesAgree} is sat for exactly 3 Card, exactly 1 EvolutionVersion, exactly 1 HeroVersion
}


// validate full deck constraints with one passing and one failing concrete ex
test suite for validDeck {
    // positive example w/ exactly 8 chosen, at most 2 active evolutions, at most 2 champion/hero total.
    example validDeckConcretePass is {some d: Deck | validDeck[d]} for {
        Boolean = `T + `F
        True = `T
        False = `F
        Card = `C0 + `C1 + `C2 + `C3 + `C4 + `C5 + `C6 + `C7
        Deck = `D0
        Rarity = `Common + `Rare + `Epic + `Legendary + `ChampionRarity
        Common = `Common
        Rare = `Rare
        Epic = `Epic
        Legendary = `Legendary
        ChampionRarity = `ChampionRarity
        Role = `WinCondition + `HighDamageSpell + `LowDamageSpell + `AirTankKiller +
               `GroundTankKiller + `AntiAirSplashDamage +
               `AntiGroundSplashDamage + `MiniTank
        WinCondition = `WinCondition
        HighDamageSpell = `HighDamageSpell
        LowDamageSpell = `LowDamageSpell
        AirTankKiller = `AirTankKiller
        GroundTankKiller = `GroundTankKiller
        AntiAirSplashDamage = `AntiAirSplashDamage
        AntiGroundSplashDamage = `AntiGroundSplashDamage
        MiniTank = `MiniTank
        ElixirCost = `E1 + `E2 + `E3 + `E4 + `E5 + `E6 + `E7 + `E8 + `E9 + `E10
        E1 = `E1
        E2 = `E2
        E3 = `E3
        E4 = `E4
        E5 = `E5
        E6 = `E6
        E7 = `E7
        E8 = `E8
        E9 = `E9
        E10 = `E10
        EvolutionVersion = `EV0 + `EV1
        HeroVersion = `HV0
        rarity =
            `C0 -> ChampionRarity +
            `C1 -> Rare + `C2 -> Epic + `C3 -> Common + `C4 -> Legendary +
            `C5 -> Rare + `C6 -> Common + `C7 -> Epic
        cost =
            `C0 -> E5 + `C1 -> E3 + `C2 -> E4 + `C3 -> E2 +
            `C4 -> E6 + `C5 -> E3 + `C6 -> E1 + `C7 -> E4
        role =
            `C0 -> WinCondition + `C1 -> MiniTank + `C2 -> GroundTankKiller +
            `C3 -> AntiAirSplashDamage + `C4 -> WinCondition +
            `C5 -> HighDamageSpell + `C6 -> LowDamageSpell +
            `C7 -> AntiGroundSplashDamage
        evolutionVersion = `C1 -> `EV0 + `C2 -> `EV1
        heroVersion = `C4 -> `HV0
        chosenCards =
            `D0 -> `C0 -> True + `D0 -> `C1 -> True + `D0 -> `C2 -> True + `D0 -> `C3 -> True +
            `D0 -> `C4 -> True + `D0 -> `C5 -> True + `D0 -> `C6 -> True + `D0 -> `C7 -> True
        activeEvolutions =
            `D0 -> `C0 -> False + `D0 -> `C1 -> True + `D0 -> `C2 -> True + `D0 -> `C3 -> False +
            `D0 -> `C4 -> False + `D0 -> `C5 -> False + `D0 -> `C6 -> False + `D0 -> `C7 -> False
    }

    // negative example which this tries to activate evolution on a non-evolution card.
    example validDeckRejectsActiveEvolutionWithoutCardEvolution is {not (some d: Deck | validDeck[d])} for {
        Boolean = `T + `F
        True = `T
        False = `F
        Card = `C0 + `C1 + `C2 + `C3 + `C4 + `C5 + `C6 + `C7
        Deck = `D0
        Rarity = `Common + `Rare + `Epic + `Legendary + `ChampionRarity
        Common = `Common
        Rare = `Rare
        Epic = `Epic
        Legendary = `Legendary
        ChampionRarity = `ChampionRarity
        Role = `WinCondition + `HighDamageSpell + `LowDamageSpell + `AirTankKiller +
               `GroundTankKiller + `AntiAirSplashDamage +
               `AntiGroundSplashDamage + `MiniTank
        WinCondition = `WinCondition
        HighDamageSpell = `HighDamageSpell
        LowDamageSpell = `LowDamageSpell
        AirTankKiller = `AirTankKiller
        GroundTankKiller = `GroundTankKiller
        AntiAirSplashDamage = `AntiAirSplashDamage
        AntiGroundSplashDamage = `AntiGroundSplashDamage
        MiniTank = `MiniTank
        ElixirCost = `E1 + `E2 + `E3 + `E4 + `E5 + `E6 + `E7 + `E8 + `E9 + `E10
        E1 = `E1
        E2 = `E2
        E3 = `E3
        E4 = `E4
        E5 = `E5
        E6 = `E6
        E7 = `E7
        E8 = `E8
        E9 = `E9
        E10 = `E10
        EvolutionVersion = `EV0
        HeroVersion = `HV0
        rarity =
            `C0 -> Rare + `C1 -> Rare + `C2 -> Epic + `C3 -> Common +
            `C4 -> Legendary + `C5 -> Rare + `C6 -> Common + `C7 -> Epic
        cost =
            `C0 -> E3 + `C1 -> E3 + `C2 -> E4 + `C3 -> E2 +
            `C4 -> E6 + `C5 -> E3 + `C6 -> E1 + `C7 -> E4
        role =
            `C0 -> WinCondition + `C1 -> MiniTank + `C2 -> GroundTankKiller +
            `C3 -> AntiAirSplashDamage + `C4 -> WinCondition +
            `C5 -> HighDamageSpell + `C6 -> LowDamageSpell +
            `C7 -> AntiGroundSplashDamage
        evolutionVersion = `C1 -> `EV0
        heroVersion = `C0 -> `HV0
        chosenCards =
            `D0 -> `C0 -> True + `D0 -> `C1 -> True + `D0 -> `C2 -> True + `D0 -> `C3 -> True +
            `D0 -> `C4 -> True + `D0 -> `C5 -> True + `D0 -> `C6 -> True + `D0 -> `C7 -> True
        activeEvolutions =
            `D0 -> `C0 -> True + `D0 -> `C1 -> False + `D0 -> `C2 -> False + `D0 -> `C3 -> False +
            `D0 -> `C4 -> False + `D0 -> `C5 -> False + `D0 -> `C6 -> False + `D0 -> `C7 -> False
    }

    assert {some d: Deck | validDeck[d]} is sat for exactly 8 Card, exactly 1 Deck, exactly 2 EvolutionVersion, exactly 1 HeroVersion
    assert {some d: Deck | validDeck[d]} and wrongChosenCardCountInsideValidDeck is unsat for exactly 10 Card, exactly 1 Deck
    assert {some d: Deck | validDeck[d]} and activeEvolutionOutsideChosenInsideValidDeck is unsat for exactly 10 Card, exactly 1 Deck
    assert {some d: Deck | validDeck[d]} and activeEvolutionWithoutVersionInsideValidDeck is unsat for exactly 10 Card, exactly 1 Deck
    assert {some d: Deck | validDeck[d]} and tooManyActiveEvolutionsInsideValidDeck is unsat for exactly 10 Card, exactly 1 Deck
    assert {some d: Deck | validDeck[d]} and tooManyChampionOrHeroInsideValidDeck is unsat for exactly 10 Card, exactly 1 Deck
}

// final checks for model, make sure predicates hold together for the pool of
// card we set up
test suite for modelChecks {
    assert {modelChecks and someValidDeckExists} is sat for exactly 20 Card, exactly 1 Deck, exactly 10 EvolutionVersion, exactly 10 HeroVersion
    assert {modelChecks and currentCardPoolSize} is sat for exactly 116 Card
    assert {modelChecks and currentCardPoolSize} is unsat for exactly 115 Card
}
