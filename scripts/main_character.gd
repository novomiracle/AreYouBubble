extends CharacterBody2D

var mortal = false
const SPEED = 500.0
var lastFloorFrame = 0
const JUMP_VELOCITY = -1000.0
var respawnPoint:Vector2 = Vector2(511,168)
func _ready() -> void:
	$sprite.play("idle")
func _physics_process(delta: float) -> void:
	if  !Dialogue.talking:
		movement(delta)
func movement(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
	#	lastFloorFrame = 0
	#else:
		#lastFloorFrame +=1
	#if lastFloorFrame == 1:
		#$sprite.play("fall")
		#print("fell")d
	if velocity.y > 0:
		$sprite.play("fly")
	elif velocity.y == 0:
		$sprite.play("idle")
	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		$sprite.play("jump")
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_released("jump"):
		velocity.y = max(0,velocity.y)

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction == -1:
		scale.y = -0.75
		rotation_degrees =180
	elif direction == 1:
		scale.y = 0.75
		rotation_degrees = 0
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.name == "hurt" && mortal:
		Global.life -= 1
		position = Global.respawnPoint
		if Global.life == 0:
			Global.sceneSwitcher.death()
			Global.coins = 0
			Global.life = 3
			Global.birds = 0
	elif area.name == "jump":
		velocity.y = min(velocity.y,0)-1500
