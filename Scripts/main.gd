class_name mainScene
extends Node3D

enum playerMode{TWO_DIMENSION,THREE_DIMENSION}
var playerState : playerMode = playerMode.TWO_DIMENSION

func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_left"):
		if playerState == playerMode.TWO_DIMENSION:
			playerState = playerMode.THREE_DIMENSION
		elif playerState == playerMode.THREE_DIMENSION:
			playerState = playerMode.TWO_DIMENSION
