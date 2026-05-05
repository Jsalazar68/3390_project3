extends Node

var words: Array[String] = [
	"apple", "banana", "cherry", "dragon", "elephant",
	"forest", "galaxy", "horizon", "island", "jungle",
	"kitten", "lion", "mountain", "nebula", "ocean",
	"planet", "quartz", "rocket", "sunrise", "tiger",
	"umbrella", "volcano", "whisper", "xylophone", "yellow",
	"zebra", "anchor", "bridge", "canyon", "desert",
	"energy", "feather", "guitar", "hammer", "iceberg",
	"jacket", "kangaroo", "lantern", "mirror", "notebook",
	"orange", "puzzle", "quokka", "rainbow", "satellite",
	"tornado", "universe", "village", "window", "yogurt",
	"zephyr", "breeze", "castle", "diamond", "ember",
	"flame", "glacier", "harbor", "insect", "journey"
]

func get_prompt() -> String:
	var word_index = randi() % words.size()
	var word = words[word_index]
	return word
