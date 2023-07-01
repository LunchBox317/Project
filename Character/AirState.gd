extends State


class_name AirState

@export var groundState : State
@export var fallState : State
@export var doubleJump : float = -250.0
@export var animation : AnimatedSprite2D
@export var hit_box : CollisionShape2D
@export var attack_timer : Timer
var hasDoubleJumped : bool = false
var hasAirSwung : bool = false

func state_process(delta): 
	if(character.is_on_floor()):
		nextState = groundState
	
		
		
func on_exit():
	if nextState == groundState:
		hasDoubleJumped = false
		hasAirSwung = false
		playback.travel("jump_end")

func double_jump():
	if hasDoubleJumped == false:
		character.velocity.y = doubleJump
		hasDoubleJumped = true
		playback.travel("double_jump")
	else: 
		pass

func state_input(event :InputEvent): 
	if(event.is_action_pressed("jump")):  
		double_jump()
	if(event.is_action_pressed("attack")):
		jump_attack()

func jump_attack():
	playback.travel("jump_attack")
	if not hasAirSwung :
		hit_box.disabled = false
		attack_timer.start(.1)
		hasAirSwung = true
	else:
		pass	
#	timer.start(.5)
	


func _on_timer_timeout():
	pass # Replace with function body.


func _on_attack_swing_timeout():
		hit_box.disabled = true
