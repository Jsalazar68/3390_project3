extends Area2D


var speed = 600

func _process(delta):
	global_position.y -= speed * delta
	
		
	if position.y > 2000:
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("target"):
		print("Hit!")
		$enemyDies.play()
		area.queue_free()
		await $enemyDies.finished
		queue_free()
