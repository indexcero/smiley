extends Node2D

var body_entered = 0
var turbo = 0
const mus_idle = "res://idle.wav"
const mus_turbo = "res://super_turbo.wav"
const mus_post_turbo = "res://post_turbo.wav"


#signal cambio_counter_vidas 
func _ready():
	$Audio_principal.stream = load(mus_idle)
	$Audio_principal.play()
func _process(delta):
	if turbo:
		aumentar_velocidad()
	else:
		velocidad_normal()  # Ajusta el valor según tus necesidades
	if Globals.counter_vidas <= 0:
		get_tree().change_scene_to_file("res://finaldejuego.tscn")
		

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
	

func aumentar_velocidad():
	# Iterar sobre todos los nodos en la escena
	var rigids = get_tree().get_nodes_in_group("rigid_bodies")  # Ajusta el nombre del grupo según tus nodos
	for rigid in rigids:
		if rigid is RigidBody2D:
			# Obtener el estado de física directo del cuerpo rígido
			rigid.gravity_scale = 8
	$Personaje_principal/SoftBody2D.speed = 8000
	
func velocidad_normal():
	# Iterar sobre todos los nodos en la escena
	var rigids = get_tree().get_nodes_in_group("rigid_bodies")  # Ajusta el nombre del grupo según tus nodos
	for rigid in rigids:
		if rigid is RigidBody2D:
			# Obtener el estado de física directo del cuerpo rígido
			rigid.gravity_scale = 1
	$Personaje_principal/SoftBody2D.speed = 1500


func _on_turbo_area_body_entered(body):
	turbo = 1
	$"Personaje_principal/SoftBody2D/Bone-23/Camera2D/CanvasLayer/turbo_mode".visible = true
	$Audio_principal.stop()
	$Audio_principal.stream = load(mus_turbo)
	$Audio_principal.play()
	$Timer_turbo.start()
	

func _on_timer_turbo_timeout():
	$Timer_turbo.stop()
	$"Personaje_principal/SoftBody2D/Bone-23/Camera2D/CanvasLayer/turbo_mode".visible = false
	print("Turbo finalizado")
	$Audio_principal.stop()
	$Audio_principal.stream = load(mus_post_turbo)
	$Audio_principal.play()
	$Timer_mus_turbo.start()
	turbo = 0




func _on_llegada_area_area_entered(area):
	$Timer_llegada.start()
	


func _on_timer_llegada_timeout():
	get_tree().change_scene_to_file("res://ganarprimernivel.tscn")




func _on_area_enemigo_body_entered(body):
	Globals.counter_vidas = Globals.counter_vidas -1




"""func _on_audio_principal_finished():
	$Audio_principal.play()
"""

func _on_timer_mus_turbo_timeout():
	$Audio_principal.stop()
	$Audio_principal.stream = load(mus_idle)
	$Timer_mus_turbo.stop()
	$Audio_principal.play()
