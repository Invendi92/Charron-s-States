extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAXFALL = 1500
const MAXSPEED = 100
const JUMPFORCE = 400
const ACCEL = 100

var facing_right = true
var motion = Vector2()
func _ready():
	pass

func _physics_process(delta):
	if motion.y < MAXFALL:
		motion.y += GRAVITY

	motion.x = clamp(motion.x, -MAXSPEED, MAXSPEED)
	if Input.is_action_pressed("Right"):
		motion.x = ACCEL
		$cat1.play("run")
		$cat1.flip_h = false
	elif Input.is_action_pressed("Left"):
		motion.x = -ACCEL
		$cat1.play("run")
		$cat1.flip_h = true
	else:
		$cat1.play("stand")
		motion.x = lerp(motion.x, 0, 0.2)
	if is_on_floor():
		if Input.is_action_pressed("Jump"):
			motion.y -= JUMPFORCE
			
		
	motion = move_and_slide(motion, Vector2.UP)
