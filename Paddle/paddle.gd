extends RigidBody2D
class_name Paddle

const SIGNALMANAGER = preload("res://singletons/signal_manager.gd")
const DRAG_BOX_MAX: Vector2 = Vector2(395, 0)
const DRAG_BOX_MIN: Vector2 = Vector2(-395, 0)
const RAIL: Vector2 = Vector2(0,0)
var _drag_start: Vector2 = Vector2.ZERO
var _last_dragged_position: Vector2 = Vector2.ZERO
var _dragged_vector: Vector2 = Vector2.ZERO
var _start: Vector2 = Vector2.ZERO
var _last_drag_amount: float = 0.0
var _dragging: bool = false
var _released: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	_start = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	pass
	if _dragging == false:
		return
	else:
		drag()

func grab() -> void:
	_dragging = true
	_drag_start = get_global_mouse_position()
	_last_dragged_position = _drag_start
	SignalManager.on_game_start.emit()

func drag() -> void:
	var gmp = get_global_mouse_position()
	
	_last_drag_amount = (_last_dragged_position - gmp).length()
	_last_dragged_position = gmp
	
	_dragged_vector = gmp - _drag_start
	_dragged_vector.x = clampf(_dragged_vector.x, DRAG_BOX_MIN.x, DRAG_BOX_MAX.x)
	_dragged_vector.y = clampf(_dragged_vector.y, DRAG_BOX_MIN.y, DRAG_BOX_MAX.y)
	global_position = _start + _dragged_vector

func _on_input_event(viewport, event, shape_idx):
	if _dragging == true or _released == true:
		return
	
	if event.is_action_pressed("drag") == true:
		grab()
