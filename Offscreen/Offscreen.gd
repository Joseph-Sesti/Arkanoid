extends Area2D

func _on_body_entered(body):
	if body is Ball:
		print("Ball has left screen")
