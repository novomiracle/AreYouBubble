extends "res://scripts/npc.gd"
@export var runner:bool
var moving = false
func end_dialogue():
	dialogueOn = false
	if runner:
		moving = true
		scale.y = 1
		rotation_degrees = 0
# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float):
	if moving:
		position.x += 20


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	if moving:
		queue_free()
