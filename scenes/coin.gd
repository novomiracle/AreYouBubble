extends Node2D





func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "hitbox":
		Global.coins +=1
		queue_free()
