extends RigidBody2D

const BALL_SPEED: Vector2 = Vector2(1, -4)
var ball_velocity = Vector2(0.5, -2)
@onready var paddle = get_node("/root/Level/Paddle")

# Called when the node enters the scene tree for the first time.
func _ready():
	SignalManager.on_game_start.connect(on_game_start)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if freeze == false:
		var collision_info = move_and_collide(ball_velocity)
		if collision_info:
			var collider = collision_info.get_collider()
			if collider.collision_layer == 2:
				var difference = global_position - paddle.global_position
				ball_velocity = difference.normalized() * BALL_SPEED
				print(ball_velocity)
			#var reflect = collision_info.get_remainder().bounce(collision_info.get_normal())
			ball_velocity = ball_velocity.bounce(collision_info.get_normal())
			#move_and_collide(reflect)
			

func on_game_start() -> void:
	freeze = false
