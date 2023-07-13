extends State

class_name FallState

@export var fallState : State
@export var groundState : State
@onready var fall_timer : Timer = $FallTimer
var timercountdown = false

func on_enter():

		fall_timer.start(.2)

		timercountdown = false
		
func on_exit():
	if timercountdown:
		playback.travel("jump_end")
	else:
		pass
		


func state_process(delta): 
	if(character.is_on_floor()):
		nextState = groundState
		fall_timer.stop()
		


func _on_fall_timer_timeout():
	playback.travel("falling")
	timercountdown = true
	
