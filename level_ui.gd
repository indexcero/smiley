extends Control

func _process(delta):
	$GridContainer/cantidad_de_vidas.text = "[center]" +str(Globals.counter_vidas)+"[/center]"
	
	
