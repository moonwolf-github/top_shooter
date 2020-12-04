extends KinematicBody2D

const WALK_SPEED = 10000
#const WALK_SPEED = 10000
const ROTATE_SPEED = 5

export (PackedScene) var Bullet

func _ready():
    pass # Replace with function body.

func _physics_process(delta):
    var velocity = Vector2.ZERO
    var angle = 0.0
    
    if Input.is_action_pressed("fire"):
        var b = Bullet.instance()
        owner.add_child(b)
        b.transform = $Muzzle.global_transform
        #b.rotation = $Muzzle.global_rotation
    
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
    move_and_slide_with_snap(velocity * WALK_SPEED * delta, Vector2(0, 0), Vector2(0, 0))
        
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
