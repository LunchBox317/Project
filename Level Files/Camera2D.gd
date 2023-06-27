extends Camera2D

@export var animation : AnimationPlayer



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.open_hatch:
		animation.play("camera_shake")
		
