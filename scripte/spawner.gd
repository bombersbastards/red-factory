extends Area2D

var inter_possible = false
var ITEM
var inv_full = false
var CURRENT_CHAR ="goutte"

var TEXTURE_ITEM={
	"bois":"res://image/craft/ressource_premiere/bois.png",
	"charbon": "res://image/craft/ressource_premiere/charbon.png",
	"fer":"res://image/craft/ressource_premiere/fer.png",
	"nitrate":"res://image/craft/ressource_premiere/nitrate.png"
}
signal item_pris(ITEM_PRIS:String)

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
func _on_action(inv,item):
	if $item.texture != null and inv == false:
		$spawner_porte/AnimationPorte.play("fermeture")
		$item.texture = null
		emit_signal("item_pris",ITEM)
	pass

func _on_terminale_item_choisi(item: String) -> void:
	ITEM =item
	$spawner_porte/AnimationPorte.play("ouverture")
	$item.texture = load(TEXTURE_ITEM[item])
	pass 
