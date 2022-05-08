extends Area2D

var speed = 160
var positiveXVelocity = true

func _process(delta):
	if positiveXVelocity:
		position.x += speed * delta
	else:
		position.x -= speed * delta


func _on_Bullet_body_entered(body):
	if body.get_name() == "Ground":
		queue_free()
	elif body.get_name() == "Enemy1":
		get_tree().queue_delete(body)
