extends Node2D

var Enemy = preload("res://Scenes/game/Enemys.tscn")

var difficulty: int = 0
var words = ["apple", "banana", "cat"]
var current_word = ""
var count: int = 0;
@onready var player = $Player
#@onready var target_spawn = $targetSpawn
@onready var enemy_container = $EnemyContainer
@onready var spawn_enemy_container = $EnemySpawnContainer
@onready var bullet_spawn = $Player/bulletSpawn
@onready var spawn_timer = $SpawnTimer
@onready var game_over_screen = $game_Over
var bullet_scene = preload("res://scenes/game/Bullet.tscn")
var target_scene = preload("res://scenes/game/Target.tscn")
func shoot():
	print("SHOOT CALLED")
	
	var bullet = bullet_scene.instantiate()
	print("Bullet created:", bullet)
	
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = $Player/bulletSpawn.global_position + Vector2(0, -57)


func _ready() -> void:
	next_word()
	randomize()
	spawn_timer.start()
	spawn_enemy()
	$game_Over.visible = false
	$PauseMenu.hide()

	#var target = target_scene.instantiate()
	#add_child(target)
	#target.global_position = target_spawn.global_position




func next_word():
	current_word = words[randi() % words.size()]
	$word_display.text = current_word
	$wordInput.clear()
	print("NEXT CALL")
	$wordInput.release_focus()
	await get_tree().process_frame
	$wordInput.grab_focus()

func stuck_word():
	$wordInput.release_focus()
	await get_tree().process_frame
	$wordInput.grab_focus()



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
	$wordInput.release_focus()
	var score_node := $game_Over/score_display/score_num
	score_node.text = str(count)
	$game_Over.visible = true
	

func _on_spawn_timer_timeout() -> void:
	spawn_enemy()
	

func spawn_enemy():
	var enemy_instance = Enemy.instantiate()
	var spawns = spawn_enemy_container.get_children()
	var index = randi() % spawns.size()
	enemy_container.add_child(enemy_instance)
	enemy_instance.global_position = spawns[index].global_position
	enemy_instance.set_difficulty(difficulty)

func _on_difficulty_timer_timeout() -> void:
	difficulty += 1
	GlobalSignals.emit_signal("difficulty_increased", difficulty)
	print("Difficulty increase to %d" % difficulty)
	var new_wait_time = spawn_timer.wait_time - 0.2
	spawn_timer.wait_time = clamp(new_wait_time, 1, spawn_timer.wait_time)
	spawn_timer.wait_time -= 0.2 



#func _on_lose_area_body_entered(body: Node2D) -> void:
	#$game_Over.visible = true


func _on_lose_area_area_entered(area: Area2D) -> void:
	print("FINAL SCORE: ", count)
	$wordInput.release_focus()
	var score_node := $game_Over/score_display/score_num
	score_node.text = str(count)
	print("After:", score_node.text)
	$game_Over.visible = true

func _on_word_input_gui_input(event: InputEvent) -> void:
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_LEFT or event.keycode == KEY_RIGHT:
			get_viewport().set_input_as_handled()
	

func _on_submit_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scripts/gameplay/score.gd")
	var name = $game_Over/nameInput.text
	Network.send_score(name, count)

func _on_reset_button_pressed() -> void:
	get_tree().reload_current_scene()


func _on_pause_button_pressed() -> void:
	get_tree().paused = true
	$PauseMenu.show()



func _on_continue_button_pressed() -> void:
	$PauseMenu.hide()
	get_tree().paused = false
