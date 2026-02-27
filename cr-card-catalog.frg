#lang forge/froglet
open "curiosity-modeling.frg"

// This section is generated from `cr-cards.csv` (116 active cards).
// Because Froglet does not support sig-body constraints, concrete card
// identities are declared as singleton sigs and all field assignments are
// centralized in `cardCatalogData`

one sig Archers, Arrows, BabyDragon, Balloon, Bandit, BarbarianBarrel, BarbarianHut, Barbarians, Bats, BattleHealer, BattleRam, Berserker, Bomber, BombTower, BossBandit, Bowler, Cannon, CannonCart, Clone, DartGoblin, DarkPrince, Earthquake, EliteBarbarians, ElectroDragon, ElectroGiant, ElectroSpirit, ElectroWizard, ElixirCollector, ElixirGolem, Executioner, FireSpirit, Fireball, Firecracker, Fisherman, FlyingMachine, Freeze, Giant, GiantSkeleton, GiantSnowball, GoblinBarrel, GoblinCage, GoblinCurse, GoblinDemolisher, GoblinDrill, GoblinGang, GoblinGiant, GoblinMachine, Goblins, Goblinstein, GoldenKnight, Golem, Graveyard, Guards, HealSpirit, HogRider, Hunter, IceGolem, IceSpirit, IceWizard, InfernoDragon, InfernoTower, Knight, LavaHound, Lightning, LittlePrince, Lumberjack, MagicArcher, MegaKnight, MegaMinion, MightyMiner, Miner, MiniPEKKA, MinionHorde, Minions, Mirror, Monk, MotherWitch, Musketeer, NightWitch, PEKKA, Phoenix, Poison, Princess, Prince, Rage, RamRider, Rascals, Rocket, RoyalDelivery, RoyalGiant, RoyalGhost, RoyalHogs, RoyalRecruits, RuneGiant, SkeletonArmy, SkeletonBarrel, SkeletonDragons, SkeletonKing, Skeletons, Sparky, SpearGoblins, SpiritEmpress, SuspiciousBush, Tesla, TheLog, ThreeMusketeers, Tombstone, Tornado, Valkyrie, Vines, WallBreakers, Witch, Wizard, XBow, Zap, Zappies extends Card {}
one sig EvoArchers, EvoBabyDragon, EvoBarbarians, EvoBats, EvoBattleRam, EvoBomber, EvoCannon, EvoDartGoblin, EvoElectroDragon, EvoExecutioner, EvoFirecracker, EvoGiantSnowball, EvoGoblinBarrel, EvoGoblinCage, EvoGoblinDrill, EvoGoblinGiant, EvoHunter, EvoIceSpirit, EvoInfernoDragon, EvoKnight, EvoLumberjack, EvoMegaKnight, EvoMusketeer, EvoPEKKA, EvoRoyalGiant, EvoRoyalHogs, EvoRoyalRecruits, EvoSkeletonArmy, EvoSkeletonBarrel, EvoSkeletons, EvoTesla, EvoValkyrie, EvoWallBreakers, EvoWitch, EvoWizard, EvoZap extends EvolutionVersion {}
one sig HeroBarbarianBarrel, HeroGiant, HeroGoblins, HeroIceGolem, HeroMagicArcher, HeroMegaMinion, HeroMiniPEKKA, HeroMusketeer, HeroWizard extends HeroVersion {}

pred cardCatalogData {
  Archers.rarity = Common
  Archers.cost = E3
  Archers.role = AntiAirSplashDamage
  Archers.evolutionVersion = EvoArchers
  no Archers.heroVersion

  Arrows.rarity = Common
  Arrows.cost = E3
  Arrows.role = LowDamageSpell
  no Arrows.evolutionVersion
  no Arrows.heroVersion

  BabyDragon.rarity = Epic
  BabyDragon.cost = E4
  BabyDragon.role = AntiAirSplashDamage
  BabyDragon.evolutionVersion = EvoBabyDragon
  no BabyDragon.heroVersion

  Balloon.rarity = Epic
  Balloon.cost = E5
  Balloon.role = WinCondition
  no Balloon.evolutionVersion
  no Balloon.heroVersion

  Bandit.rarity = Legendary
  Bandit.cost = E3
  Bandit.role = WinCondition
  no Bandit.evolutionVersion
  no Bandit.heroVersion

  BarbarianBarrel.rarity = Epic
  BarbarianBarrel.cost = E2
  BarbarianBarrel.role = LowDamageSpell
  no BarbarianBarrel.evolutionVersion
  BarbarianBarrel.heroVersion = HeroBarbarianBarrel

  BarbarianHut.rarity = Rare
  BarbarianHut.cost = E7
  BarbarianHut.role = WinCondition
  no BarbarianHut.evolutionVersion
  no BarbarianHut.heroVersion

  Barbarians.rarity = Rare
  Barbarians.cost = E5
  Barbarians.role = GroundTankKiller
  Barbarians.evolutionVersion = EvoBarbarians
  no Barbarians.heroVersion

  Bats.rarity = Common
  Bats.cost = E2
  Bats.role = AntiAirSplashDamage
  Bats.evolutionVersion = EvoBats
  no Bats.heroVersion

  BattleHealer.rarity = Rare
  BattleHealer.cost = E4
  BattleHealer.role = GroundTankKiller
  no BattleHealer.evolutionVersion
  no BattleHealer.heroVersion

  BattleRam.rarity = Rare
  BattleRam.cost = E4
  BattleRam.role = WinCondition
  BattleRam.evolutionVersion = EvoBattleRam
  no BattleRam.heroVersion

  Berserker.rarity = Common
  Berserker.cost = E2
  Berserker.role = AntiGroundSplashDamage
  no Berserker.evolutionVersion
  no Berserker.heroVersion

  Bomber.rarity = Common
  Bomber.cost = E2
  Bomber.role = AntiGroundSplashDamage
  Bomber.evolutionVersion = EvoBomber
  no Bomber.heroVersion

  BombTower.rarity = Rare
  BombTower.cost = E4
  BombTower.role = AntiGroundSplashDamage
  no BombTower.evolutionVersion
  no BombTower.heroVersion

  BossBandit.rarity = ChampionRarity
  BossBandit.cost = E6
  BossBandit.role = WinCondition
  no BossBandit.evolutionVersion
  no BossBandit.heroVersion

  Bowler.rarity = Epic
  Bowler.cost = E5
  Bowler.role = AntiGroundSplashDamage
  no Bowler.evolutionVersion
  no Bowler.heroVersion

  Cannon.rarity = Common
  Cannon.cost = E3
  Cannon.role = GroundTankKiller
  Cannon.evolutionVersion = EvoCannon
  no Cannon.heroVersion

  CannonCart.rarity = Epic
  CannonCart.cost = E5
  CannonCart.role = MiniTank
  no CannonCart.evolutionVersion
  no CannonCart.heroVersion

  Clone.rarity = Epic
  Clone.cost = E3
  Clone.role = HighDamageSpell
  no Clone.evolutionVersion
  no Clone.heroVersion

  DartGoblin.rarity = Rare
  DartGoblin.cost = E3
  DartGoblin.role = AntiAirSplashDamage
  DartGoblin.evolutionVersion = EvoDartGoblin
  no DartGoblin.heroVersion

  DarkPrince.rarity = Epic
  DarkPrince.cost = E4
  DarkPrince.role = AntiGroundSplashDamage
  no DarkPrince.evolutionVersion
  no DarkPrince.heroVersion

  Earthquake.rarity = Rare
  Earthquake.cost = E3
  Earthquake.role = HighDamageSpell
  no Earthquake.evolutionVersion
  no Earthquake.heroVersion

  EliteBarbarians.rarity = Rare
  EliteBarbarians.cost = E6
  EliteBarbarians.role = GroundTankKiller
  no EliteBarbarians.evolutionVersion
  no EliteBarbarians.heroVersion

  ElectroDragon.rarity = Epic
  ElectroDragon.cost = E5
  ElectroDragon.role = AntiAirSplashDamage
  ElectroDragon.evolutionVersion = EvoElectroDragon
  no ElectroDragon.heroVersion

  ElectroGiant.rarity = Epic
  ElectroGiant.cost = E7
  ElectroGiant.role = WinCondition
  no ElectroGiant.evolutionVersion
  no ElectroGiant.heroVersion

  ElectroSpirit.rarity = Common
  ElectroSpirit.cost = E1
  ElectroSpirit.role = LowDamageSpell
  no ElectroSpirit.evolutionVersion
  no ElectroSpirit.heroVersion

  ElectroWizard.rarity = Legendary
  ElectroWizard.cost = E4
  ElectroWizard.role = AntiAirSplashDamage
  no ElectroWizard.evolutionVersion
  no ElectroWizard.heroVersion

  ElixirCollector.rarity = Rare
  ElixirCollector.cost = E6
  ElixirCollector.role = LowDamageSpell
  no ElixirCollector.evolutionVersion
  no ElixirCollector.heroVersion

  ElixirGolem.rarity = Rare
  ElixirGolem.cost = E3
  ElixirGolem.role = WinCondition
  no ElixirGolem.evolutionVersion
  no ElixirGolem.heroVersion

  Executioner.rarity = Epic
  Executioner.cost = E5
  Executioner.role = AntiAirSplashDamage
  Executioner.evolutionVersion = EvoExecutioner
  no Executioner.heroVersion

  FireSpirit.rarity = Common
  FireSpirit.cost = E1
  FireSpirit.role = LowDamageSpell
  no FireSpirit.evolutionVersion
  no FireSpirit.heroVersion

  Fireball.rarity = Rare
  Fireball.cost = E4
  Fireball.role = HighDamageSpell
  no Fireball.evolutionVersion
  no Fireball.heroVersion

  Firecracker.rarity = Common
  Firecracker.cost = E3
  Firecracker.role = AntiAirSplashDamage
  Firecracker.evolutionVersion = EvoFirecracker
  no Firecracker.heroVersion

  Fisherman.rarity = Legendary
  Fisherman.cost = E3
  Fisherman.role = GroundTankKiller
  no Fisherman.evolutionVersion
  no Fisherman.heroVersion

  FlyingMachine.rarity = Rare
  FlyingMachine.cost = E4
  FlyingMachine.role = AntiAirSplashDamage
  no FlyingMachine.evolutionVersion
  no FlyingMachine.heroVersion

  Freeze.rarity = Epic
  Freeze.cost = E4
  Freeze.role = HighDamageSpell
  no Freeze.evolutionVersion
  no Freeze.heroVersion

  Giant.rarity = Rare
  Giant.cost = E5
  Giant.role = WinCondition
  no Giant.evolutionVersion
  Giant.heroVersion = HeroGiant

  GiantSkeleton.rarity = Epic
  GiantSkeleton.cost = E6
  GiantSkeleton.role = MiniTank
  no GiantSkeleton.evolutionVersion
  no GiantSkeleton.heroVersion

  GiantSnowball.rarity = Common
  GiantSnowball.cost = E2
  GiantSnowball.role = LowDamageSpell
  GiantSnowball.evolutionVersion = EvoGiantSnowball
  no GiantSnowball.heroVersion

  GoblinBarrel.rarity = Epic
  GoblinBarrel.cost = E3
  GoblinBarrel.role = WinCondition
  GoblinBarrel.evolutionVersion = EvoGoblinBarrel
  no GoblinBarrel.heroVersion

  GoblinCage.rarity = Rare
  GoblinCage.cost = E4
  GoblinCage.role = GroundTankKiller
  GoblinCage.evolutionVersion = EvoGoblinCage
  no GoblinCage.heroVersion

  GoblinCurse.rarity = Epic
  GoblinCurse.cost = E2
  GoblinCurse.role = LowDamageSpell
  no GoblinCurse.evolutionVersion
  no GoblinCurse.heroVersion

  GoblinDemolisher.rarity = Rare
  GoblinDemolisher.cost = E4
  GoblinDemolisher.role = WinCondition
  no GoblinDemolisher.evolutionVersion
  no GoblinDemolisher.heroVersion

  GoblinDrill.rarity = Epic
  GoblinDrill.cost = E4
  GoblinDrill.role = WinCondition
  GoblinDrill.evolutionVersion = EvoGoblinDrill
  no GoblinDrill.heroVersion

  GoblinGang.rarity = Common
  GoblinGang.cost = E3
  GoblinGang.role = GroundTankKiller
  no GoblinGang.evolutionVersion
  no GoblinGang.heroVersion

  GoblinGiant.rarity = Epic
  GoblinGiant.cost = E6
  GoblinGiant.role = WinCondition
  GoblinGiant.evolutionVersion = EvoGoblinGiant
  no GoblinGiant.heroVersion

  GoblinMachine.rarity = Legendary
  GoblinMachine.cost = E5
  GoblinMachine.role = WinCondition
  no GoblinMachine.evolutionVersion
  no GoblinMachine.heroVersion

  Goblins.rarity = Common
  Goblins.cost = E2
  Goblins.role = GroundTankKiller
  no Goblins.evolutionVersion
  Goblins.heroVersion = HeroGoblins

  Goblinstein.rarity = ChampionRarity
  Goblinstein.cost = E5
  Goblinstein.role = HighDamageSpell
  no Goblinstein.evolutionVersion
  no Goblinstein.heroVersion

  GoldenKnight.rarity = ChampionRarity
  GoldenKnight.cost = E4
  GoldenKnight.role = WinCondition
  no GoldenKnight.evolutionVersion
  no GoldenKnight.heroVersion

  Golem.rarity = Epic
  Golem.cost = E8
  Golem.role = WinCondition
  no Golem.evolutionVersion
  no Golem.heroVersion

  Graveyard.rarity = Legendary
  Graveyard.cost = E5
  Graveyard.role = WinCondition
  no Graveyard.evolutionVersion
  no Graveyard.heroVersion

  Guards.rarity = Epic
  Guards.cost = E3
  Guards.role = GroundTankKiller
  no Guards.evolutionVersion
  no Guards.heroVersion

  HealSpirit.rarity = Common
  HealSpirit.cost = E1
  HealSpirit.role = LowDamageSpell
  no HealSpirit.evolutionVersion
  no HealSpirit.heroVersion

  HogRider.rarity = Rare
  HogRider.cost = E4
  HogRider.role = WinCondition
  no HogRider.evolutionVersion
  no HogRider.heroVersion

  Hunter.rarity = Epic
  Hunter.cost = E4
  Hunter.role = AntiAirSplashDamage
  Hunter.evolutionVersion = EvoHunter
  no Hunter.heroVersion

  IceGolem.rarity = Rare
  IceGolem.cost = E2
  IceGolem.role = MiniTank
  no IceGolem.evolutionVersion
  IceGolem.heroVersion = HeroIceGolem

  IceSpirit.rarity = Common
  IceSpirit.cost = E1
  IceSpirit.role = LowDamageSpell
  IceSpirit.evolutionVersion = EvoIceSpirit
  no IceSpirit.heroVersion

  IceWizard.rarity = Legendary
  IceWizard.cost = E3
  IceWizard.role = AntiAirSplashDamage
  no IceWizard.evolutionVersion
  no IceWizard.heroVersion

  InfernoDragon.rarity = Legendary
  InfernoDragon.cost = E4
  InfernoDragon.role = AirTankKiller
  InfernoDragon.evolutionVersion = EvoInfernoDragon
  no InfernoDragon.heroVersion

  InfernoTower.rarity = Rare
  InfernoTower.cost = E5
  InfernoTower.role = AirTankKiller
  no InfernoTower.evolutionVersion
  no InfernoTower.heroVersion

  Knight.rarity = Common
  Knight.cost = E3
  Knight.role = MiniTank
  Knight.evolutionVersion = EvoKnight
  no Knight.heroVersion

  LavaHound.rarity = Legendary
  LavaHound.cost = E7
  LavaHound.role = WinCondition
  no LavaHound.evolutionVersion
  no LavaHound.heroVersion

  Lightning.rarity = Epic
  Lightning.cost = E6
  Lightning.role = HighDamageSpell
  no Lightning.evolutionVersion
  no Lightning.heroVersion

  LittlePrince.rarity = ChampionRarity
  LittlePrince.cost = E3
  LittlePrince.role = WinCondition
  no LittlePrince.evolutionVersion
  no LittlePrince.heroVersion

  Lumberjack.rarity = Epic
  Lumberjack.cost = E4
  Lumberjack.role = GroundTankKiller
  Lumberjack.evolutionVersion = EvoLumberjack
  no Lumberjack.heroVersion

  MagicArcher.rarity = Legendary
  MagicArcher.cost = E4
  MagicArcher.role = AntiAirSplashDamage
  no MagicArcher.evolutionVersion
  MagicArcher.heroVersion = HeroMagicArcher

  MegaKnight.rarity = Legendary
  MegaKnight.cost = E7
  MegaKnight.role = AntiGroundSplashDamage
  MegaKnight.evolutionVersion = EvoMegaKnight
  no MegaKnight.heroVersion

  MegaMinion.rarity = Rare
  MegaMinion.cost = E3
  MegaMinion.role = AirTankKiller
  no MegaMinion.evolutionVersion
  MegaMinion.heroVersion = HeroMegaMinion

  MightyMiner.rarity = ChampionRarity
  MightyMiner.cost = E4
  MightyMiner.role = GroundTankKiller
  no MightyMiner.evolutionVersion
  no MightyMiner.heroVersion

  Miner.rarity = Legendary
  Miner.cost = E3
  Miner.role = WinCondition
  no Miner.evolutionVersion
  no Miner.heroVersion

  MiniPEKKA.rarity = Rare
  MiniPEKKA.cost = E4
  MiniPEKKA.role = GroundTankKiller
  no MiniPEKKA.evolutionVersion
  MiniPEKKA.heroVersion = HeroMiniPEKKA

  MinionHorde.rarity = Common
  MinionHorde.cost = E5
  MinionHorde.role = AntiAirSplashDamage
  no MinionHorde.evolutionVersion
  no MinionHorde.heroVersion

  Minions.rarity = Common
  Minions.cost = E3
  Minions.role = AntiAirSplashDamage
  no Minions.evolutionVersion
  no Minions.heroVersion

  Mirror.rarity = Epic
  Mirror.cost = E2
  Mirror.role = LowDamageSpell
  no Mirror.evolutionVersion
  no Mirror.heroVersion

  Monk.rarity = ChampionRarity
  Monk.cost = E5
  Monk.role = MiniTank
  no Monk.evolutionVersion
  no Monk.heroVersion

  MotherWitch.rarity = Legendary
  MotherWitch.cost = E4
  MotherWitch.role = WinCondition
  no MotherWitch.evolutionVersion
  no MotherWitch.heroVersion

  Musketeer.rarity = Rare
  Musketeer.cost = E4
  Musketeer.role = AntiAirSplashDamage
  Musketeer.evolutionVersion = EvoMusketeer
  Musketeer.heroVersion = HeroMusketeer

  NightWitch.rarity = Legendary
  NightWitch.cost = E4
  NightWitch.role = WinCondition
  no NightWitch.evolutionVersion
  no NightWitch.heroVersion

  PEKKA.rarity = Epic
  PEKKA.cost = E7
  PEKKA.role = GroundTankKiller
  PEKKA.evolutionVersion = EvoPEKKA
  no PEKKA.heroVersion

  Phoenix.rarity = Legendary
  Phoenix.cost = E4
  Phoenix.role = AntiAirSplashDamage
  no Phoenix.evolutionVersion
  no Phoenix.heroVersion

  Poison.rarity = Epic
  Poison.cost = E4
  Poison.role = HighDamageSpell
  no Poison.evolutionVersion
  no Poison.heroVersion

  Princess.rarity = Legendary
  Princess.cost = E3
  Princess.role = AntiGroundSplashDamage
  no Princess.evolutionVersion
  no Princess.heroVersion

  Prince.rarity = Epic
  Prince.cost = E5
  Prince.role = GroundTankKiller
  no Prince.evolutionVersion
  no Prince.heroVersion

  Rage.rarity = Epic
  Rage.cost = E2
  Rage.role = LowDamageSpell
  no Rage.evolutionVersion
  no Rage.heroVersion

  RamRider.rarity = Legendary
  RamRider.cost = E5
  RamRider.role = WinCondition
  no RamRider.evolutionVersion
  no RamRider.heroVersion

  Rascals.rarity = Common
  Rascals.cost = E5
  Rascals.role = AntiAirSplashDamage
  no Rascals.evolutionVersion
  no Rascals.heroVersion

  Rocket.rarity = Rare
  Rocket.cost = E6
  Rocket.role = HighDamageSpell
  no Rocket.evolutionVersion
  no Rocket.heroVersion

  RoyalDelivery.rarity = Common
  RoyalDelivery.cost = E3
  RoyalDelivery.role = LowDamageSpell
  no RoyalDelivery.evolutionVersion
  no RoyalDelivery.heroVersion

  RoyalGiant.rarity = Common
  RoyalGiant.cost = E6
  RoyalGiant.role = WinCondition
  RoyalGiant.evolutionVersion = EvoRoyalGiant
  no RoyalGiant.heroVersion

  RoyalGhost.rarity = Legendary
  RoyalGhost.cost = E3
  RoyalGhost.role = MiniTank
  no RoyalGhost.evolutionVersion
  no RoyalGhost.heroVersion

  RoyalHogs.rarity = Common
  RoyalHogs.cost = E5
  RoyalHogs.role = WinCondition
  RoyalHogs.evolutionVersion = EvoRoyalHogs
  no RoyalHogs.heroVersion

  RoyalRecruits.rarity = Common
  RoyalRecruits.cost = E7
  RoyalRecruits.role = MiniTank
  RoyalRecruits.evolutionVersion = EvoRoyalRecruits
  no RoyalRecruits.heroVersion

  RuneGiant.rarity = Epic
  RuneGiant.cost = E4
  RuneGiant.role = WinCondition
  no RuneGiant.evolutionVersion
  no RuneGiant.heroVersion

  SkeletonArmy.rarity = Epic
  SkeletonArmy.cost = E3
  SkeletonArmy.role = GroundTankKiller
  SkeletonArmy.evolutionVersion = EvoSkeletonArmy
  no SkeletonArmy.heroVersion

  SkeletonBarrel.rarity = Common
  SkeletonBarrel.cost = E3
  SkeletonBarrel.role = WinCondition
  SkeletonBarrel.evolutionVersion = EvoSkeletonBarrel
  no SkeletonBarrel.heroVersion

  SkeletonDragons.rarity = Common
  SkeletonDragons.cost = E4
  SkeletonDragons.role = AntiAirSplashDamage
  no SkeletonDragons.evolutionVersion
  no SkeletonDragons.heroVersion

  SkeletonKing.rarity = ChampionRarity
  SkeletonKing.cost = E4
  SkeletonKing.role = AntiGroundSplashDamage
  no SkeletonKing.evolutionVersion
  no SkeletonKing.heroVersion

  Skeletons.rarity = Common
  Skeletons.cost = E1
  Skeletons.role = GroundTankKiller
  Skeletons.evolutionVersion = EvoSkeletons
  no Skeletons.heroVersion

  Sparky.rarity = Legendary
  Sparky.cost = E6
  Sparky.role = HighDamageSpell
  no Sparky.evolutionVersion
  no Sparky.heroVersion

  SpearGoblins.rarity = Common
  SpearGoblins.cost = E2
  SpearGoblins.role = AntiAirSplashDamage
  no SpearGoblins.evolutionVersion
  no SpearGoblins.heroVersion

  SpiritEmpress.rarity = Legendary
  SpiritEmpress.cost = E3
  SpiritEmpress.role = AntiAirSplashDamage
  no SpiritEmpress.evolutionVersion
  no SpiritEmpress.heroVersion

  SuspiciousBush.rarity = Rare
  SuspiciousBush.cost = E2
  SuspiciousBush.role = WinCondition
  no SuspiciousBush.evolutionVersion
  no SuspiciousBush.heroVersion

  Tesla.rarity = Common
  Tesla.cost = E4
  Tesla.role = AntiAirSplashDamage
  Tesla.evolutionVersion = EvoTesla
  no Tesla.heroVersion

  TheLog.rarity = Legendary
  TheLog.cost = E2
  TheLog.role = LowDamageSpell
  no TheLog.evolutionVersion
  no TheLog.heroVersion

  ThreeMusketeers.rarity = Rare
  ThreeMusketeers.cost = E9
  ThreeMusketeers.role = AntiAirSplashDamage
  no ThreeMusketeers.evolutionVersion
  no ThreeMusketeers.heroVersion

  Tombstone.rarity = Rare
  Tombstone.cost = E3
  Tombstone.role = GroundTankKiller
  no Tombstone.evolutionVersion
  no Tombstone.heroVersion

  Tornado.rarity = Epic
  Tornado.cost = E3
  Tornado.role = HighDamageSpell
  no Tornado.evolutionVersion
  no Tornado.heroVersion

  Valkyrie.rarity = Rare
  Valkyrie.cost = E4
  Valkyrie.role = AntiGroundSplashDamage
  Valkyrie.evolutionVersion = EvoValkyrie
  no Valkyrie.heroVersion

  Vines.rarity = Epic
  Vines.cost = E3
  Vines.role = LowDamageSpell
  no Vines.evolutionVersion
  no Vines.heroVersion

  WallBreakers.rarity = Epic
  WallBreakers.cost = E2
  WallBreakers.role = WinCondition
  WallBreakers.evolutionVersion = EvoWallBreakers
  no WallBreakers.heroVersion

  Witch.rarity = Epic
  Witch.cost = E5
  Witch.role = AntiAirSplashDamage
  Witch.evolutionVersion = EvoWitch
  no Witch.heroVersion

  Wizard.rarity = Epic
  Wizard.cost = E5
  Wizard.role = AntiAirSplashDamage
  Wizard.evolutionVersion = EvoWizard
  Wizard.heroVersion = HeroWizard

  XBow.rarity = Epic
  XBow.cost = E6
  XBow.role = WinCondition
  no XBow.evolutionVersion
  no XBow.heroVersion

  Zap.rarity = Common
  Zap.cost = E2
  Zap.role = LowDamageSpell
  Zap.evolutionVersion = EvoZap
  no Zap.heroVersion

  Zappies.rarity = Common
  Zappies.cost = E4
  Zappies.role = AntiAirSplashDamage
  no Zappies.evolutionVersion
  no Zappies.heroVersion

}


// Starter commands for exploration on the concrete CSV-backed dataset
run {
  cardCatalogData
  someValidDeckExists
} for 5 Int, exactly 116 Card, exactly 1 Deck, exactly 36 EvolutionVersion, exactly 9 HeroVersion

// this should be UNSAT if the CSV respects the champion rule, comment out
// run {
//   cardCatalogData
//   globalCardRules
//   some c: Card | c.rarity = ChampionRarity and (some c.evolutionVersion or some c.heroVersion)
// } for 5 Int, exactly 116 Card, exactly 36 EvolutionVersion, exactly 9 HeroVersion
