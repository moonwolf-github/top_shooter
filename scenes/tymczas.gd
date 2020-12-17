extends Node

func _process(_delta):
    if get_tree().paused:
        if Input.is_action_pressed("exit"):
            get_tree().quit()
