extends Node

#@onready var score_label = $ScoreLabel
#var name_label
var score_array = []
var name_array = []
var index: int = 0
func _ready():
	# Fetch scores from server when scene starts
	Network.fetch_scores()
	await get_tree().create_timer(0.5).timeout # small delay to let request finish
	display_scores()

func display_scores():
	# latest_scores is a list of dictionaries from network.gd
	print(Network.leaderboard_data)
	print(Network.leaderboard_data.size()) 
	var text = ""
	for entry in Network.leaderboard_data:
		score_array.append(str(entry.score)) 
		name_array.append(entry.name)
		
		index = index + 1
		
	
	$Scores/score_1.text = score_array[0]
	$Name/name_1.text = name_array[0]
	$Scores/score_2.text = score_array[1]
	$Name/name_2.text = name_array[1]
	$Scores/score_3.text = score_array[2]
	$Name/name_3.text = name_array[2]
	

		
	
