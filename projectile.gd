extends CharacterBody2D

@export var direction:Vector2 = Vector2.LEFT
@export var speed:float =100
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = direction.normalized() * speed
	move_and_slide()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_hurt_area_entered(area: Area2D) -> void:
	if area.name == "hitbox":
		queue_free()
