extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func pause():
	show()
	get_tree().paused = true

func _input(event):
	if Input.is_action_just_pressed("pause") and !get_tree().paused:
		pause()
		print("escape pressed for pausing")
	elif Input.is_action_just_pressed("pause") and get_tree().paused:
		_on_texture_button_pressed()
		print("escape pressed for resuming")


func _on_texture_button_pressed() -> void:
	hide()
	get_tree().paused = false
