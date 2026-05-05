extends Node2D

var words = ["apple", "banana", "cat"]
var current_word = ""
var count: int = 0;

@onready var player = $Player
@onready var bullet_spawn = $bulletSpawn
@onready var enemy_container = $EnemyContainer
@onready var spawn_container = $SpawnContainer

var enemy_scene = preload("res://scenes (game screens)/game/enemy.tscn")
var bullet_scene = preload("res://scenes (game screens)/game/bullet.tscn")

func shoot():
	print("SHOOT CALLED")

	var bullet = bullet_scene.instantiate()
	print("Bullet created:", bullet)

	get_tree().current_scene.add_child(bullet)
	bullet.global_position = $bulletSpawn.global_position


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


func _on_submit_button_pressed() -> void:
	pass


func spawn_enemy():
	var enemy = enemy_scene.instantiate()

	var spawns = spawn_container.get_children()
	var spawn_point = spawns[randi() % spawns.size()]

	enemy.global_position = spawn_point.global_position
	enemy_container.add_child(enemy)


func _on_spawn_timer_timeout() -> void:
	spawn_enemy()
