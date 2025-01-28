extends Node2D

@export var characteristic:String
@export var agrees:bool
var used = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_change_level_area_entered(area: Area2D) -> void:
	if !used && area.name == "player":
		Global.characterstics.push_front(characteristic)
		Global.agrees = agrees
		used = true
	
