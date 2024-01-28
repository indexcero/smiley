extends Control

func _on_repetir_pressed():
	Globals.counter_vidas = 10
	get_tree().change_scene_to_file("res://smiley.tscn")
	
func _input(event):
	if event.is_action_pressed("ui_start"):
		get_tree().change_scene_to_file("res://smiley.tscn")

func _on_salir_pressed():
	get_tree().quit()


func _on_audio_stream_player_finished():
	$AudioStreamPlayer.play()
