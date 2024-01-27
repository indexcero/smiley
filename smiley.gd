extends Node2D

var body_entered = 0

#signal cambio_counter_vidas 

func _on_area_2d_body_entered(body):
	if !body_entered:
		Globals.counter_vidas = Globals.counter_vidas - 1
		body_entered = 1
		print(Globals.counter_vidas)
		#emit_signal("cambio_counter_vidas", counter_vidas)
		$"Timer_daño".start()


func _on_timer_daño_timeout():
	## Reinciar el contador
	body_entered = 0

func _on_health_2d_body_entered(body):
	Globals.counter_vidas = Globals.counter_vidas + 1
