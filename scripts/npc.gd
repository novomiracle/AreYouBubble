extends StaticBody2D

@export_file(".json") var dialogue_accept
@export_file(".json") var dialogue_decline
var isIn:bool = false
var dial;
var dialogueOn:bool = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	dial = load_dialogue(dialogue_accept)
	print("dial")
	if dial["interaction"] == "ready":
		start_dialogue()
	elif dial["interaction"] == "choice":
		Global.choice.connect(start_dialogue)
	Dialogue.end_of_dialogue.connect(end_dialogue)
	#print(load_dialogue())
func end_dialogue():
	dialogueOn = false
func load_dialogue(dialogue):
	var file = FileAccess.open(dialogue,FileAccess.READ)
	return JSON.parse_string(file.get_as_text())
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_released("interact"):
		print(dialogueOn,Dialogue.on)
		if dialogueOn:
			if Dialogue.on:
				print("interact")
				Dialogue.talk(Dialogue.dialogueCount)
				Dialogue.dialogueCount+=1


func start_dialogue():
	Dialogue.npc = self
	dialogueOn = true
	Dialogue.characters = dial.characters
	#Dialogue.change_scene = dial.change_level
	Dialogue.dialogue = dial.dialogue
	Dialogue.start()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "player" && dial["interaction"] == "interact":
		if Global.agrees:
			dial = load_dialogue(dialogue_accept)
		else:
			dial = load_dialogue(dialogue_decline)
		start_dialogue()

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "player":
		isIn = false
