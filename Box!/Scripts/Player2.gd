extends Node2D

var bullet = load("res://Scenes/Bullet.tscn").instance()

func _process(_delta):
	if Input.is_action_just_pressed("fire"):
		add_child(bullet)
		bullet.position = $Player.position
		bullet.positiveXVelocity = $Player.facingPositiveX
		bullet = load("res://Scenes/Bullet.tscn").instance()
