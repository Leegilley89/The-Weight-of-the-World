# The Weight of the World

**An independent, open-source survival crafting RPG — developed by its community, guided by its founder.**

> **Founder's vision:** Create the best video game we can for players, developed with players. If you know game development, want to learn, or have ideas for lights, stories, quests, continents, or entirely new systems, you're invited to contribute.

**Status: Early playable prototype (v0.1).** The current Godot demo has basic movement, switchable first-/third-person camera, pickup, searchable containers, theft, and an honor/notoriety prototype. It is **not** a complete survival game or polished release.

## What makes this game different?

- **Choices are the core mechanic:** Good and bad decisions affect moral progression, abilities, NPCs, quests, and the world.
- **Survive and craft:** Gather, build, eat, drink, explore, and make hard tradeoffs. More systems are planned.
- **Interact broadly:** Pick up and manipulate world objects; search containers that may be empty; take or steal items and face consequences.
- **Choose your perspective:** First person by default, with third person available.
- **Help build it:** Code, art, writing, music, level design, accessibility, testing, and feedback are all welcome.

## Play the current prototype

1. Install [Godot 4](https://godotengine.org/download).
2. Clone this repository or use **Code → Download ZIP**.
3. Open/import `project.godot` in Godot.
4. Press **F5** to run.

**Controls:** WASD move; mouse look; Space jump; E interact; V switch perspective; Tab inspect inventory; Esc release/capture mouse.

**Current demo:** A test clearing with objects, empty and filled containers, merchant-owned items, a hungry traveler, and shrines that check moral eligibility. Some interactions and exclusive abilities are placeholders. The demo may have bugs; see the issue tracker.

## Contribute

**Everyone is welcome to propose changes.** The official game still has a review process: fork the project, find an issue, make your change, and submit a pull request. New contributors can start with bugs, documentation, writing, testing, or small features.

- [Find open tasks](../../issues)
- [Contribution guide](CONTRIBUTING.md)
- [Founder-led governance](GOVERNANCE.md)
- [Game design document](docs/GAME_DESIGN_DOCUMENT.md)
- [Development roadmap](docs/ROADMAP.md)
- [Architecture notes](docs/ARCHITECTURE.md)
- [Code of conduct](CODE_OF_CONDUCT.md)

## Development principles

**Founder-led, community-developed:** The founder keeps final creative authority over the official project; maintainers review contributions; the community proposes and builds improvements. Forks are permitted under the applicable licenses.

The project's **source code is MIT-licensed** (see [LICENSE](LICENSE)). This permits reuse and commercial forks, provided the license terms are met. **Do not assume future art, music, stories, branding, or third-party assets are MIT-licensed**; those require explicit rights and review before they can be distributed.

## Funding

A Kickstarter is **planned for consideration after a credible playable vertical slice**. No campaign is live, and no delivery date or funding target is promised. See [Funding Plan](docs/FUNDING_PLAN.md). Volunteering does not imply employment, compensation, or revenue sharing.

## Current priorities

1. Stabilize first-/third-person character controller and camera.
2. Replace string-only inventory with reusable item, container, ownership, and transfer data.
3. Implement an inventory UI, dropping and placing items.
4. Separate honor, reputation, and NPC witnessing of theft.
5. Add working survival/crafting systems and exclusive moral abilities.

**Want to help?** Browse [Issues](../../issues), submit a proposal, or open a pull request. Every contribution helps us turn the vision into a game.
