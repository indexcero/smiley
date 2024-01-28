extends Sprite2D


func _on_turbo_area_body_entered(body):
	queue_free()
