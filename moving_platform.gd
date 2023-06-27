extends Node2D

@export var animation : AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_platform()


func move_platform():
	if Global.open_hatch == true:
		
		animation.play("move_left")
		Global.open_hatch = false
