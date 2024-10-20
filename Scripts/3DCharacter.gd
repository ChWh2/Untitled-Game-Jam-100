class_name Player
extends CharacterBody3D

@export var speed = 5.0
@export var jump = 4.5

@onready var main = get_tree().current_scene

@onready var camera_follow_point = $CameraFollowPoint

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	var input_dir : Vector2
	var direction : Vector3
	if main.playerState == main.playerMode.THREE_DIMENSION:
		if Input.is_action_pressed("Jump") and is_on_floor():
			velocity.y = jump

		input_dir = Input.get_vector("Left", "Right", "Up", "Down")
		direction = (main.Camera.camParent.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	move_and_slide()
