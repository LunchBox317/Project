class_name MyHurtBox
extends Area2D

func _init() -> void:
	collision_layer = 0
	collision_mask = 2
	


func _on_area_entered(hitbox: MyHitBox):
	if hitbox == null:
		return
	if owner.has_method("take_damage"):
		owner.take_damage(hitbox.damage)
	if owner.has_method("take_Ypush"):
		owner.take_Ypush(hitbox.y_push)
	if owner.has_method("take_Xpush"):
		owner.take_Xpush(hitbox.x_push)
