extends CharacterBody2D


const SPEED = 100
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player_chase = false
var player = null
var health = 40
@onready var hit_box: Area2D = $MyHitBox

func _ready():
	gravity = 0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if player_chase == true:
		position.x += (player.position.x - position.x)/SPEED
		velocity.y += gravity * delta
		if (player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = false
			$MyHitBox.x_push = -1000
		elif (player.position.x - position.x) > 0:
			$AnimatedSprite2D.flip_h = true
			$MyHitBox.x_push = 1000
	move_and_slide()

func _on_area_2d_body_entered(body):
	$AnimationPlayer.play("rise")
	player = body
	$AnimatedSprite2D.visible = true

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "rise":
		gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
		player_chase = true
		$AnimationPlayer.play("walk")
		$MyHitBox/CollisionShape2D.disabled = false
		$CollisionShape2D.disabled = false
	if anim_name == "crumble":
		gravity = 0
		$CollisionShape2D.disabled = true
		$AnimatedSprite2D.visible = false
		$MyHitBox/CollisionShape2D.disabled = true
	if anim_name == "death":
		queue_free()


func _on_area_2d_body_exited(body):
	player = null
	player_chase = false
	if health >= 0:
		$AnimationPlayer.play("crumble")
	
func take_damage(amount):
	health -= amount
	if health <= 0:
		$MyHurtBox.queue_free()
		hit_box.monitoring = false
		player_chase = false
		$AnimationPlayer.play("death")
		gravity = 0
		$Area2D.queue_free()
		$CollisionShape2D.disabled = true
