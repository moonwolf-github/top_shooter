extends EnemyAI
class_name RandomMoveAI

const TURN_CHANCE = 0.2
const MOVE_CHANCE = 0.8
const SHOOT_CHANCE = 0.07
var cur_action = 0
var new_angle = 0.0
var current_angle = 0.0
var rotate_direction = 1
var shooting = false
var make_shot = false

func _init():
    randomize()

func process_ai(delta, rotation):
    if not shooting and randf() < SHOOT_CHANCE:
        shooting = false
        make_shot = true

    if cur_action == 0:
        randomize()
        var new_action = randf()
        #print(new_action)
        if new_action <= TURN_CHANCE:
            cur_action = 1
            new_angle = randf() * 360
            current_angle = fposmod(rotation, 360)
            #print("%f, %f" % [current_angle, new_angle])
            #print("%f (%f), %f = %f" % [current_angle, fposmod(current_angle, 360), new_angle, sin(deg2rad(fposmod(new_angle - current_angle, 360)))])
            if sin(deg2rad(fposmod(new_angle - current_angle, 360))) < 0:
                rotate_direction = -1
            else:
                rotate_direction = 1
        elif new_action <= MOVE_CHANCE:
            cur_action = 2

func finish_rotate():
    cur_action = 0

func finish_move():
    cur_action = 0

func finish_shooting():
    shooting = false
    make_shot = false
