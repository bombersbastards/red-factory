extends CharacterBody2D

const SPEED = 450.0

var inter_possible = null
var inv = false
var item =null

signal etat_inv(inv:bool)
var TEXTURE_ITEM={
	"bois":"res://image/craft/ressource_premiere/bois.png",
	"charbon": "res://image/craft/ressource_premiere/charbon.png",
	"fer":"res://image/craft/ressource_premiere/fer.png",
	"nitrate":"res://image/craft/ressource_premiere/nitrate.png"
}
var node_inter= {
	
}

signal action(INV:bool,ITEM:String)
signal ecran(ecran_actif:bool)

@onready var animation = $Animation_pelican
@onready var sprite = $Sprite_pelican

func _ready() -> void:
	node_inter= {
	"etagere":get_parent().get_node("etagere"),
	"bouton":get_parent().get_node("bouton"),
	"monte-charge_bas": get_parent().get_node("monte-charge_bas"),
	"four": get_parent().get_node("four"),
	}
func _physics_process(_delta: float) -> void:
	
	
	var action = Input.is_action_just_pressed("action")
	var dir = int(Input.is_action_pressed("droite")) - int(Input.is_action_pressed("gauche"))
	
	inventaire_update(item)
	_action(action)
	

		
	 
	
	if $item_pelican.texture != null:
		inv = true
	else :
		inv = false
		
	emit_signal("etat_inv",inv)
	
	if dir == 0:
		animation.play("idle")
		velocity.x = 0
	else:
		sprite.flip_h = dir == -1
		animation.play("marche")
		velocity.x = dir * SPEED
		
	
		
	move_and_slide()

func _on_area_pelican_area_entered(area: Area2D) -> void:
	if area.is_in_group("machine"):
		inter_possible = area.name
		pass

func _on_area_pelican_area_exited(area: Area2D) -> void:
	if area.is_in_group("machine"):
		inter_possible = null
	pass 
	
func _action(action):
	if action and inter_possible != null:
		var cible = node_inter.get(inter_possible)
		var call = Callable(cible, "_on_action")
		if cible != null:
			if not is_connected("action", Callable(cible, "_on_action")):
				connect("action", Callable(cible, "_on_action"))
				emit_signal("action",inv,item)  # Déclenche le signal après connexion
				disconnect("action",call)
			pass

func _on_spawner_item_pris(ITEM_PRIS: String) -> void:
	item = ITEM_PRIS
	$item_pelican.texture = load(TEXTURE_ITEM[ITEM_PRIS])
	pass 

func _on_montecharge_haut_obj_poser() -> void:
	$item_pelican.texture = null
	pass 

func _on_montecharge_bas_obj_pris(obj_pris: String) -> void:
	item = obj_pris
	pass
func inventaire_update(item):
	
	if item!= null:
		$item_pelican.texture = load(TEXTURE_ITEM[item])
	elif item == null:
		$item_pelican.texture = null
	if $item_pelican.texture != null:
		inv = true
	else :
		inv = false

func _on_montecharge_bas_obj_poser() -> void:
	item = null

func _on_montecharge_bas_obj_envoyer(objet: String) -> void:
	pass 

func _on_etagere_obj_poser() -> void:
	item = null

func _on_etagere_obj_pris(nom_item: String) -> void:
	item = nom_item

func _on_four_fer_poser() -> void:
	item = null

func _on_four_charbon_poser() -> void:
	item = null

func _on_four_fer_pris() -> void:
	item = "fer"

func _on_four_charbon_pris() -> void:
	item = "charbon"
