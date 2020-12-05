extends KinematicBody2D

const WALK_SPEED = 100
export (PackedScene) var Bullet
var ai
var shooting = false
var elapsed = 0.0
onready var screen_size = get_viewport_rect().size

# Called when the node enters the scene tree for the first time.
func _ready():
    ai = RandomMoveAI.new()
    #print(rad2deg(lerp_angle(deg2rad(0), deg2rad(270), 0.5)))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
    ai.process_ai(delta, rotation_degrees)
    #print("%f, %f" % [ai.new_angle, rotation_degrees])
    if ai.cur_action == 2:
        move_and_collide(transform.x * WALK_SPEED * delta)
        position.x = wrapf(position.x, -screen_size.x / 2, screen_size.x / 2)
        position.y = wrapf(position.y, -screen_size.y / 2, screen_size.y / 2)
        elapsed += delta
        if elapsed >= 1:      
            ai.finish_move()
            elapsed = 0.0
    
    if ai.cur_action == 1:
        #print(elapsed)
        rotate(lerp_angle(deg2rad(ai.current_angle), deg2rad(ai.new_angle), elapsed) * delta)
        elapsed += delta
        if elapsed > 1:
            ai.finish_rotate()
            elapsed = 0.0
    #if get_parent() and not shooting:
    #    shooting = true
    #    var b = Bullet.instance()
    #    get_parent().add_child(b)
    #    b.transform = $Muzzle.global_transform
    #    $FireTimer.stop()
    #    $FireTimer.start(1.0 / b.Rate)

func _on_FireTimer_timeout():
    shooting = false
