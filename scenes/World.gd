extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
    var Enemy = load("scenes/Enemy.tscn")
    var enemy = Enemy.instance()
    add_child(enemy)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#    pass
