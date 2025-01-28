extends Node2D

var cloudText = [load("res://art/sky/Cloud 1.png"),load("res://art/sky/Cloud 2.png"),load("res://art/sky/Cloud 3.png")]
@export var player:Node2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= 5

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	position.x += 3000
	z_index = randi_range(-1,1)
	position.y = player.position.y +randi_range(-1000,1000)
	$Cloud1.texture = cloudText[randi_range(0,2)]
