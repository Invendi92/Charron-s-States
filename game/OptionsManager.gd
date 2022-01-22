extends Node

func _on_MainMenu_pressed() -> void:
	get_tree().change_scene("res://Menu.tscn")
	
func _on_KeyBinding_pressed():
	get_tree().change_scene("res://input_menu/InputMenu.tscn")

func _on_Vsync_pressed():
	Options.Vsync = -Options.Vsync
	OS.set_use_vsync(Options.Vsync)

func _on_SFXSound_value_changed(value):
	Options.sfx_volume = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)

func _on_MainSound_value_changed(value):
	Options.main_volume = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

func _on_MusicSound_value_changed(value):
	Options.musique_volume = value
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musique"), value)

func _input(event):
	if event.is_action_pressed('ui_cancel'):
		get_tree().change_scene("res://Menu.tscn")
