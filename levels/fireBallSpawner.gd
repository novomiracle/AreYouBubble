extends Node2D

@export var player:Node2D
var fireball = load("res://scenes/fireball.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	if !Dialogue.talking:
		var inst = fireball.instantiate()
		inst.position.y = randi_range(100,-832)
		inst.position.x = player.position.x + 1000
		add_child(inst)
