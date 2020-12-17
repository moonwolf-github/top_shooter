extends Node2D

onready var Enemy = load("scenes/Enemy.tscn")
onready var screen_size = get_viewport_rect().size

func spawn_enemy():
    var enemy = Enemy.instance()
    var pos = Vector2()
    while (pos - $Player.position).length() < 2:
        print((pos - $Player.position).length())
        pos.x = randf() * screen_size.x
        pos.y = randf() * screen_size.y
    enemy.position = pos
    add_child(enemy)
    
# Called when the node enters the scene tree for the first time.
func _ready():
    spawn_enemy()

func end_game(player_win):
    $Button.visible = true
    if player_win:
        $Label.text = "WYGRANA!"
    $Label.visible = true
    get_tree().paused = true

func _on_Button_pressed():
    $Button.visible = false
    $Player.transform = Transform2D()
    $Label.visible = false
    for child in get_children():
        if child.is_in_group("bullets") or child.is_in_group("enemy"):
            child.queue_free()
    spawn_enemy()
    get_tree().paused = false
