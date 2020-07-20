extends Node2D

onready var size = $Sprite.texture.get_width()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	$Sprite.position.x -= Globals.SPEED
	$Sprite2.position.x -= Globals.SPEED
	
	if $Sprite.position.x <= -size:
		$Sprite.position.x = $Sprite2.position.x+size
		
	if $Sprite2.position.x <= -size:
		$Sprite2.position.x = $Sprite.position.x+size
