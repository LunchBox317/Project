extends Area2D

const Balloon = preload("res://Dialogue/balloon.tscn")

@export var dialogue : DialogueResource
@export var dialogue_start : String = "start"

func action():
	var balloon : Node = Balloon.instantiate()
	get_tree().current_scene.add_child(balloon)
	balloon.start(dialogue,dialogue_start)
#		DialogueManager.show_example_dialogue_balloon(dialogue, dialogue_start)
