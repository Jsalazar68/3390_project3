extends Node
func _ready():
	pass
	
	
func _process(delta):
	pass
	#hi new message
func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes (game screens)/game/Game.tscn")
	
func _on_scores_pressed():
	get_tree().change_scene_to_file("res://scenes (game screens)/game/Score.tscn")
	
func _on_exit_pressed():
	pass
