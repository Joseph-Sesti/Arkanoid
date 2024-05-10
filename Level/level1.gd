extends Node2D
var brick_scene: PackedScene = preload("res://Brick/brick.tscn")
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
	GameManager.set_score(0)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func fill_grid():
	for i in range(tile_grid.size()):
		for j in range(tile_grid[i].size()):
			var brick = brick_scene.instantiate()
			brick.global_position = Vector2((j * 64) + 220, (i * 40) + 90)
			add_child(brick)
