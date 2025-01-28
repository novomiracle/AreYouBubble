extends Sprite2D

@export var hp:int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if hp <= Global.life:
		texture = load("res://art/ui/Heart full.png")
	else:
		texture = load("res://art/ui/Heart lost.png")
