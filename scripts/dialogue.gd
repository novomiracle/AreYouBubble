extends CanvasLayer

var npc
var dialogue = []
var talking = false
var on = false
var dialogueCount = 0
signal end_of_dialogue
var characters
var change_scene:bool
func _ready():
	visible = false
func start():
	for i in $characters.get_children().size():
		$characters.get_child(i).texture = load("res://art/characters/"+ characters[i]+".png")
	visible = true
	on = true
	talking = true
	dialogueCount = 0
	talk(dialogueCount)
	dialogueCount+=1
	print("start")
func talk(count):
	if dialogue.size() >count:
		$chat.text = dialogue[count]["text"]
		print("dialogue",count)
		#var face = load("art/characters/"+dialogue['character'])
		for i in $characters.get_children().size():
			if i == dialogue[count]["character"]:
				$characters.get_child(i).modulate = Color(1, 1, 1)
			else:
				$characters.get_child(i).modulate = Color(0.5, 0.5, 0.5)
		dialogue[count]["character"]
		if "options" in dialogue[count]:
			on = false
			for i in dialogue[count]["options"].size():
				$options.get_child(i).text = dialogue[count]["options"][i].text
				$options.get_child(i).path =  dialogue[count]["options"][i].path
				$options.get_child(i).visible = true
				$options.get_child(i).disabled = false
			print("after",count)
		if "end" in dialogue[count]:
			print("forceEnd")
			dialogueCount = dialogue.size()
	else:
		print("end")
		talking = false
		dialogueCount= 0
		visible = false
		npc.end_dialogue()
		if change_scene:
			Global.sceneSwitcher.next_level()
func _process(delta):
	#if Input.is_action_just_pressed("interact") && on:
	#	print("int")
	#	talk(dialogueCount)
	#	dialogueCount+=1
	pass
