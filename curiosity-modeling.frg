#lang forge/froglet

// -----------------------------------------------------------------------------
// Clash Royale deck-modeling scaffold for CSCI 1710 (Forge/Froglet)
//
// Goal for this first project stage:
// Represent cards and decks, then constrain what "valid deck" means in a way
// that is faithful to your stated Clash Royale rules.
//
// We currently model:
// 1) Exactly 8 cards in a deck
// 2) At most 2 active evolutions
// 3) At most 2 cards total that are either:
//    - champion rarity, OR
//    - hero-designated cards
//
// This file is intentionally an outline/model foundation, with comments and
// helpers that make it easy to extend in later project parts.
// -----------------------------------------------------------------------------

// ---------------------------
// Domain enums / categories
// ---------------------------

// Card rarity in Clash Royale.
abstract sig Rarity {}
one sig Common, Rare, Epic, Legendary, ChampionRarity extends Rarity {}

// Deck role taxonomy requested for this project.
// For now, each card is exactly one role.
abstract sig Role {}
one sig WinCondition, HighDamageSpell, LowDamageSpell,
        AirTankKiller, GroundTankKiller,
        AntiAirSplashDamage, AntiGroundSplashDamage,
        MiniTank extends Role {}

// Froglet outline-friendly elixir scale.
// (This avoids needing integer arithmetic in early modeling.)
abstract sig ElixirCost {}
one sig E1, E2, E3, E4, E5, E6, E7, E8, E9, E10 extends ElixirCost {}

// In Froglet, "set-valued" fields are modeled as boolean functions.
abstract sig Boolean {}
one sig True, False extends Boolean {}

// ---------------------------
// Core entities
// ---------------------------

// A "card" here refers to one CR card definition in the global card pool.
//
// Important modeling choice:
// - `rarity` is intrinsic and always one of the five rarity values.
// - `evolutionVersion` and `heroVersion` are side designations represented as
//   optional links:
//   * present  => card supports that designation
//   * absent   => card does not support it
//
// This mirrors your clarification that evolution/hero are not rarities.
sig Card {
  rarity: one Rarity,
  cost: one ElixirCost,
  role: one Role,

  // Optional versions:
  // - evolution: this card has an evolution variant if present
  // - hero: this card has a hero variant if present
  evolutionVersion: lone EvolutionVersion,
  heroVersion: lone HeroVersion
}

sig EvolutionVersion {}
sig HeroVersion {}

// A deck is defined by two boolean membership relations:
// - chosenCards[c] = True iff card `c` is in the 8-card deck
// - activeEvolutions[c] = True iff card `c` is currently activated as an evo
//
// Using booleans (instead of `set` fields) matches Froglet restrictions.
sig Deck {
  chosenCards: func Card -> Boolean,
  activeEvolutions: func Card -> Boolean
}

// ---------------------------
// Global card rules
// ---------------------------

pred globalCardRules {
  // "No champions have a hero or evolution version."
  all c: Card |
    c.rarity = ChampionRarity implies
      no c.evolutionVersion and no c.heroVersion
}

// ---------------------------
// Helper predicates/functions
// ---------------------------

pred isChampion[c: Card] {
  c.rarity = ChampionRarity
}

pred hasEvolution[c: Card] {
  some c.evolutionVersion
}

pred isHeroDesignated[c: Card] {
  some c.heroVersion
}

// ---------------------------
// Deck validity definition
// ---------------------------

pred validDeck[d: Deck] {
  // Exactly 8 cards in a Clash Royale deck.
  # { c: Card | d.chosenCards[c] = True } = 8

  // Active evolutions are a subset of chosen cards.
  all c: Card | d.activeEvolutions[c] = True implies d.chosenCards[c] = True

  // Every active evolution must be on a card that can evolve.
  all c: Card |
    d.activeEvolutions[c] = True implies hasEvolution[c]

  // At most 2 active evolutions.
  # { c: Card | d.activeEvolutions[c] = True } <= 2

  // At most 2 cards total that are champion OR hero-designated.
  // Examples allowed:
  // - 2 champions, 0 heroes
  // - 1 champion, 1 hero
  // - 0 champions, 2 heroes
  // Evolutions are counted separately by the constraint above.
  # {
    c: Card |
      d.chosenCards[c] = True and (isChampion[c] or isHeroDesignated[c])
  } <= 2
}

// ---------------------------
// Useful checks/runs
// ---------------------------

// Can Forge find at least one valid deck?
pred someValidDeckExists {
  globalCardRules
  some d: Deck | validDeck[d]
}

// Optional helper when you want to model the current live card pool size.
// Keep this predicate separate so you can turn it on/off as card counts change.
pred currentCardPoolSize {
  #Card = 121
}

// ---------------------------
// Card-data input scaffold
// ---------------------------

// Practical way to "feed in" the real CR card catalog:
// 1) Add one declaration per concrete card using `extends Card`.
// 2) Assign each card's rarity/cost/role and side designations.
//
// Example pattern (leave commented until you add real cards):
// one sig Knight extends Card {} {
//   rarity = Common
//   cost = E3
//   role = MiniTank
//   no evolutionVersion
//   no heroVersion
// }
//
// one sig ArcherQueen extends Card {} {
//   rarity = ChampionRarity
//   cost = E5
//   role = WinCondition
//   no evolutionVersion
//   no heroVersion
// }
//
// Once full data is loaded, run with:
//   run { globalCardRules some d: Deck | validDeck[d] and currentCardPoolSize }
// and a scope that includes enough Int bitwidth for 121 (typically 8 Int).

// Starter commands for exploration.
run someValidDeckExists for 5 Int, 20 Card, 10 Deck, 10 EvolutionVersion, 10 HeroVersion
run {
  globalCardRules
  some c: Card | c.rarity = ChampionRarity and (some c.evolutionVersion or some c.heroVersion)
} for 5 Int, 20 Card, 10 EvolutionVersion, 10 HeroVersion
