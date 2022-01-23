extends Node2D

var destination


func _ready():
	destination = get_node("PortalDestination").get_global_position()

func _on_Area2D_body_entered(body):
	if body.name == "cat1" or body.name == "cat2":
		body.set_position(destination)
