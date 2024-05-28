extends RigidBody2D
class_name Ball
const BALL_SPEED: Vector2 = Vector2(2, -2)
var ball_velocity = Vector2(0.5, -2)
var collision_info
@onready var paddle = get_node("/root/Level/Paddle")

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_game_start.connect(on_game_start)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if freeze == false:
		collision_info = move_and_collide(ball_velocity)
		if collision_info:
			var collider = collision_info.get_collider()
			if collider is Paddle:
				var difference = global_position - collider.global_position
				ball_velocity = difference.normalized() * BALL_SPEED
			if collider is Brick:
				collider.destroy()
			ball_velocity = ball_velocity.bounce(collision_info.get_normal())

func on_game_start() -> void:
	freeze = false

func _on_visible_on_screen_notifier_2d_screen_exited():
	GameManager.decrease_lives()

