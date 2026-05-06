extends Control

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/Game.tscn")


func _on_leaderboard_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/game/Score.tscn")


func _on_exit_button_pressed() -> void:
	get_tree().quit()
