extends RigidBody2D

const BALL_SPEED: Vector2 = Vector2(2, -2)
var ball_velocity = Vector2(0.5, -2)
var collision_info
@onready var paddle = get_node("/root/Level/Paddle")
@onready var brick_script = load("res://Brick/brick.gd")
@onready var brick_scene = load("res://Brick/brick.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_game_start.connect(on_game_start)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if freeze == false:
		collision_info = move_and_collide(ball_velocity)
		if collision_info:
			var collider = collision_info.get_collider()
			if collider is Paddle:
				var difference = global_position - paddle.global_position
				ball_velocity = difference.normalized() * BALL_SPEED
			if collider is Brick:
				collider.destroy()
				#brick_script.destroy(collider)
			ball_velocity = ball_velocity.bounce(collision_info.get_normal())

func on_game_start() -> void:
	freeze = false
