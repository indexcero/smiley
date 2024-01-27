extends Node2D
# Velocidad de movimiento en píxeles por segundo
var speed = 350

# Vector de dirección actual
var direction = Vector2.ZERO

func _physics_process(delta):
	# Obtener la entrada del usuario
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	# Normalizar el vector de dirección para que la velocidad sea constante en todas las direcciones
	direction = direction.normalized()
	# Mover el nodo con el vector de dirección, la velocidad y el delta
	position += direction * speed * delta
