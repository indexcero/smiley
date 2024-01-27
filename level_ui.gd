extends Control

func _process(delta):
	$GridContainer/cantidad_de_vidas.text = str(Globals.counter_vidas)
	
