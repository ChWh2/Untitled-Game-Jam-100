class_name TwoGame
extends Node2D

var finished : bool = false

var reachedFlag = false

func _on_body_entered(body):
	if body == $Player:
		reachedFlag = true
		finished = true
