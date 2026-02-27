# curiosity-modeling-bowen2-mciovacc

## Parent Objective
We are trying to model the structural rules of Clash Royale decks and basic board-state constraints using Forge. 

#### Explaining the Game
Clash Royale is a strategy game where players build decks of 8 cards and deploy those cards onto a battlefield grid using a resource called elixir. Each card has attributes like rarity and elixir cost, and decks must follow specific construction rules (for example, exactly 8 distinct cards, with limits on special types like Champions or Evolution cards).

#### First Part of the Model -- Deck Validity Rules
The first part of the project models deck validity rules, including:
- Exactly 8 distinct cards per deck
    A deck must contain exactly 8 cards selected from the total Card pool. Card membership is tracked using the chosenCards Boolean relation, and exactly 8 cards must evaluate to True.
- Cards must come from the defined total card pool
    Every card in a deck is a concrete instance of Card, which has a fixed rarity, role, and elixir cost. The model optionally enforces the current card pool size as of the last update which is 121 cards.
- At most 2 active evolutions
    A deck may activate at most 2 evolutions at a time. Active evolutions are tracked separately using activeEvolutions, and the number of cards marked True in this relation must be ≤ 2.
- Active evolutions must correspond to valid cards
    If a card is marked as having an active evolution in a deck, then:
        1. That card must already be chosen in the deck.
        2. That card must actually support an evolution (hasEvolution[c]).
- At most 2 Champion or Hero-designated cards total
    So among the 8 chosen cards, at most 2 may be either:
        ChampionRarity, or
        hero-designated (i.e., have a heroVersion).
    This constraint allows for combinations like:
        2 Champions
        1 Champion and 1 Hero
        2 Heroes
    but never more than 2 total across both categories.
- Champions can't also be heroes or evolutions
    The model enforces that any card with ChampionRarity can't also have an evolution or hero version. This prevents illegal overlapping designations in the card pool itself.
- Each card has exactly one rarity, role, and elixir cost
    Every card has:
        One of five rarities (Common, Rare, Epic, Legendary, Champion)
        Exactly one role (e.g., WinCondition, MiniTank, etc.)
        Exactly one elixir cost from E1–E10


#### Second Part
The second part models basic board-state constraints, such as:
- Cards must be placed and stay within valid grid boundaries
- No two cards can occupy the same position
- Cards can't be placed on restricted areas (like towers)
- Cards must initially be placed on that player’s side of the arena.

## Model Design and Visualization
Our model treats card properties and deck selection separately.
- 'Card'stores properties like rarity, cost, and role.
- Evolution/hero are treated as optional links and not rarities.
- 'Deck' uses boolean relations like chosenCards and activeEvolutions

#### Key Constraints
- globalCardRules: champions can't also be hero or evolution cards.
- validDeck[d] makes sure that:
    exactly 8 cards are chosen,
    active evolutions must be chosen and be able to evolve,
    at most 2 active evolutions,
    and at most 2 chosen cards that are champion or hero total.

#### Checks
For checks and runs we have someValidDeckExists which is the main run predicate for finding legal decks.
currentCardPoolSize checks what is says the expected pool size.

#### Viewing and reading Instances
For easier interpretation, we used a custom view, talked about more below in the disclosure statement, rather than the default sterling visualizer.
- run deck-visualization.frg and click script and run like we did in the eight queens lab
- this will render the instance as a 2x4 deck layout with one card name per card.
- each rendered card corresponds to one selected deck card so there should be exactly 8 visible cards.
- clicking Next gives another valid instance so card names will change between runs but should stay a valid deck.

## Signatures and Predicates
Ultimately, the model is split into (1) card/domain structure and (2) deck validity rules.
- Sigs:
    Rarity: card rarity categories (Common, Rare, Epic, Legendary, ChampionRarity).
    Role: tactical role categories like win condition, spells, anti-air, etc.
    ElixirCost: symbolic elixir values (E1–E10)
    Card: one Clash Royale card definition with fields rarity, cost, role, plus optional evolutionVersion and heroVersion.
    EvolutionVersion, HeroVersion: marker sigs used to represent whether a card has those special designations.
    Deck: stores deck state through:
        chosenCards: Card -> Boolean (whether in deck or not),
        activeEvolutions: Card -> Boolean (whether it's a currently activated evo or not).

- Predicates:
    globalCardRules: enforces cross-card-pool consistency (so champions can't also be hero/evolution cards).
    isChampion[c], hasEvolution[c], isHeroDesignated[c]: helper predicates to make major constraints readable and reusable.
    validDeck[d]: central legality predicate combining all the deck rules:
        exactly 8 chosen cards,
        active evolutions must be chosen,
        active evolutions require evolution-capable cards,
        at most 2 active evolutions,
        at most 2 chosen cards that are champion-or-hero combined.
    someValidDeckExists: shows at least one legal deck exists under rules.
    currentCardPoolSize: check for the intended size of the total card pool.

- How they fit together:
    Sigs define the vocabulary and state space.
    Helper predicates define reusable card properties.
    globalCardRules constrains the global card pool.
    validDeck constrains each deck instance.
    someValidDeckExists/currentCardPoolSize are checks to validate the model and expected scale.

## Testing
In our testing file curiosity-modeling-test.frg, we wrote both structural model tests and domain-rule tests.
- For model level tests:
    globalCardRules suite:
        positive example where a champion has no hero or evolution link,
        negative example where a champion is incorrectly given hero/evolution.
        sat/unsat assertions confirm the rule is realizable and violations are impossible.
    helperPredicates suite:
        checks helper predicates (like isChampion, hasEvolution, isHeroDesignated) are usable and consistent.
    validDeck suite:
        positive concrete 8-card valid deck example,
        negative example with illegal active evolution usage,
        assertions that incorrect cases are unsat (like wrong card count, active evo not chosen, active evo on non-evo card, >2 active evos, >2 champion/hero total).

- Domain-property tests (essentially the CLash Royale RUles)
    Verified core deck-building constraints:
        exactly 8 chosen cards,
        max 2 active evolutions,
        active evolutions must be on chosen, evolution-capable cards,
        max 2 champion-or-hero cards total.
    modelChecks suite:
        confirms a valid deck can exist (someValidDeckExists),
        checks card-pool-size expectation (currentCardPoolSize sat at 116, unsat at 115).
As an overview for the testing suite, the tests combine concrete examples and property assumptions to catch both logical mistakes in the specifications and violations of the Clash Royale domain rules.

## AI Use Disclosure Statement
We had two elements of this project we needed to utilize AI for. First, we found AI vital for building our visual in JavaScript. Neither of us had any experience in JavaScript and we attempted to build an adequate cnd visual based on what we were given for past assignments, but that did not work after several attempts. This visual was created by analyzing the N-queens visual we used earlier in the course as a reference. This visual was very important to check that our decks were fully forming properly and made us eager to continue this project in the future as there are several aspects of the visual that could improve in complexity. Additionally, we used AI to actually catalog all the cards in cr-card-catalog. This is pretty standard, but we built a basic csv with the cards and all their relevant properties, and we had the tool analyze that csv and then make the catalog so we can actually model with those properties. We utilized a chatgpt codex model for these queries, and felt that the uses benefitted our overall ability to complete and test the model adequately. This also sets us up to further model this in the future, because there are so many directions we could go now that we had assistance creating a relevant visual and building a full catalog for all cards and all of their properties. We are prepared to discuss our decision to use AI in this area and how this benefits our project overall.