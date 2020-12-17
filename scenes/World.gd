extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
    var Enemy = load("scenes/Enemy.tscn")
    var enemy = Enemy.instance()
    add_child(enemy)


func end_game(player_win):
    if player_win:
        $Label.text = "WYGRANA!"
    $Label.visible = true
    get_tree().paused = true
