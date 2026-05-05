extends Area2D


var speed = 600

func _process(delta):
	position.y -= speed * delta

	if position.y > 2000:
		queue_free()
