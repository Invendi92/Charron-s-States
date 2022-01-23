extends KinematicBody2D

export var id = 0

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALL = 1500
const MAXSPEED = 300
const JUMPFORCE = 590
const ACCEL = 200

var follow_cam : Camera2D
var facing_right = true
var player = get_position()
func _ready():
	follow_cam = get_node("/root/splitscreen_component/GridContainer/container1/Viewport1/Camera2D")
	pass

func _physics_process(delta):
	if Options.motion2.y < MAXFALL:
		Options.motion2.y += GRAVITY
#		if get_position().y > 800:
#			get_tree().reload_current_scene()

	Options.motion2.x = clamp(Options.motion2.x, -MAXSPEED, MAXSPEED)
	if Input.is_action_pressed("Right"):
		Options.motion2.x = ACCEL
		$cat1.play("run")
		$cat1.flip_h = false
	elif Input.is_action_pressed("Left"):
		Options.motion2.x = -ACCEL
		$cat1.play("run")
		$cat1.flip_h = true
	else:
		$cat1.play("stand")
		Options.motion2.x = lerp(Options.motion2.x, 0, 0.2)
	Options.floor2 = false
	if is_on_floor():
		Options.floor2 = true
		if Input.is_action_pressed("Jump"):
			Options.motion2.y -= JUMPFORCE
			
		
	Options.motion2 = move_and_slide(Options.motion2, Vector2.UP)
	
func _process(delta):
	follow_cam.global_position = global_position
	
func _input(event):
	if event.is_action_pressed('ui_cancel'):
		get_tree().change_scene("res://Menu.tscn")
