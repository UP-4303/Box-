extends KinematicBody2D

var speed = 150
var gravity = 40
var velocity = Vector2(speed,0)
var positiveXVelocity = true

func _physics_process(_delta):
	if is_on_wall():
		positiveXVelocity = not positiveXVelocity
	
	if positiveXVelocity:
		velocity.x = speed
	else:
		velocity.x = -speed
	
	if not is_on_floor():
		velocity.y += gravity
	else:
		velocity.y = 0
	
	velocity = move_and_slide(velocity, Vector2.UP)


func _on_Area2D_body_entered(body):
	if body.get_name() == "Player":
		get_tree().queue_delete(body)
