extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_pressed():
	get_tree().change_scene("res://splitscreen_component.tscn")


func _on_Params_pressed():
	get_tree().change_scene("res://Options.tscn")
	pass # Replace with function body.


func _on_Exit_pressed():
	get_tree().quit()

func _input(event):
	if event.is_action_pressed('ui_cancel'):
		get_tree().quit()
