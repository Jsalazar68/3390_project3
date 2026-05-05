extends Sprite2D

@onready var prompt = $RichTextLabel

@export var speed: float = 1
@export var blue: Color = Color("#0000ffff")
@export var red: Color = Color("#ff0000ff")

var prompt_text: String

func _ready() -> void:
	prompt.bbcode_enabled = true
	prompt_text = PromptList.get_prompt()
	prompt.text = prompt_text

func _physics_process(delta: float) -> void:
	global_position.y += speed

func set_next_char_color(next_char_index: int, is_correct: bool):
	var before := prompt_text.substr(0, next_char_index)
	var current := prompt_text.substr(next_char_index, 1)
	var after := prompt_text.substr(next_char_index + 1)

	var result := ""

	if next_char_index > 0:
		result += get_bbcode_start_color_tag(blue) + before + get_bbcode_end_color_tag()

	if current != "":
		if is_correct:
			result += get_bbcode_start_color_tag(blue) + current + get_bbcode_end_color_tag()
		else:
			result += get_bbcode_start_color_tag(red) + current + get_bbcode_end_color_tag()

	result += get_bbcode_start_color_tag(Color.WHITE) + after + get_bbcode_end_color_tag()
	prompt.text = result

func get_bbcode_start_color_tag(color: Color) -> String:
	return "[color=" + color.to_html(false) + "]"

func get_bbcode_end_color_tag() -> String:
	return "[/color]"

func get_prompt() -> String:
	return prompt_text
