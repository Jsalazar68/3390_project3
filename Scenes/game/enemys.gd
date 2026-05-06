extends Area2D

@export var speed = 0.1

func _ready() -> void:
	GlobalSignals.difficulty_increased.connect(handle_difficulty_increase)
	
func _physics_process(delta: float) -> void:
	global_position.y += speed

func handle_difficulty_increase(new_difficlty: int):
	var new_speed = speed + (0.125 * new_difficlty)
	speed = clamp(new_speed, speed, 3)

func set_difficulty(difficulty: int):
	handle_difficulty_increase(difficulty)
