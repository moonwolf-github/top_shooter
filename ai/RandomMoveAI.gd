extends EnemyAI
class_name RandomMoveAI

const TURN_CHANCE = 0.3
const MOVE_CHANCE = 0.7
var cur_action = 0
var new_angle = 0.0
var current_angle = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
    randomize()

func process_ai(delta, rotation):
    if cur_action == 0:
        var new_action = randf()
        #print(new_action)
        if new_action <= TURN_CHANCE:
            cur_action = 1
            new_angle = randf() * 360
            current_angle = rotation
            print("%f, %f" % [current_angle, new_angle])
        elif new_action <= MOVE_CHANCE:
            cur_action = 2

func finish_rotate():
    cur_action = 0

func finish_move():
    cur_action = 0
