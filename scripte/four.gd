extends Area2D

var etat_inv =false
var fer = false
var charbon = false

signal fer_poser()
signal charbon_poser()

signal fer_pris()
signal charbon_pris()

func _ready() -> void:
	$craft_canvas/area_charbon.visible = false
	$craft_canvas/area_fer.visible = false
	
func _process(delta: float) -> void:
	if fer and charbon :
		$craft_canvas/area_validation.visible = true
	else:
		$craft_canvas/area_validation.visible = false
	print(etat_inv)

func _on_action(inv,item):
	
	if item == "fer" and fer == false:
		fer = true
		emit_signal("fer_poser")
		print("tu a poser le fer")
	elif item == "charbon" and charbon == false :
		charbon = true
		$Sprite_four.texture = load("res://image/machines/four/foure_plein.png")
		emit_signal("charbon_poser")

	_update_texture()
	

func _update_texture():
	if fer == true:
		$craft_canvas/area_fer/icone_item_fer/icone_fer.visible = true
	else:
		$craft_canvas/area_fer/icone_item_fer/icone_fer.visible = false
	
	if charbon ==true :
		$Sprite_four.texture = load("res://image/machines/four/foure_plein.png")
		$craft_canvas/area_charbon/icone_item_charbon/icone_charbon.visible = true
	else:
		$Sprite_four.texture = load("res://image/machines/four/foure_vide.png")
		$craft_canvas/area_charbon/icone_item_charbon/icone_charbon.visible = false
		
	if charbon or fer :
		$craft_canvas/area_charbon.visible = true
		$craft_canvas/area_fer.visible =true
	elif fer == false and charbon == false :
		$craft_canvas/area_charbon.visible = false
		$craft_canvas/area_fer.visible = false
		
func _on_area_fer_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and fer and not etat_inv :
		emit_signal("fer_pris")
		fer = false
		_update_texture()
	pass 

func _on_area_charbon_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and charbon and not etat_inv :
		emit_signal("charbon_pris")
		charbon = false
		_update_texture()
	pass 

func _on_pelican_etat_inv(inv: bool) -> void:
	etat_inv = inv
	pass 

func _on_area_validation_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		fer = false
		charbon = false
		_update_texture()
		$craft_canvas/area_validation.visible = false
		$craft_canvas/chargement.visible = true
		$craft_canvas/chargement/Animation_chargement.play("chargement")
		await $craft_canvas/chargement/Animation_chargement.animation_finished
		$craft_canvas/Area_lingot.visible = true
		
