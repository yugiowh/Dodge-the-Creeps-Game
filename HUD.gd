extends CanvasLayer

signal start_game

func update_score(score):
	$ScoreLabel.text = str(score)

func show_massage(text):
	$MassageLabel.text = text
	$MassageLabel.show()
	$MessageTimer.start()

	
	
func show_game_over():
	show_massage("Game Over")
	yield($MessageTimer, "timeout")
	$MassageLabel.text = "Dodge the Creeps "
	$MassageLabel.show()
	yield(get_tree().create_timer(1.0), "timeout")
	$Start.show()
	


func _on_Start_pressed():
	$Start.hide()
	emit_signal("start_game")
	
	
func _on_MessageTimer_timeout():
	$MassageLabel.hide()
