extends Node
func _ready():
	pass
	
	
func _process(delta):
	pass
	#hisilj
func _on_start_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")
	
func _on_scores_pressed():
	get_tree().change_scene_to_file("res://Scenes/Score.tscn")
	
func _on_exit_pressed():
	pass
