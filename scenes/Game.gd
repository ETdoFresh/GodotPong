extends Node2D

onready var hud = get_node("HUD")

var scorePlayerOne = 0
var scorePlayerTwo = 0

var maxScore = 3

func _ready():
	updateScore()
	start_new_round()

func _process(delta):
	if $StartTimer.time_left > 1:
		get_node("HUD/CountdownContainer/CenterContainer/ActionText").set_text(str(round($StartTimer.time_left)))

func _on_Field_goalLeft():
	scorePlayerTwo += 1
	updateScore()
	print("Score Player Two")
	if scorePlayerTwo < maxScore:
		start_new_round()
	else:
		show_winner("You Lose")

func _on_Field_goalRight():
	scorePlayerOne += 1
	updateScore()
	print("Score Player One")
	if scorePlayerOne < maxScore:
		start_new_round()
	else:
		show_winner("You Win")
		
func start_new_game():
	scorePlayerOne = 0
	scorePlayerTwo = 0
	updateScore()
	$FinalScreen.set_visible(false)
	start_new_round()

func start_new_round():
	$Ball.reset()
	$Racket.set_position(Vector2(50, 256))
	$Racket2.set_position(Vector2(974, 256))
	hud.get_node("CountdownContainer").set_visible(true)
	$StartTimer.start()

func _on_StartTimer_timeout():
	hud.get_node("CountdownContainer").set_visible(false)
	$Ball.set_start_direction()
	$StartTimer.stop()
	
func updateScore():
	hud.get_node("PointsDisplay/ScorePlayerOne").set_text(str(scorePlayerOne))
	hud.get_node("PointsDisplay/ScorePlayerTwo").set_text(str(scorePlayerTwo))

func show_winner(message):
	$FinalScreen.set_visible(true)
	$FinalScreen.get_node("VBoxContainer/ResultMessage").set_text(message)
	

func _on_FinalScreen_new_round():
	start_new_game()

func _on_FinalScreen_exit():
	get_tree().quit()
