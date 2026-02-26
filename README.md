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