extends State

class_name FallState

@export var fallState : State
@export var groundState : State

func on_enter():
		playback.travel("falling")
		
func on_exit():
	if nextState == groundState:
		playback.travel("jump_end")


func state_process(delta): 
	if(character.is_on_floor()):
		nextState = groundState
