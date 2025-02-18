extends Area2D

var texture_button = load("res://image/écran_terminale/icone_ressource.png") 
var texture_hover = load("res://image/écran_terminale/icone_ressource_hover.png") 
var onglet_ouvert = false


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	var clic_gauche = Input.is_action_just_pressed("click_gauche")
	if clic_gauche and $OngletRessource.visible== false:
		$OngletRessource.visible= true
	elif clic_gauche and  $OngletRessource.visible== true:
		$OngletRessource.visible= false
	pass


func _on_mouse_entered() -> void:
	$Sprite_boutton_ressource.texture= texture_hover
	pass 


func _on_mouse_exited() -> void:
	$Sprite_boutton_ressource.texture= texture_button
	pass 
