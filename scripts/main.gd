extends Node3D
# Experimental v0.1 interaction demo. No save system or crafting yet.

const WALK_SPEED := 5.0
var player: CharacterBody3D
var pivot: Node3D
var camera: Camera3D
var hud: Label
var third_person := false
var inventory: Array[String] = []
var honor := 0
var notoriety := 0
var hunger := 100.0
var thirst := 100.0
var fed_traveler := false
var note := "E: interact | V: camera | Tab: inventory | Esc: mouse"

func _ready() -> void:
    _make_world()
    _make_player()
    _make_ui()
    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func make_block(title: String, pos: Vector3, size: Vector3, color: Color, kind: String = "", item: String = "", owner: String = "", contents: Array = []) -> StaticBody3D:
    var body := StaticBody3D.new()
    body.name = title
    body.position = pos
    body.set_meta("kind", kind)
    body.set_meta("item", item)
    body.set_meta("owner", owner)
    body.set_meta("contents", contents.duplicate())
    var mesh := MeshInstance3D.new()
    var box := BoxMesh.new()
    box.size = size
    mesh.mesh = box
    var mat := StandardMaterial3D.new()
    mat.albedo_color = color
    mesh.material_override = mat
    body.add_child(mesh)
    var collision := CollisionShape3D.new()
    var box_shape := BoxShape3D.new()
    box_shape.size = size
    collision.shape = box_shape
    body.add_child(collision)
    add_child(body)
    return body

func _make_world() -> void:
    var light := DirectionalLight3D.new()
    light.rotation_degrees = Vector3(-55, -30, 0)
    add_child(light)
    var world := WorldEnvironment.new()
    var env := Environment.new()
    env.background_mode = Environment.BG_COLOR
    env.background_color = Color(0.48, 0.63, 0.8)
    env.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
    env.ambient_light_color = Color(0.8, 0.8, 0.8)
    world.environment = env
    add_child(world)
    make_block("Ground", Vector3(0,-0.5,0), Vector3(45,1,45), Color(0.28,0.43,0.22))
    make_block("Table", Vector3(0,0.7,-5), Vector3(3,0.3,1.5), Color(0.42,0.24,0.13))
    make_block("Apple", Vector3(-1,1.02,-5), Vector3(.3,.3,.3), Color(.85,.2,.18), "item", "Apple")
    make_block("Merchant Bread", Vector3(0,1.03,-5), Vector3(.5,.35,.4), Color(.8,.57,.24), "item", "Bread", "Merchant")
    make_block("Merchant Cup", Vector3(1,1.03,-5), Vector3(.3,.35,.3), Color(.7,.7,.73), "item", "Cup", "Merchant")
    make_block("Empty barrel", Vector3(-3,.65,-5), Vector3(1,1.3,1), Color(.3,.18,.1), "container")
    make_block("Supply crate", Vector3(3,.6,-5), Vector3(1.2,1.2,1.2), Color(.48,.3,.13), "container", "", "", ["Water", "Cloth"])
    make_block("Merchant chest", Vector3(3,.6,-9), Vector3(1.2,1.2,1.2), Color(.3,.14,.08), "container", "", "Merchant", ["Coin", "Bread"])
    make_block("Merchant", Vector3(0,1,-9), Vector3(.8,2,.8), Color(.2,.28,.8), "merchant")
    make_block("Hungry traveler", Vector3(-6,1,-7), Vector3(.8,2,.8), Color(.65,.3,.6), "traveler")
    make_block("Guardian Shrine", Vector3(-6,1,-12), Vector3(1.1,2,1.1), Color(.84,.76,.3), "shrine")
    make_block("Predator Altar", Vector3(6,1,-12), Vector3(1.1,2,1.1), Color(.32,.14,.37), "altar")

func _make_player() -> void:
    player = CharacterBody3D.new()
    player.position = Vector3(0,2,2)
    add_child(player)
    var collision := CollisionShape3D.new()
    var capsule := CapsuleShape3D.new()
    capsule.height = 1.8
    capsule.radius = .35
    collision.shape = capsule
    player.add_child(collision)
    pivot = Node3D.new()
    pivot.position.y = .65
    player.add_child(pivot)
    camera = Camera3D.new()
    camera.current = true
    pivot.add_child(camera)
    _update_camera()

func _make_ui() -> void:
    var layer := CanvasLayer.new()
    add_child(layer)
    hud = Label.new()
    hud.position = Vector2(18,16)
    hud.add_theme_font_size_override("font_size", 18)
    layer.add_child(hud)
    var crosshair := Label.new()
    crosshair.text = "+"
    crosshair.set_anchors_preset(Control.PRESET_CENTER)
    crosshair.add_theme_font_size_override("font_size", 26)
    layer.add_child(crosshair)

func _update_camera() -> void:
    if third_person:
        camera.position = Vector3(0,.7,3.7)
    else:
        camera.position = Vector3.ZERO

func _unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
        player.rotate_y(-event.relative.x * .003)
        pivot.rotate_x(-event.relative.y * .003)
        pivot.rotation.x = clamp(pivot.rotation.x, -1.35, 1.35)
    if event is InputEventKey and event.pressed and not event.echo:
        match event.keycode:
            KEY_ESCAPE:
                if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
                    Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
                else:
                    Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
            KEY_V:
                third_person = not third_person
                _update_camera()
            KEY_E:
                _interact()
            KEY_TAB:
                note = "Inventory: " + (", ".join(inventory) if not inventory.is_empty() else "(empty)")

func _physics_process(delta: float) -> void:
    var move := Vector2.ZERO
    if Input.is_key_pressed(KEY_A): move.x -= 1
    if Input.is_key_pressed(KEY_D): move.x += 1
    if Input.is_key_pressed(KEY_W): move.y -= 1
    if Input.is_key_pressed(KEY_S): move.y += 1
    move = move.normalized()
    var direction := player.global_transform.basis * Vector3(move.x,0,move.y)
    player.velocity.x = direction.x * WALK_SPEED
    player.velocity.z = direction.z * WALK_SPEED
    if not player.is_on_floor():
        player.velocity.y -= 18.0 * delta
    elif Input.is_key_pressed(KEY_SPACE):
        player.velocity.y = 6.0
    player.move_and_slide()
    hunger = maxf(0, hunger - delta * .025)
    thirst = maxf(0, thirst - delta * .045)
    var target := _target()
    var focus := " | Look at an object to interact"
    if target != null:
        focus = " | Target: " + target.name
    var ability := "Guardian" if honor >= 10 else ("Predator" if honor <= -10 else "Neutral")
    hud.text = "THE WEIGHT OF THE WORLD - prototype\nHonor: %d | Notoriety: %d | Path: %s\nHunger: %d | Thirst: %d | Items: %d\n%s\n%s%s" % [honor,notoriety,ability,int(hunger),int(thirst),inventory.size(),note,"E Interact | V Camera | Tab Inventory",focus]

func _target() -> StaticBody3D:
    var start := camera.global_position
    var end := start + -camera.global_transform.basis.z * 4.2
    var query := PhysicsRayQueryParameters3D.create(start,end)
    query.exclude = [player.get_rid()]
    var hit := get_world_3d().direct_space_state.intersect_ray(query)
    if not hit.is_empty() and hit["collider"] is StaticBody3D:
        return hit["collider"] as StaticBody3D
    return null

func _interact() -> void:
    var target := _target()
    if target == null:
        note = "Nothing in reach."
        return
    var kind: String = target.get_meta("kind", "")
    var owner: String = target.get_meta("owner", "")
    if kind == "item":
        inventory.append(str(target.get_meta("item")))
        if owner != "":
            notoriety += 5
            honor -= 5
            note = "You stole from " + owner + ". Honor -5, notoriety +5."
        else:
            note = "Picked up " + str(target.get_meta("item")) + "."
        target.queue_free()
    elif kind == "container":
        var contents: Array = target.get_meta("contents", [])
        if contents.is_empty():
            note = target.name + " is empty."
        else:
            for thing in contents:
                inventory.append(str(thing))
            target.set_meta("contents", [])
            note = "Looted " + ", ".join(contents) + "."
            if owner != "":
                notoriety += 5
                honor -= 5
                note += " Theft recorded."
    elif kind == "traveler":
        if fed_traveler:
            note = "Traveler: Thank you for helping me."
        elif inventory.has("Bread") or inventory.has("Apple"):
            var food := "Bread" if inventory.has("Bread") else "Apple"
            inventory.erase(food)
            honor += 10
            fed_traveler = true
            note = "You fed the traveler. Honor +10."
        else:
            note = "Traveler: Please, I need food."
    elif kind == "shrine":
        note = "Guardian's Resolve available!" if honor >= 10 else "Requires at least +10 honor."
    elif kind == "altar":
        note = "Predator's Instinct available!" if honor <= -10 else "Requires at most -10 honor."
    elif kind == "merchant":
        note = "Merchant: These supplies belong to me. Do not steal."
    else:
        note = "Nothing useful here yet."
