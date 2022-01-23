extends Node2D


func _on_Area2D_body_entered(body: Node):
	if Options.floor1 == true:
		Options.motion.y -= 1000 # Replace with function body.
