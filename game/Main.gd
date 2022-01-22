extends Node2D

onready var viewport1 = $Viewports/Container1/Viewport1
onready var viewport2 = $Viewports/Container2/Viewport2
onready var camera1 = $Viewports/Container1/Viewport1/Camera2D
onready var camera2 = $Viewports/Container2/Viewport2/Camera2D
onready var map = $Viewports/Container2/Viewport2/Map
# Called when the node enters the scene tree for the first time.
func _ready():
	viewport2.world_2d = viewport1.world_2d
	camera1.target = map.get_node("Player")
	camera2.target = map.get_node("Player2")

