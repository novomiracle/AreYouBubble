extends "res://scripts/npc.gd"

@export_file(".json") var neutral
@export var interacti:bool = false
# Called when the node enters the scene tree for the first time.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "player" && interacti:
		if Global.birds == 3:
			dial = load_dialogue(dialogue_accept)
			Global.samaaChar = "kind"
		elif Global.birds == 0:
			dial = load_dialogue(dialogue_decline)
			Global.samaaChar = "apathetic"
		else:
			dial = load_dialogue(neutral)
			Global.samaaChar= "pragmatic"
		start_dialogue()
