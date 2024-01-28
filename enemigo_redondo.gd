extends Node2D

var body_entered = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is RigidBody2D and !body_entered:
		Globals.counter_vidas = Globals.counter_vidas - 1
		body_entered = 1
		$Timer_enemigo_redondo.start()
		



func _on_timer_enemigo_redondo_timeout():
	body_entered = 0
	$Timer_enemigo_redondo.stop()
