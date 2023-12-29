extends RigidBody2D

const BALL_MOVEMENT: Vector2 = Vector2(2,0)
#var paddle_scene: PackedScene = preload("res://Paddle/paddle.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_game_start.connect(on_game_start)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

