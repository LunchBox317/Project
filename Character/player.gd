extends CharacterBody2D

var in_dialogue = false
@export var speed : float = 200.0
@export var guy : CharacterBody2D
@onready var interact_circle : Area2D = $Interact_Circle
@onready var sprite : Sprite2D = $Sprite2D

@export var animation_tree: AnimationTree

var lookingLeft = false
var lookingRight = true
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var hasDoubleJumped : bool = false
var animation_locked: bool = false
var in_air: bool = false
var direction : Vector2 = Vector2.ZERO
var health: int = 10

func _ready():
	animation_tree.active = true
	
	


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		in_air = true
	

	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("left", "right", "up", "down")
	if Global.in_dialogue == true:
		return
	else:
		if direction.x: #!= 0 && animated_sprite.animation != "jump-end":
			velocity.x = direction.x * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
		


	move_and_slide()
	update_Animation()
	change_Direction()
	

func take_damage(amount):
	animation_tree["parameters/playback"].travel("hurt")
	health -= amount
	if health <= 0:
		print("DEAD")

func change_Direction():
	if direction.x > 0:
		changeDirectionRight()
	elif direction.x < 0:
		changeDirectionLeft()

	
func update_Animation():
	animation_tree.set("parameters/run/blend_position", direction.x)
	
		
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
				



		
func take_Ypush(push):
	velocity.y = push
	
func take_Xpush(push):
	velocity.x = push





