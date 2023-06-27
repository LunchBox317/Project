class_name MyHitBox
extends Area2D

@export var damage := 10
@export var y_push := -200
@export var x_push := 0

func _init() -> void:
	collision_layer = 2
	collision_mask = 0



