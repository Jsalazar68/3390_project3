extends Node2D

var words = ["apple", "banana", "cat"]
var current_word = ""
var count: int = 0;
@onready var player = $Player

@onready var bullet_spawn = $Player/bulletSpawn
var bullet_scene = preload("res://Scenes/Bullet.tscn")

func shoot():
	print("SHOOT CALLED")
	
	var bullet = bullet_scene.instantiate()
	print("Bullet created:", bullet)
	
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = $Player/bulletSpawn.global_position


func _ready():
	next_word()
	$game_Over.visible = false




func next_word():
	current_word = words[randi() % words.size()]
	$word_display.text = current_word
	$input.clear()
	print("NEXT CALL")
	$input.release_focus()
	await get_tree().process_frame
	$input.grab_focus()

func stuck_word():
	$input.release_focus()
	await get_tree().process_frame
	$input.grab_focus()



func _on_input_text_submitted(new_text: String) -> void:
	print("ENTER WORKS:", new_text)

	if new_text == current_word:
		print("Correct!")
		count += 1
		shoot()
		next_word()
	else:
		print("Wrong!")
		stuck_word()

func game_over():
	pass


func _on_timer_timeout() -> void:
	print("TIMES UP")
	print("FINAL SCORE: ", count)
	$input.release_focus()
	var score_node := $game_Over/score_display/score_num
	score_node.text = str(count)
	$game_Over.visible = true
	
#func _moveinput(event):
	#if event.is_action_pressed("left") or event.is_action_pressed("right"):
		#return

func _on_submit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Score.tscn")
	var name = $game_Over/nameInput.text
	Network.send_score(name, count)
