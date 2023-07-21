extends State

class_name GroundState


var jump : float = -300.0

@export var guy : CharacterBody2D
@export var airState : State
@export var fallState : State
@export var timer : Timer 
@export var attack_timer : Timer
@export var hit_box : CollisionShape2D
@export var animation: AnimatedSprite2D
@export var interact_circle : Area2D 
@onready var swing_cooldown : Timer = $SwingCooldown
@export var fall_timer : Timer 

var health = 10
var is_falling = false
var hasSwung = false
var firstAttack = true
var lookingLeft = false
var lookingRight = true
var is_crouching = false

func state_input(event): 
	if Global.in_dialogue == true:
#		return
		pass
	else:
		if(event.is_action_pressed("jump")):  
			jumping()
		if(event.is_action_pressed("attack")):
			if hasSwung == false:
				if is_crouching:
					crouch_attack()
				else:
					attack()	
		if(event.is_action_pressed(("interact"))):
			interact()
		if(event.is_action_pressed("crouch")):
			crouch()
			is_crouching = true
		if(event.is_action_released("crouch")):
			playback.travel("run")
			is_crouching = false
	
		
		
		
func jumping():
	character.velocity.y = jump
	nextState = airState
	playback.travel("jump")		
	timer.stop()
	hasSwung = false
		
func state_process(delta): 
	if(!character.is_on_floor()):
		nextState = fallState
	


func crouch():
	playback.travel("crouch")

func crouch_attack():
	playback.travel("crouch_slash")
	
func interact():
	var actionables = interact_circle.get_overlapping_areas()
	if actionables.size() > 0:
		character.direction.x = -1
		actionables[0].action()
		return
			
func attack():
	if firstAttack == true:
		firstAttack = false
		hasSwung = true
		playback.travel("attack_1")
		hit_box.disabled = false
		attack_timer.start(.1)
		timer.start(.5)
		swing_cooldown.start(.2)
	else:
		firstAttack = true
		hit_box.disabled = false
		hasSwung = true
		playback.travel("attack_2")
		timer.stop()
		attack_timer.start(.1)
		timer.start(.5)
		swing_cooldown.start(.2)
		

func _on_timer_timeout():
	playback.travel("Start")
	firstAttack = true
	hit_box.disabled= true
	timer.stop()

func changeDirectionLeft():
	if lookingLeft == false:
		guy.scale.x = -1
		lookingLeft = true
		lookingRight = false
	elif lookingLeft == true:
		pass
		
func changeDirectionRight():
	if lookingRight == true:
		pass
	elif lookingRight == false:
		guy.scale.x = -1
		lookingRight = true
		lookingLeft = false
		


func _on_attack_swing_timeout():
	hit_box.disabled = true
	attack_timer.stop()
	






func _on_swing_cooldown_timeout():
	hasSwung = false
	swing_cooldown.stop()


