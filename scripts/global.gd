extends Node

var life:int = 3;
var respawnPoint:Vector2 = Vector2(511,168);
var sceneSwitcher
var agrees:bool = true
var birds = 0
var characterstics = []
var samaaChar
var coins:int = 0
signal choice
func _ready() -> void:
	sceneSwitcher = get_tree().current_scene
