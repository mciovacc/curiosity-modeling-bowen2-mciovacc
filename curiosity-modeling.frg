#lang forge/froglet

// turn off visualization, was causing errors when we tried to run full pool
option run_sterling off

// some initial constraints needed to set for the deck to be valid
// exactly 8 cards in a deck
// at most 2 active evolutions
// at most 2 cards total that are either champion or heros cards
// no champions are hero or evolution version

// started by defining card properties

// actual card with properties
sig Card {
  rarity: one Rarity,
  cost: one ElixirCost,
  role: one Role,
  // may have a hero, evolution, both, or neither
  evolutionVersion: lone EvolutionVersion,
  heroVersion: lone HeroVersion
}

// create sig for versions
sig EvolutionVersion {}
sig HeroVersion {}

// A deck is defined by two boolean membership relations:
// chosenCards should only be true if card `c` is in the deck
// activeEvolutions should only be true if card `c` is currently evo version
sig Deck {
  chosenCards: func Card -> Boolean,
  activeEvolutions: func Card -> Boolean
}

// property is rarity w/ 5 values
abstract sig Rarity {}
one sig Common, Rare, Epic, Legendary, ChampionRarity extends Rarity {}

// each card has a role which is what the card is best as and can be used for
// opportunity to expand in the future by building a deck with of each of these, 
// or a deck with good cominations of them, like sometimes a deck with 2 win
// conditions can be op
abstract sig Role {}
one sig WinCondition, HighDamageSpell, LowDamageSpell,
        AirTankKiller, GroundTankKiller,
        AntiAirSplashDamage, AntiGroundSplashDamage,
        MiniTank extends Role {}

// based on forge not being good with numerical values from the handout, 
//we model elixir cost as 10 discrete values
abstract sig ElixirCost {}
one sig E1, E2, E3, E4, E5, E6, E7, E8, E9, E10 extends ElixirCost {}

// model boolean values, necessary for forge not a builtin we found
abstract sig Boolean {}
one sig True, False extends Boolean {}

// set up rules for the properties we said earlier

pred globalCardRules {
  // no champions have a hero or evolution version
  all c: Card |
    c.rarity = ChampionRarity implies
      no c.evolutionVersion and no c.heroVersion
}

// add helper predicates

pred isChampion[c: Card] {
  c.rarity = ChampionRarity
}

pred hasEvolution[c: Card] {
  some c.evolutionVersion
}

pred isHeroDesignated[c: Card] {
  some c.heroVersion
}

// set up constraints for the deck we discussed earlier
pred validDeck[d: Deck] {
  // 8 cards in deck
  # { c: Card | d.chosenCards[c] = True } = 8

  // evolutions are a subset of cards, not all of them
  all c: Card | d.activeEvolutions[c] = True implies d.chosenCards[c] = True

  // only cards with evos can be actively evolved
  all c: Card |
    d.activeEvolutions[c] = True implies hasEvolution[c]

  // only 2 evos allowed
  # { c: Card | d.activeEvolutions[c] = True } <= 2

  // at most 2 heros or champions allowed
  # {
    c: Card |
      d.chosenCards[c] = True and (isChampion[c] or isHeroDesignated[c])
  } <= 2
}

// pred to check if a valid deck exists, caused problems so we can comment out at times
pred someValidDeckExists {
  globalCardRules
  some d: Deck | validDeck[d]
}

// set number of cards
pred currentCardPoolSize {
  #Card = 116
}

// also can comment this out, but it can form a deck with the card pool we use
run someValidDeckExists for 5 Int, 20 Card, exactly 1 Deck, 10 EvolutionVersion, 10 HeroVersion
