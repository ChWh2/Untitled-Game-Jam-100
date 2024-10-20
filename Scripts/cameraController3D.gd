class_name camera
extends Camera3D

@onready var main = get_tree().current_scene

@export var followPoint : Node3D
@export var followSpeed : float = .01

var atTarget: bool = true

@onready var camParent = $".."

func _unhandled_input(event):
	if event is InputEventMouseButton:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	elif Input.is_action_just_pressed("ui_cancel"):
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
	if main.playerState == main.playerMode.THREE_DIMENSION: #and camera.fov == FOV / zoom:
		if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			camParent.rotate_y(event.relative.x * -0.01)
			
			rotate_x(event.relative.y * -0.01)
			rotation.x = clamp(rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _process(delta):
	if followPoint:
		if !atTarget:
			var dist = clamp(followSpeed * delta, 0, camParent.position.distance_to(followPoint.global_position))
			camParent.position += camParent.position.direction_to(followPoint.global_position) * dist
		else:
			camParent.position = followPoint.global_position
	else:
		followPoint = $"../../CRT".cameraPoint
