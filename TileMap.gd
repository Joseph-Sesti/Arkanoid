extends TileMap
var brick_scene: PackedScene = preload("res://Brick/brick.tscn")
var tile_grid = [
	[1,1,1,1,1,1,1,1],
	[1,1,1,1,1,1,1,1],
	[1,1,1,1,1,1,1,1],
	[1,1,1,1,1,1,1,1]
]

# Called when the node enters the scene tree for the first time.
func _ready():
	fill_grid()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func fill_grid():
	for i in range(tile_grid.size()):
		for j in range(tile_grid[i].size()):
			tile_map.get_cell_tile_data(i, j)
			#var brick = brick_scene.instantiate()
			#brick.global_position = Vector2(i * 32, j * 16)
			#add_child(brick)
