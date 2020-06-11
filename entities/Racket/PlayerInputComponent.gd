extends Node

class_name PlayerInputComponent

var player
var up_button = false
var down_button = false

func _ready():
	player = get_parent()
	player.connect("update", self, "handle_input")
	
func handle_input():
	if not "direction" in player:
		return
		
	player.direction = Vector2()
	
	if Input.is_action_pressed("ui_up") || up_button:
		player.direction.y -= 1
	if Input.is_action_pressed("ui_down") || down_button:
		player.direction.y += 1

func _on_HUD_gui_down_pressed():
	down_button = true

func _on_HUD_gui_down_released():
	down_button = false

func _on_HUD_gui_up_pressed():
	up_button = true

func _on_HUD_gui_up_released():
	up_button = false
