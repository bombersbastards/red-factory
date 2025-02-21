extends Area2D

var ITEM_1 =null
var sprite_name = null
var char_inside = false

signal item_1(ITEM_1:String)
signal item_2(ITEM_2:String)
signal item_3(ITEM_3:String)
signal item_4(ITEM_4:String)
signal item_5(ITEM_5:String)
signal item_6(ITEM_6:String)
signal obj_remove_1()
signal obj_remove_2()
signal obj_remove_3()
signal obj_remove_4()
signal obj_remove_5()
signal obj_remove_6()

signal obj_pris(nom_item:String)

signal selc_possible(selec:bool)

signal obj_poser()

var TEXTURE_ITEM = {
	"bois": "res://image/craft/ressource_premiere/bois.png",
	"charbon": "res://image/craft/ressource_premiere/charbon.png",
	"fer": "res://image/craft/ressource_premiere/fer.png",
	"nitrate": "res://image/craft/ressource_premiere/nitrate.png"
}
var ITEM_INSIDE={}
var ecran_sprite_texture = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for sprite in $BoxContainer.get_children():
			ITEM_INSIDE[sprite.name] = {  
				"occuper": false,
				"nom": ""
			}
			

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	emit_signal("selc_possible",$CanvasGroup.visible)
	$CanvasGroup.visible = char_inside
	pass

func _on_action(inv,item):
	if item != null and item in TEXTURE_ITEM:
		for sprite in $BoxContainer.get_children():
			if sprite.texture == null:  # Trouve le premier emplacement libre
				sprite.texture = load(TEXTURE_ITEM[item])  # Assigne la texture
				sprite_name = sprite.name
				ITEM_INSIDE[sprite.name]["nom"] = item  # Stocke le nom de l'obje
				emit_signal("obj_poser")
				ITEM_INSIDE[sprite.name]["occuper"] = true # Marque comme occupé
				_update_texture(sprite.name)  # Mise à jour de la texture et émission du signal
				print(ITEM_INSIDE)
				break
		

		pass
	
func _update_texture(sprite_name: String):
	if ITEM_INSIDE.has(sprite_name) and ITEM_INSIDE[sprite_name]["occuper"]:
		match sprite_name:
			"Sprite_item_1":
				emit_signal("item_1", ITEM_INSIDE[sprite_name]["nom"])
			"Sprite_item_2":
				emit_signal("item_2", ITEM_INSIDE[sprite_name]["nom"])
			"Sprite_item_3":
				emit_signal("item_3", ITEM_INSIDE[sprite_name]["nom"])
			"Sprite_item_4":
				emit_signal("item_4", ITEM_INSIDE[sprite_name]["nom"])
			"Sprite_item_5":
				emit_signal("item_5", ITEM_INSIDE[sprite_name]["nom"])
			"Sprite_item_6":
				emit_signal("item_6", ITEM_INSIDE[sprite_name]["nom"])
				
func _on_area_icone_1_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $BoxContainer/Sprite_item_1.texture!=null:
		emit_signal("obj_pris",ITEM_INSIDE["Sprite_item_1"]["nom"])
		$BoxContainer/Sprite_item_1.texture = null
		_update_texture(sprite_name)
		ITEM_INSIDE["Sprite_item_1"]["nom"] = null
		ITEM_INSIDE["Sprite_item_1"]["occuper"] = false
		emit_signal("obj_remove_1")
		$CanvasGroup.visible = false
		
func _on_area_icone_2_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $BoxContainer/Sprite_item_2.texture!=null:
		emit_signal("obj_pris",ITEM_INSIDE["Sprite_item_2"]["nom"])
		$BoxContainer/Sprite_item_2.texture = null
		_update_texture(sprite_name)
		ITEM_INSIDE["Sprite_item_2"]["nom"] = null
		ITEM_INSIDE["Sprite_item_2"]["occuper"] = false
		emit_signal("obj_remove_2")
		$CanvasGroup.visible = false
		pass
	pass 
func _on_area_icone_3_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $BoxContainer/Sprite_item_3.texture!=null:
		emit_signal("obj_pris",ITEM_INSIDE["Sprite_item_3"]["nom"])
		$BoxContainer/Sprite_item_3.texture = null
		_update_texture(sprite_name)
		ITEM_INSIDE["Sprite_item_3"]["nom"] = null
		ITEM_INSIDE["Sprite_item_3"]["occuper"] = false
		emit_signal("obj_remove_3")
		$CanvasGroup.visible = false
		pass
	pass 
func _on_area_icone_4_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $BoxContainer/Sprite_item_4.texture!=null:
		emit_signal("obj_pris",ITEM_INSIDE["Sprite_item_4"]["nom"])
		$BoxContainer/Sprite_item_4.texture = null
		_update_texture(sprite_name)
		ITEM_INSIDE["Sprite_item_4"]["nom"] = null
		ITEM_INSIDE["Sprite_item_4"]["occuper"] = false
		emit_signal("obj_remove_4")
		$CanvasGroup.visible = false
		pass
	pass 
func _on_area_icone_5_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $BoxContainer/Sprite_item_5.texture!=null:
		emit_signal("obj_pris",ITEM_INSIDE["Sprite_item_5"]["nom"])
		$BoxContainer/Sprite_item_5.texture = null
		_update_texture(sprite_name)
		ITEM_INSIDE["Sprite_item_5"]["nom"] = null
		ITEM_INSIDE["Sprite_item_5"]["occuper"] = false
		emit_signal("obj_remove_5")
		$CanvasGroup.visible = false
		pass
	pass 
func _on_area_icone_6_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and $BoxContainer/Sprite_item_6.texture!=null:
		emit_signal("obj_pris",ITEM_INSIDE["Sprite_item_6"]["nom"])
		$BoxContainer/Sprite_item_6.texture = null
		_update_texture(sprite_name)
		ITEM_INSIDE["Sprite_item_6"]["nom"] = null
		ITEM_INSIDE["Sprite_item_6"]["occuper"] = false
		emit_signal("obj_remove_6")
		$CanvasGroup.visible = false
		pass
	pass 


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("perssonage"):
		char_inside = true
		
	pass 

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("perssonage"):
		char_inside = false
	pass 
