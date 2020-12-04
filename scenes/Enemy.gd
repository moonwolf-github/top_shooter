extends KinematicBody2D

export (PackedScene) var Bullet
var shooting = false

# Called when the node enters the scene tree for the first time.
func _ready():
    pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
    if get_parent() and not shooting:
        shooting = true
        var b = Bullet.instance()
        get_parent().add_child(b)
        b.transform = $Muzzle.global_transform
        $FireTimer.stop()
        $FireTimer.start(1.0 / b.Rate)

func _on_FireTimer_timeout():
    shooting = false
