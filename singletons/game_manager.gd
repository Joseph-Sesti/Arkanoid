extends Node
signal on_score_updated
signal on_ball_miss
signal on_game_start

#var main_scene: PackedScene = preload("res://Main/main.tscn")
var _high_score: int = 0
var _score: int  = 0
var _lives: int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_score() -> int:
	return _score

func get_high_score() -> int:
	return _high_score

func set_score(num: int) -> void:
	_score = num
	if _high_score < _score:
		_high_score = _score
	on_score_updated.emit()

func increase_score() -> void:
	set_score(_score + 10)

func get_lives() -> int:
	return _lives

func set_lives(num: int) -> void:
	_lives = num
	on_ball_miss.emit()

func decrease_lives() -> void:
	_lives -= 1
	on_ball_miss.emit()
