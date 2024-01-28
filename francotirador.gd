extends Node2D

const obj_bullet = preload("res://bullet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func shoot(direction:float,speed:float):
	var new_bullet = obj_bullet.instantiate()
	new_bullet.velocity = Vector2(speed, 0).rotated(deg_to_rad(direction))
	new_bullet.position = position
	get_parent().add_child(new_bullet)


func _on_timer_timeout():
	shoot(randf_range(0, -180),600)
