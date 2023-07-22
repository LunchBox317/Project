extends CharacterBody2D

const JUMP_VELOCITY = -400.0
const SPEED = 50
var player = null
var player_chase = false
var health = 20


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if not is_on_floor() and player_chase:
		velocity.x = (player.position.x - position.x)/SPEED

	if player_chase == true:
		velocity.x = (player.position.x - position.x)/SPEED
		
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
	player = body
	player_chase = true


func _on_area_2d_body_exited(body):
	player = null
	player_chase = false
	
func take_damage(amount):
	health -= amount
	if health <= 0:
		$MyHurtBox.queue_free()
		$MyHitBox.monitoring = false
		player_chase = false
		$AnimatedSprite2D.play("death")
#		gravity = 0
		velocity.y = 0
		velocity.x = 0
		$Area2D.queue_free()
		$CollisionShape2D.disabled = true
	

func take_Xpush(push):
	velocity.x = push
		
func take_Ypush(push):
	velocity.y = push

func _on_animated_sprite_2d_animation_finished():
	queue_free()




	
