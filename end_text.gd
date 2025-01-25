extends CanvasLayer

var chars = ""
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in Global.characterstics:
		chars += i
	$RichTextLabel.text = "you " + chars
	

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		$RichTextLabel.visible = false
		$"You?".visible = true
		$yes.visible = true
		$no.visible = true
		$yes.disabled = false
		$no.disabled = false


func _on_no_pressed() -> void:
	Global.sceneSwitcher.retry()


func _on_yes_pressed() -> void:
	Global.sceneSwitcher.end()
