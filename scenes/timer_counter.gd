extends CanvasLayer

var time = 120
# Called when the node enters the scene tree for the first time.
var grad = load("res://levels/grad.tscn")
func _on_timer_timeout() -> void:
	$time.text = str(time)
	if !Dialogue.talking:
		time -= 1
	if time == 0:
		var inst = grad.instantiate();
		inst.position = Vector2(754,-8318)
		get_parent().add_child(inst)
		time = 120
