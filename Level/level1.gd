extends Node2D
var brick_scene: PackedScene = preload("res://Brick/brick.tscn")
var ball_scene: PackedScene = preload("res://Ball/ball.tscn")
var paddle_scene: PackedScene = preload("res://Paddle/paddle.tscn")
var ball
var paddle
@onready var ball_spawn = $BallSpawn
@onready var paddle_spawn = $PaddleSpawn
var tile_grid = [
	[1,1,1,1,1,1,1,1,1,1,1,1],
	[1,1,1,1,1,1,1,1,1,1,1,1],
	[1,1,1,1,1,1,1,1,1,1,1,1],
	[1,1,1,1,1,1,1,1,1,1,1,1],
	[1,1,1,1,1,1,1,1,1,1,1,1],
]

# Called when the node enters the scene tree for the first time.
func _ready():
	fill_grid()
	spawn_ball()
	spawn_paddle()
	GameManager.set_score(0)
	GameManager.set_lives(3)
	GameManager.on_ball_miss.connect(on_ball_miss)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fill_grid():
	for i in range(tile_grid.size()):
		for j in range(tile_grid[i].size()):
			var brick = brick_scene.instantiate()
			brick.global_position = Vector2((j * 64) + 220, (i * 40) + 90)
			add_child(brick)

func spawn_ball() -> void:
	ball = ball_scene.instantiate()
	add_child(ball)
	ball.position = ball_spawn.position
	ball.freeze = true

func spawn_paddle() -> void:
	paddle = paddle_scene.instantiate()
	add_child(paddle)
	paddle.position = paddle_spawn.position

func on_ball_miss() -> void:
	if GameManager._lives > 0:
		ball.queue_free()
		paddle.queue_free()
		spawn_ball()
		spawn_paddle()
	else:
		GameManager.load_level_1()
