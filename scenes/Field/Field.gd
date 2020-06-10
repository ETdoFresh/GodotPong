extends Node2D

signal goalLeft
signal goalRight

func _on_GoalLeft_body_entered(body):
	emit_signal("goalLeft")


func _on_GoalRight_body_entered(body):
	emit_signal("goalRight")
