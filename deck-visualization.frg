#lang forge/froglet
option run_sterling "deck-vis.js"

sig Card {}
one sig Archers, Arrows, BabyDragon, Balloon, Bandit, BarbarianBarrel, BarbarianHut, Barbarians, Bats, BattleHealer, BattleRam, Berserker, Bomber, BombTower, BossBandit, Bowler, Cannon, CannonCart, Clone, DartGoblin, DarkPrince, Earthquake, EliteBarbarians, ElectroDragon, ElectroGiant, ElectroSpirit, ElectroWizard, ElixirCollector, ElixirGolem, Executioner, FireSpirit, Fireball, Firecracker, Fisherman, FlyingMachine, Freeze, Giant, GiantSkeleton, GiantSnowball, GoblinBarrel, GoblinCage, GoblinCurse, GoblinDemolisher, GoblinDrill, GoblinGang, GoblinGiant, GoblinMachine, Goblins, Goblinstein, GoldenKnight, Golem, Graveyard, Guards, HealSpirit, HogRider, Hunter, IceGolem, IceSpirit, IceWizard, InfernoDragon, InfernoTower, Knight, LavaHound, Lightning, LittlePrince, Lumberjack, MagicArcher, MegaKnight, MegaMinion, MightyMiner, Miner, MiniPEKKA, MinionHorde, Minions, Mirror, Monk, MotherWitch, Musketeer, NightWitch, PEKKA, Phoenix, Poison, Princess, Prince, Rage, RamRider, Rascals, Rocket, RoyalDelivery, RoyalGiant, RoyalGhost, RoyalHogs, RoyalRecruits, RuneGiant, SkeletonArmy, SkeletonBarrel, SkeletonDragons, SkeletonKing, Skeletons, Sparky, SpearGoblins, SpiritEmpress, SuspiciousBush, Tesla, TheLog, ThreeMusketeers, Tombstone, Tornado, Valkyrie, Vines, WallBreakers, Witch, Wizard, XBow, Zap, Zappies extends Card {}

one sig Deck {
  slot1: one Card,
  slot2: one Card,
  slot3: one Card,
  slot4: one Card,
  slot5: one Card,
  slot6: one Card,
  slot7: one Card,
  slot8: one Card
}

pred validDeckVisual[d: Deck] {
  d.slot1 != d.slot2
  d.slot1 != d.slot3
  d.slot1 != d.slot4
  d.slot1 != d.slot5
  d.slot1 != d.slot6
  d.slot1 != d.slot7
  d.slot1 != d.slot8
  d.slot2 != d.slot3
  d.slot2 != d.slot4
  d.slot2 != d.slot5
  d.slot2 != d.slot6
  d.slot2 != d.slot7
  d.slot2 != d.slot8
  d.slot3 != d.slot4
  d.slot3 != d.slot5
  d.slot3 != d.slot6
  d.slot3 != d.slot7
  d.slot3 != d.slot8
  d.slot4 != d.slot5
  d.slot4 != d.slot6
  d.slot4 != d.slot7
  d.slot4 != d.slot8
  d.slot5 != d.slot6
  d.slot5 != d.slot7
  d.slot5 != d.slot8
  d.slot6 != d.slot7
  d.slot6 != d.slot8
  d.slot7 != d.slot8
}

run {
  some d: Deck | validDeckVisual[d]
} for exactly 1 Deck, exactly 116 Card
