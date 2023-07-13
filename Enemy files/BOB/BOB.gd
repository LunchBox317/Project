extends CharacterBody2D

var player = null
@onready var E : Sprite2D = $EButton

func _physics_process(delta):
	if player != null:
		if (player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = false
		elif (player.position.x - position.x) > 0:
			$AnimatedSprite2D.flip_h = true



func _on_area_2d_body_entered(body):
	$AnimatedSprite2D.visible = true
	$AnimationPlayer.play("spawn_in")
	$EButton.visible = true
	player = body


func _on_area_2d_body_exited(body):
	$AnimationPlayer.play("spawn_out")
	$EButton.visible = false
	





func _on_animation_player_animation_finished(anim_name):
	if anim_name == "spawn_in":
		$AnimationPlayer.play("idle")
	if anim_name == "spawn_out":
		$AnimatedSprite2D.visible = false



