extends Node2D

var body_entered_time = 0

func _on_area_enemigo_body_entered(body):
	if body is RigidBody2D and !body_entered_time:
		Globals.counter_vidas = Globals.counter_vidas - 1
		$Timer_enemigo.start()
	body_entered_time = 1

func _on_timer_enemigo_timeout():
	body_entered_time = 0
	$Timer_enemigo.stop()
