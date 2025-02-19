extends Area2D
var icone 
var texture_normale = preload("res://image/hud_craft/icone.png")
var texture_hover = preload("res://image/hud_craft/icone_hover.png")
var item 

var TEXTURE_ITEM = {
	"bois": "res://image/craft/ressource_premiere/bois.png",
	"charbon": "res://image/craft/ressource_premiere/charbon.png",
	"fer": "res://image/craft/ressource_premiere/fer.png",
	"nitrate": "res://image/craft/ressource_premiere/nitrate.png"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icone = $icoone_3
	item = $icoone_3/icoone_sprite_3
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_etagere_item_3(ITEM_3: String) -> void:
	item.texture = load(TEXTURE_ITEM[ITEM_3])
	item.scale = Vector2(0.5,0.5)
	pass # Replace with function body.


func _on_mouse_entered() -> void:
	icone.texture = texture_hover
	pass 
	


func _on_mouse_exited() -> void:
	icone.texture = texture_normale
	pass


func _on_etagere_obj_remove_3() -> void:
	item.texture = null
