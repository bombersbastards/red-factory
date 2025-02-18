extends Node2D

var CHARACTER := ["goutte", "pelican"]
var CHARACTER_NODE = {}
var CHARACTER_INDEX := 0
var mouvement := true

func _ready() -> void:
	CHARACTER_NODE = {
		"goutte": {
			"node": $goutte,
			"camera": $goutte/Camera_goutte,
			"animation": $goutte/Animation_goutte,
		},
		"pelican": {
			"node": $pelican,
			"camera": $pelican/Camera_pelican,
			"animation": $pelican/Animation_pelican,
		}
	}
	# Désactivation de la physique pour le Pélican au départ
	CHARACTER_NODE["pelican"]["node"].set_physics_process(false)

func _process(delta: float) -> void:
	
	if mouvement:
		update_character()
	else:
		# Désactiver la physique des personnages quand le mouvement est désactivé
		for char in CHARACTER:
			CHARACTER_NODE[char]["node"].set_physics_process(false)

func update_character() -> void:
	var current_char = CHARACTER[CHARACTER_INDEX]
	CHARACTER_NODE[current_char]["camera"].make_current()
	CHARACTER_NODE[current_char]["node"].set_physics_process(true)

	if Input.is_action_just_pressed("chagement"):
		CHARACTER_NODE[current_char]["node"].set_physics_process(false)
		CHARACTER_INDEX = (CHARACTER_INDEX + 1) % CHARACTER.size()
		current_char = CHARACTER[CHARACTER_INDEX]
		CHARACTER_NODE[current_char]["camera"].make_current()
		CHARACTER_NODE[current_char]["node"].set_physics_process(true)


func _on_goutte_ecran(ecran_actif: bool) -> void:
	mouvement = !ecran_actif
	pass 


#func _on_etagere_selc_possible(selec: bool) -> void:
	#CHARACTER_NODE["pelican"]["node"].set_physics_process(!selec)
	#if !selec == false:
		#CHARACTER_NODE["pelican"]["animation"].play("idle")
	#pass 
