extends CharacterBody2D


@export var speed = 3.0
@export var jumpSpeed = 4.0

@onready var Sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var main = get_tree().current_scene

func _physics_process(delta: float) -> void:
	if velocity.y:
		if(velocity.x > 0):
			Sprite.animation = "FallR"
		elif(velocity.x < 0):
			Sprite.animation = "FallL"
		else:
			Sprite.animation = "Fall"
	elif velocity.x:
		if(velocity.x > 0):
			Sprite.animation = "WalkR"
		elif(velocity.x < 0):
			Sprite.animation = "WalkL"
	else:
		Sprite.animation = "Idle"
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	var direction : float
	if main.playerState == main.playerMode.TWO_DIMENSION:
		if Input.is_action_pressed("Jump") and is_on_floor():
			velocity.y = -jumpSpeed  * 100
		
		direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * speed * 100
	else:
		velocity.x = move_toward(velocity.x, 0, speed * 100)

	move_and_slide()
