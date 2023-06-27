extends CanvasLayer

@export var picture : Sprite2D
@onready var main = $Main


#Play Button

	




#Quit Game
func _on_button_quit_pressed():
	get_tree().quit()
	


#func _on_button_play_focus_entered(button):
#	button.theme_override_colors.font_color('blue')


func _on_button_play_pressed():
	get_tree().change_scene_to_file("res://Level Files/level_1.tscn")
