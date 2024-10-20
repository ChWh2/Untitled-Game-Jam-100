class_name CRT
extends StaticBody3D

@onready var cameraPoint : Node3D = $CameraFollowPoint
@export var twoLevel : PackedScene

@onready var screen = $Screen

@onready var main = get_tree().current_scene

var level : TwoGame

var finsihed : bool = false

func _ready():
	level = twoLevel.instantiate()
	screen.add_child(level)

func _process(delta):
	if level.finished and finsihed == false:
		finsihed = true
		main.switchCameraFocus(main.player, false)
