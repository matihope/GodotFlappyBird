extends Node

const SPEED = 2
var display_width = ProjectSettings.get_setting("display/window/size/width")
var display_height = ProjectSettings.get_setting("display/window/size/height")

var score = 0
var highscore = 0

func _ready():
	load_game()
	randomize()
	
func load_game():
	var save_game = File.new()
	if not save_game.file_exists("user://savegame.save"):
		return 
		
	save_game.open("user://savegame.save", File.READ)
	highscore = parse_json(save_game.get_line())
	save_game.close()
	
func save_game():
	var save_game = File.new()
	save_game.open("user://savegame.save", File.WRITE)
	save_game.store_line(to_json(highscore))
	save_game.close()
