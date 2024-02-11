extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pause()
	pass

func pause():
	if Input.is_action_just_pressed("pause") == true:
		if get_tree().paused == false:
			get_tree().paused = true
		elif get_tree().paused == true:
			get_tree().paused = false
