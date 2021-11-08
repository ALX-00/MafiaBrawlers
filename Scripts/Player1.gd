extends KinematicBody2D
onready var hitbox = get_node("Area2D/Hitbox")
onready var spriteHbox = get_node("Area2D/Hitbox/Sprite")

signal hurted

var velocity = Vector2(0,0)
const SPEED = 350
const GRAVITY = 35
const JUMPFORCE = -750


func _physics_process(delta):
	if Input.is_action_pressed("Right"):
		velocity.x = SPEED
	elif Input.is_action_pressed("Left"):
		velocity.x = - SPEED
	elif Input.is_action_pressed("Attack"):
		hitbox.disabled = false
		spriteHbox.visible = true
	else:
		hitbox.disabled = true
		spriteHbox.visible = false
	#if not is_on_floor():
	velocity.y = velocity.y + GRAVITY
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMPFORCE
	velocity = move_and_slide(velocity,Vector2.UP)
	velocity.x = lerp(velocity.x,0,0.2)



func _on_Area2D_body_entered(body):
	pass # Replace with function body.
