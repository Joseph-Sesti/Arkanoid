extends Area2D

func _on_body_entered(body):
	if body.is_in_group(GameManager.GROUP_BALL) == true:
		print("Ball has left screen")
