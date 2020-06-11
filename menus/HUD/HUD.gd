extends Control

signal gui_up_pressed
signal gui_up_released
signal gui_down_pressed
signal gui_down_released

func _on_DownButton_button_down():
	emit_signal("gui_down_pressed")

func _on_DownButton_button_up():
	emit_signal("gui_down_released")

func _on_UpButton_button_down():
	emit_signal("gui_up_pressed")

func _on_UpButton_button_up():
	emit_signal("gui_up_released")
