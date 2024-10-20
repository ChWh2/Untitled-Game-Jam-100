extends CharacterBody3D

@export var speed = 5.0
@export var jump = 4.5

@onready var camera = $Camera3D
@onready var main = get_tree().current_scene

@export var zoom = 2.0
@export var FOV = 70.0
@export var cameraZoomSpeed = 0.1

func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if main.playerState == main.playerMode.THREE_DIMENSION:
		if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			rotate_y(event.relative.x * -0.01)
			camera.rotate_x(event.relative.y * -0.01)
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	var input_dir : Vector2
	var direction : Vector3
	if main.playerState == main.playerMode.THREE_DIMENSION:
		zoom = 1.0
		if Input.is_action_pressed("Jump") and is_on_floor():
			velocity.y = jump

		input_dir = Input.get_vector("Left", "Right", "Up", "Down")
		direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	else:
		zoom = 2.0
	
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)
	
	move_and_slide()
	
	camera.fov = FOV / zoom
