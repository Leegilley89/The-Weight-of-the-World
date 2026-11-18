# The Weight of the World — Game Design Document

**Status:** Founding draft v0.1. All systems described are goals unless marked implemented.

## Vision
An open-world survival crafting RPG in which morality is a mechanical foundation. Players struggle to survive in an interactive world. Their decisions reshape the lives of NPCs, the responses of settlements and factions, and the abilities the player can use.

## Design pillars
1. **Consequences:** Both immediate and delayed choices influence the world.
2. **Physical interaction:** Most reasonable world objects may be inspected, handled, moved, stored, or taken.
3. **Survival pressure:** Hunger, thirst, weather, exhaustion, and resources make choices meaningful.
4. **Emergent ownership:** Theft, witnesses, and notoriety produce believable reactions.
5. **Community development:** Accessible architecture, documented decisions, public contribution process.

## Genre and player perspective
3D open-world survival crafting RPG. Default first-person camera; switch to third-person. Initial milestone is a single-player prototype. Multiplayer is not part of the first playable scope.

## Core player loop
Explore -> inspect environment -> gather, trade, take, or steal -> survive/craft -> confront moral decisions -> gain relationships and abilities -> witness persistent changes -> explore further.

## Moral systems
Separate:
- **Honor:** The moral implications of actions and outcomes.
- **Notoriety:** What authorities or communities believe the player has done.
- **Relationships:** Individual NPC trust, fear, hostility, and loyalty.
- **Faction standing:** Political and social consequences.

Context matters. Taking a wealthy merchant's food to save a hungry child should not be treated identically to stealing the final meal of a starving family. Witnesses determine discovery and response; they do not automatically define moral truth.

Prototype moral event: obtain food from a merchant (purchase, steal, persuade, or trade) and decide whether to feed a hungry traveler. This is a design target, not a claim of complete implementation.

## Morality-based abilities
Paths are expressive rather than a permanent binary. Illustrative abilities:
- **Guardian's Resolve:** Defensive effect when shielding others, requiring sustained high honor.
- **Predator's Instinct:** Tracking or combat advantage against vulnerable enemies, associated with severe dishonor.
- **Underhanded:** Improved stealth/tool use for criminal play.
- **Adaptability:** Neutral path flexibility.
Specific thresholds, balancing, and the possibility of redemption require testing.

## Objects and containers
Objects should use data-driven properties: identifier, display name, mass, volume, portability, durability, value, owner, physics state, and interaction tags. Some structures are too large or fixed to move; universal interaction is a design ambition, not a guarantee that literally all geometry can enter inventory.

Containers have capacity, lock/permission state, optional ownership, and contents that may be empty. Searching and looting are separate operations. Players can place items back into containers. Persistent storage and world-state saving are later milestones.

## Theft and witnesses
Taking an owned item without permission triggers a theft event. Evaluate owner, observers, visibility, jurisdiction, relationships, and circumstances. Notoriety can rise independently of honor. NPC reactions may include confrontation, alarm, reporting, recovery attempts, or forgiveness.

## Survival and crafting
Initial systems: hunger, thirst, gathering, basic inventory, and simple crafting recipes. Future: temperature, disease, shelter, item condition, workstations, cooking, and repairs. Avoid repetitive micromanagement that distracts from consequence-based play.

## World structure
Build a small vertical slice before a seamless world: forest clearing, merchant camp, traveler, owned items, empty and filled containers, crafting station, and shelter. Expand via reusable regions and streamed scenes only after mechanics and performance work.

## First playable acceptance criteria
- First-person traversal with third-person toggle.
- Objects can be inspected and picked up; owned objects identify theft.
- Empty and filled containers are both searchable.
- Inventory and at least one crafting recipe.
- Hunger and thirst update and can be restored.
- One moral decision changes honor and another value (notoriety or relationship).
- One exclusive ability responds to moral state.
- On-screen feedback and documented controls.

## Non-goals for v0.1
Seamless continents, advanced combat, multiplayer networking, hundreds of NPCs, cinematic graphics, a full quest campaign, and commercial release readiness.

## Risks
High object counts affect physics and performance. A complex moral simulation requires explainable rules. Save persistence, licenses for community assets, and balancing moral consequences all need dedicated design and testing.
