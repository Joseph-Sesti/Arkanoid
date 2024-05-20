extends CanvasLayer
@onready var game_ui = $"."
@onready var score_label = $MarginContainer/VBoxContainer/Score
@onready var lives_label = $MarginContainer/VBoxContainer/Lives

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_score_updated.connect(on_score_updated)
	GameManager.on_ball_miss.connect(on_ball_miss)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_score_updated() -> void:
	score_label.text = "Score: " + str(GameManager.get_score())

func on_ball_miss() -> void:
	lives_label.text = "Lives: " + str(GameManager.get_lives())
