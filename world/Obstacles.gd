extends Node2D
onready var lbl = get_tree().current_scene.get_node("Control").get_node("Label")
onready var pipe = $Pipe
onready var width = pipe.get_node("Bottom").texture.get_width()
onready var height = pipe.get_node("Bottom").texture.get_height()
var scored = false

onready var player = get_tree().current_scene.get_node("Player")
	
func _ready():
	lbl.text = "Score: " + str(Globals.score) + "\n" + "Highscore: " + str(Globals.highscore)
	
	pipe.position.y = rand_range(height, Globals.display_height-height)

func _physics_process(delta):
	global_position.x -= Globals.SPEED
	if global_position.x <= -width:
		reset()
	if player.position.x >= global_position.x + width:
		if not scored:
			scored = true
			Globals.score += 1
			if Globals.score > Globals.highscore: 
				Globals.highscore = Globals.score
				Globals.save_game()
			lbl.text = "Score: " + str(Globals.score) + "\n" + "Highscore: " + str(Globals.highscore)
			

func reset():
	pipe.position.y = rand_range(height, Globals.display_height-height)
	global_position.x = Globals.display_width
	scored = false
