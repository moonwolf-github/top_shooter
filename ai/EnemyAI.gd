extends Node
class_name EnemyAI

var shooting = false
var make_shot = false
var cur_action = 0

func _init():
    pass # Replace with function body.

func process_ai(delta, rotation):
    print(delta)
