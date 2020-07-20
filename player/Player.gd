extends KinematicBody2D

onready var lbl = get_tree().current_scene.get_node("Control").get_node("Label")
var velocity: Vector2 = Vector2.ZERO
const grv = 200.0
	
func _physics_process(delta):
	velocity.y = min(velocity.y + grv/5.0, grv)  
	var collision_test = move_and_collide(velocity * delta)
	
	if Input.is_action_just_pressed("jump"):
		velocity.y = -500.0
	
	if collision_test != null:
		get_tree().reload_current_scene()
		Globals.score = 0
		lbl.text = "Score: 0\nHighscore: " + str(Globals.highscore)
		
func _process(_delta):
	$Sprite.rotation_degrees = (60.0 * ((velocity.y + 520)/700)) - 30

