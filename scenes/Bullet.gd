extends Area2D

var speed = 500

export var Range = 250
export var Rate = 2

var start_pos = Vector2()

func _ready():
    start_pos = position
    $ShootSound.play()

func _physics_process(delta):
    position += transform.x * speed * delta
    if (position - start_pos).length() > Range:
        queue_free()

func _on_Bullet_body_entered(body):
    if body.is_in_group("enemy"):
        body.hit()
    if body.is_in_group("player"):
        body.hit()
    body.queue_free()
    queue_free()
