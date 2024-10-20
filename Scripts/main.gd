class_name mainScene
extends Node3D

enum playerMode{TWO_DIMENSION,THREE_DIMENSION}
var playerState : playerMode = playerMode.TWO_DIMENSION

@onready var Camera : camera = $CamYRot/Camera3D
@onready var player : Player = $Player

func switchCameraFocus(targetNode : Node3D, isTwoD : bool):
	if isTwoD:
		playerState = playerMode.TWO_DIMENSION
	else:
		playerState = playerMode.THREE_DIMENSION
	Camera.followPoint = targetNode
