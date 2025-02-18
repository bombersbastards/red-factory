extends Node
#
## ========================== #
## ======= VARIABLES ======== #
## ========================== #
#
#var inv_plein := false
#var monte_charge := false
#var item_inv
#
#var TEXTURE_ITEM := {
	#"bois": "res://image/craft/ressource_premiere/bois.png",
	#"charbon": "res://image/craft/ressource_premiere/charbon.png",
	#"fer": "res://image/craft/ressource_premiere/fer.png",
	#"nitrate": "res://image/craft/ressource_premiere/nitrate.png"
#}
#
## ========================== #
## ======== SIGNAUX ========= #
## ========================== #
#
#signal etat(current_char: String)
#signal etat_inv(ETAT_INV: bool)
#signal item(ITEM: String)
#
## ========================== #
## ======= FONCTIONS ======== #
## ========================== #
#
#
#func _process(delta: float) -> void:
	#_monte_charge()
#
## Gère le changement de personnage
#
## Désactive le mouvement si un écran spécifique est actif
#func _on_terminale_ecran_actif(ecran: bool) -> void:
	#mouvement = not ecran
#
## Gère la prise d'un item et son affichage dans l'inventaire du personnage actif
#func _on_spawner_item_pris(ITEM_PRIS: String) -> void:
	#var current_char = CHARACTER[CHARACTER_INDEX]
	#inv_plein = true
	#item_inv = ITEM_PRIS
	#CHARACTER_NODE[current_char]["item"].texture = load(TEXTURE_ITEM[ITEM_PRIS])
	#emit_signal("etat_inv", inv_plein)
#
## Gère l'état du monte-charge
#func _on_montecharge_haut_body_entered(body: Node2D) -> void:
	#monte_charge = true
#
#func _on_montecharge_haut_body_exited(body: Node2D) -> void:
	#monte_charge = false
	#
#func _monte_charge():
	#if Input.is_action_just_pressed("action") and monte_charge:
		#CHARACTER_NODE["goutte"]["item"].texture = null
		#item_inv = null
		#inv_plein = false
		#emit_signal("item", item_inv)
