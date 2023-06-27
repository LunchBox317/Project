extends Node

class_name CharacterStateMachine

@export var current_state: State  
@export var character : CharacterBody2D
@export var animationTree : AnimationTree

var states : Array[State]

func _ready():
	for child in get_children():
		if(child is State):
			states.append(child) 
			child.character = character
			child.playback = animationTree["parameters/playback"]
		else:
			push_warning("Child " + child.name + "is not a State in CharacterStateMachine")

func _physics_process(delta):
	if(current_state.nextState != null):
		switchStates(current_state.nextState)
	current_state.state_process(delta)
		

func switchStates(newState: State):
	if(current_state != null):
		current_state.on_exit()
		current_state.nextState = null
		
	current_state = newState
	current_state.on_enter()
	
func _input(event: InputEvent):
	current_state.state_input(event)
