# The Weight of the World — Game Design Document

**Status:** Founding draft v0.1. All systems described are goals unless marked implemented.

## Vision
An open-world survival crafting RPG in which morality is a mechanical foundation. Players struggle to survive in an interactive world. Their decisions reshape the lives of NPCs, the responses of settlements and factions, and the abilities the player can use.

## Defining innovation: interconnected moral progression

**Foundational rule:** Quests, skills, abilities, and honor must be designed as interdependent systems, not isolated features. Skill practice increases proficiency, but morally significant actions and consequences affect specializations, training opportunities, recipes, quest solutions, and abilities. In turn, skill progression unlocks new ways to make choices in quests.

This is the game's signature differentiation. When contributors propose new quests or skills, they should document how their work interacts with the honor system.

### Progression relationships
- **Actions → Honor / world state:** Choices carry contextual consequences, including delayed results.
- **Skills → Opportunities:** Practicing or training skills improves competence and opens alternative quest approaches.
- **Honor + Skills → Specializations:** Both technical proficiency and moral alignment/record can affect available abilities or crafting variants.
- **Quests → Skills / Honor:** Quest branches create training opportunities and may change ability access or NPC instruction.
- **Survival / Building → Choices:** Resource scarcity, shelter, ownership, and crafting create real moral tradeoffs.
- **World reactions → Further choices:** Factions, NPCs, trainers, and settlements remember what occurred, enabling different future interactions.

### Example only: smithing
A competent smith can create ordinary equipment regardless of morality. A protective specialization may require a demonstrated history of defending others; a destructive specialization may require an opposing history; neutral techniques remain useful. Exact thresholds, permanence, and available techniques are undecided and need prototypes. The same approach can apply to other skills without requiring every action to change honor.

### Guardrails for designers
1. Don't reduce morality to a simple good/evil XP multiplier.
2. Avoid locking basic survival necessities behind alignment; moral paths should remain playable.
3. Distinguish private moral consequences from witnessed crimes and reputation.
4. Allow quests to have several viable resolutions, including skill-based alternatives.
5. Do not assume one choice alone defines a player's identity; consider patterns and lasting consequences.
6. Keep systems original: design our own world, characters, quests, UI, dialogue, mechanical details, and assets.

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

## Skills and leveling

**Design goal:** Multiple independently progressing skills that develop through meaningful use, training, and tasks. Crafting, exploration, dialogue, survival, combat, and construction should provide opportunities for mastery. Skill progression should avoid repetitive grinding that rewards meaningless actions.

Each skill proposal should describe:
- Training activities, levels/competence milestones, and meaningful rewards
- How quests offer training or alternate uses of the skill
- How honor and world reputation affect instructors, specializations, recipes, or abilities
- Which capabilities stay universally available so all moral paths remain viable

Level caps, XP formulae, full skill catalog, respec rules, and unlock persistence are design questions, not finalized specifications.

## Quest and dialogue design

Target immersive conversations and branching missions with different skill checks, item interactions, faction responses, peaceful and hostile approaches, and delayed consequences. Quest outcomes must be tracked in persistent world state. An NPC can react to the player's deeds, relationships, reputation, and skills independently.

Quest design template: premise; NPC motivations; discoverable clues and physical interactions; viable resolutions; skill requirements; immediate and delayed honor/reputation effects; world changes; possible ability/training unlocks; failure and recovery routes.

## Visual and world interaction goals

Aim for atmospheric, visually coherent 3D settlements and wilderness with strong environmental storytelling, interactive interiors, sensible object ownership, richly searchable containers (including empty ones), and persistent placed/stolen items. Graphics quality is an iterative target rather than a promise of any particular technology or fidelity.

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
