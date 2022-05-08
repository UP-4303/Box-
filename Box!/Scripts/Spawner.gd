extends Node2D

var timerReset = 3.0
var timer = timerReset
var enemy = load("res://Scenes/Enemy1.tscn").instance()
var positiveXVelocity = true

func _physics_process(delta):
	timer -= delta
	if timer <= 0:
		timer = timerReset
		add_child(enemy)
		positiveXVelocity = Globals.rng.randi_range(0,1)
		enemy.positiveXVelocity = (positiveXVelocity == 1)
		enemy = load("res://Scenes/Enemy1.tscn").instance()
