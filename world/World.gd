extends Node2D

func _on_Button_pressed():
	get_tree().paused = true
	$Control/ResumeButton.visible = true
	$Control/ResumeButton.disabled = false
	$Control/ColorRect.visible = true
	$Control/ResetScore.visible = true

func _on_ResumeButton_pressed():
	get_tree().paused = false
	$Control/ResumeButton.visible = false
	$Control/ResumeButton.disabled = true
	$Control/ColorRect.visible = false
	$Control/ResetScore.visible = false

func _on_ResetScore_pressed():
	Globals.highscore = 0
	Globals.score = 0
# warning-ignore:return_value_discarded
	get_tree().reload_current_scene()
	get_tree().paused = false
	Globals.save_game()
