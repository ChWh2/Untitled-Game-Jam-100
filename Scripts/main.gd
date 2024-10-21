class_name mainScene
extends Node3D

enum playerMode{TWO_DIMENSION,THREE_DIMENSION, TRANSITIONING_TWO, TRANSITIONING_THREE}
var playerState : playerMode = playerMode.TWO_DIMENSION

@onready var Camera : camera = $CamYRot/Camera3D
@onready var player : Player = $Player

func switchCameraFocus(targetNode : Node3D, isTwoD : bool):
	if isTwoD:
		playerState = playerMode.TRANSITIONING_TWO
	else:
		playerState = playerMode.TRANSITIONING_THREE
	Camera.followPoint = targetNode
	Camera.atTarget = false

func finishTransition():
	if playerState == playerMode.TRANSITIONING_TWO:
		playerState = playerMode.TWO_DIMENSION
	elif playerState == playerMode.TRANSITIONING_THREE:
		playerState = playerMode.THREE_DIMENSION
