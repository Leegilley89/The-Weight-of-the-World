# Prototype Architecture

Engine: Godot 4.x, GDScript, 3D GL Compatibility renderer.

The first prototype uses a single main scene and a procedural demo level to lower contributor setup costs. This is temporary scaffolding.

Long-term planned modules:
- Player: movement, camera, interaction ray
- Interactables: portable items, static props, containers, ownership
- Inventory: capacity, item resources, transfer and persistence
- Survival: hunger, thirst, exposure, consumables
- Morality: contextual events, honor, notoriety, witnesses and relationships
- Progression: abilities unlocked by sustained moral choices
- World: settlements, NPC schedules, save/load

Keep game data separate from presentation and prefer reusable resources, components and automated tests as the scope grows.

See GAME_DESIGN_DOCUMENT.md for rules and ROADMAP.md for acceptance criteria.
