extends Control
@export var menu: CanvasLayer

var is_paused = false

#func _ready():
 
func _input(event):
	if event.is_action_pressed("Pause"):
		if is_paused == false:
			menu.visible = true
			is_paused = true
			get_tree().paused = true
		elif is_paused == true:
			menu.visible = false
			is_paused = false
			get_tree().paused = false


func _on_resume_pressed():
	is_paused = false
	get_tree().paused = false
	menu.visible = false


func _on_quit_pressed():
	get_tree().paused = false
	get_tree().quit()
