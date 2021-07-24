extends KinematicBody2D

var velocity = Vector2(0,0)
const SPEED = 180
const GRAVITY = 35
const JUMPFORCE = -750

func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("Left"):
		velocity.x = - SPEED
	#if not is_on_floor():
	velocity.y = velocity.y + GRAVITY
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMPFORCE
	velocity = move_and_slide(velocity,Vector2.UP)
	velocity.x = lerp(velocity.x,0,0.2)
