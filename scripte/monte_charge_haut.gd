extends Area2D

var inter_possible = false
var ITEM =null
var item_inside =null
var cadre_plein = preload("res://image/machines/monte charge/cadre_plein.png")
var cadre_vide = preload("res://image/machines/monte charge/cadre_vide.png")

var plein = false
var autre_monte_charge 
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
	if inv == true and $item.texture == null :
		$item.texture = load(TEXTURE_ITEM[item])
		emit_signal("obj_poser")
		$"monte-charge_anime".play("fermeture")
		await $"monte-charge_anime".animation_finished 
		emit_signal("obj_envoyer",ITEM)
		$item.texture = null
		
		
	if $item.texture != null and not inv:
		emit_signal("obj_pris",item_inside)
		$item.texture = null
		


func _on_body_entered(body: Node2D) -> void:
	if autre_monte_charge == false :
		$"monte-charge_anime".play("ouverture")
	pass 


func _on_body_exited(body: Node2D) -> void:
	if autre_monte_charge == false :
		$"monte-charge_anime".play("fermeture" )
	pass


func update_sprite():
	if $item.texture != null:
		plein = true
		$Sprite_cadre.texture = cadre_plein
	else:
		plein = false
		$Sprite_cadre.texture = cadre_vide


func _on_montecharge_bas_etat_monte_charge(etat_plein: bool) -> void:
	autre_monte_charge = etat_plein
	
	pass
