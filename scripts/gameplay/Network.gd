extends Node

var http := HTTPRequest.new()
var leaderboard_data := []
func _ready():
	add_child(http)
	http.request_completed.connect(_on_request_completed)


func send_score(name: String, score: int):
	var url = "http://localhost:3000/score"

	var data = {
		"name": name,
		"score": score
	}

	var json = JSON.stringify(data)

	var error = http.request(
		url,
		["Content-Type: application/json"],
		HTTPClient.METHOD_POST,
		json
	)
	if error != OK:
		print("Request error:", error)
	if error != OK:
		print("Request error:", error)

func fetch_scores():
	print("FETCH SCORES CALLED")
	var url = "http://localhost:3000/scores"
	var error = http.request(
		url,
		[],
		HTTPClient.METHOD_GET
	)
	if error != OK:
		print("Request error:", error)
	
	print("HTTP REQUEST ERROR:", error)


func _on_request_completed(result, response_code, headers, body):
	var text = body.get_string_from_utf8()
	print("RAW RESPONSE:", text)
	var leaderboard = JSON.parse_string(text)
	print("Server response:", text)
	print("Leaderboard: ", leaderboard)

	leaderboard_data = leaderboard
	
