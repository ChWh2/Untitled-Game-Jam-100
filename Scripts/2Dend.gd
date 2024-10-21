class_name TwoGame
extends Node2D

var finished : bool = false

func _on_body_entered(body):
	if body == $Player:
		$EndScreen.show()
		$EndTimer.start()


func _on_end_timer_timeout():
	finished = true
