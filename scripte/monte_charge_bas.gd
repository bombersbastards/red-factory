extends Area2D

var inter_possible = false
var ITEM =null
var item_inside =null

var cadre_plein = preload("res://image/machines/monte charge/cadre_plein.png")
var cadre_vide = preload("res://image/machines/monte charge/cadre_vide.png")

signal obj_poser()
signal obj_envoyer(objet:String)
signal obj_pris(obj_pris:String)

var TEXTURE_ITEM = {
	"bois": "res://image/craft/ressource_premiere/bois.png",
	"charbon": "res://image/craft/ressource_premiere/charbon.png",
	"fer": "res://image/craft/ressource_premiere/fer.png",
	"nitrate": "res://image/craft/ressource_premiere/nitrate.png"
}

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	item_inside = ITEM
	update_sprite()
	pass
func _on_action(inv,item):
	ITEM = item
	if inv == true :
		$item.texture = load(TEXTURE_ITEM[item])
		emit_signal("obj_poser")
	if $item.texture != null and not inv:
		print(item)
		emit_signal("obj_pris",item_inside)
		$item.texture = null
		


func _on_body_entered(body: Node2D) -> void:
	$"monte-charge_anime".play("ouverture")
	pass 


func _on_body_exited(body: Node2D) -> void:
	$"monte-charge_anime".play("fermeture")
	pass

func _on_bouton_appui() -> void:
	$item.texture=null
	emit_signal("obj_envoyer",ITEM)
	pass


func _on_montecharge_haut_obj_envoyer(objet: String) -> void:
	ITEM = objet
	if ITEM !=null:
		$item.texture = load(TEXTURE_ITEM[ITEM])
	pass 
func update_sprite():
	if $item.texture != null:
		$Sprite_cadre.texture = cadre_plein
	else:
		$Sprite_cadre.texture = cadre_vide
