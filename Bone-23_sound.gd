extends RigidBody2D

var is_playing = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	var sonidos = ["res://sound_effects/efe 7-6-Audio 1.wav","res://sound_effects/efe 8-6-Audio 1.wav","res://sound_effects/efe 9-6-Audio 1.wav","res://sound_effects/efe 10-6-Audio 1.wav"]
	if !is_playing:
		$AudioStreamPlayer2D.load(sonidos[randi_range(0,3)])
		$AudioStreamPlayer2D.play()
	is_playing = 1
	



func _on_audio_stream_player_2d_finished():
	is_playing = 0
