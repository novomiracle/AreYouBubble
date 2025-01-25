extends Button

var path:int
var options
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	options = get_parent()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	print("option")
	Dialogue.dialogueCount = path
	Dialogue.talk(Dialogue.dialogueCount)
	Dialogue.on = true
	Dialogue.dialogueCount +=1
	for i in options.get_children():
		i.visible = false
