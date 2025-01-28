extends Node2D

@export var sky:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "player":
		if sky:
			Global.characterstics.push_front(Global.samaaChar)
		Global.sceneSwitcher.next_level()
