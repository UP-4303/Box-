extends KinematicBody2D

var score = 0
var velocity = Vector2.ZERO
var speed = 200
var jumpForce = 600
var gravity = 40

var moveRight = [false,false,false]
var moveLeft = [false,false,false]
var moveUp = [false,false,false]

var facingPositiveX = true

func _process(_delta):
	moveRight[0] = Input.is_action_just_pressed("move_right")
	moveRight[1] = Input.is_action_pressed("move_right")
	moveRight[2] = Input.is_action_just_released("move_right")
	
	moveLeft[0] = Input.is_action_just_pressed("move_left")
	moveLeft[1] = Input.is_action_pressed("move_left")
	moveLeft[2] = Input.is_action_just_released("move_left")
	
	moveUp[0] = Input.is_action_just_pressed("move_up")
	moveUp[1] = Input.is_action_pressed("move_up")
	moveUp[2] = Input.is_action_just_released("move_up")

func _physics_process(delta):
	velocity.x = 0
	
	if moveRight[1]:
		velocity.x += speed
		facingPositiveX = true
	if moveLeft[1]:
		velocity.x -= speed
		facingPositiveX = false
	
	if is_on_floor() and moveUp[1]:
		velocity.y -= jumpForce
	
	if moveUp[2]:
		if velocity.y < -gravity:
			velocity.y = -gravity
	
	if not is_on_floor():
		velocity.y += gravity
	
	velocity = move_and_slide(velocity, Vector2.UP)
