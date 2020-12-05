extends KinematicBody2D

const WALK_SPEED = 100
#const WALK_SPEED = 10000
const ROTATE_SPEED = 5
var shooting = false

export (PackedScene) var Bullet

func _ready():
    pass # Replace with function body.

func _physics_process(delta):
    var velocity = Vector2.ZERO
    var angle = 0.0
    
    if not shooting and Input.is_action_pressed("fire"):
        shooting = true
        var b = Bullet.instance()
        owner.add_child(b)
        b.transform = $Muzzle.global_transform
        $FireTimer.stop()
        $FireTimer.start(1.0 / b.Rate)
 
    if Input.is_action_pressed("exit"):
        get_tree().quit()
        
    if Input.is_action_pressed("forward"):
        velocity += transform.x
    elif Input.is_action_pressed("back"):
        velocity -= transform.x

    if Input.is_action_pressed("left"):
        velocity -= transform.y
    elif Input.is_action_pressed("right"):
        velocity += transform.y
        
    if Input.is_action_pressed("turn_left"):
        angle = -ROTATE_SPEED
    if Input.is_action_pressed("turn_right"):
        angle = ROTATE_SPEED
    
    rotate(angle * delta)
    move_and_slide(velocity * WALK_SPEED)#, Vector2(0, 0), Vector2(0, 0))
        
    #if velocity.length() > 0:
    #    $Player/AnimationTree.set("parameters/Idle/blend_position", velocity.normalized().x)
    #    $Player/AnimationTree.set("parameters/Run/blend_position", velocity.normalized().x)
    #    #print(velocity.normalized().x)
    #    $Player/AnimationTree.get("parameters/playback").travel("Run")
    #    if not walk_sound.playing:
    #        walk_sound.play()
    #else:
    #    $Player/AnimationTree.get("parameters/playback").travel("Idle")
    #    walk_sound.stop()
    #move_and_collide(velocity.normalized() * WALK_SPEED * delta)


func _on_FireTimer_timeout():
    shooting = false
