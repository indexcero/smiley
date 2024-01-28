extends Area2D

var velocity: Vector2 = Vector2()
var duration= 30

func _process(delta):
	position+= velocity * delta 
	duration -= delta
	if duration <= 0:
		queue_free()
 
func _on_body_entered(body):
	if body is RigidBody2D :
		Globals.counter_vidas = Globals.counter_vidas - 1
		queue_free()
