extends Area2D

var inter_possible =false
var char = null
var action = Input.is_action_just_pressed("action")
var ecran = false

signal item_choisi(item:String)
signal ecran_actif(ecran:bool)

func _ready() -> void:
	for button in $"écrans/écran_terminale/ressource/OngletRessource/VBoxContainer".get_children():
		button.connect("item", Callable(self, "_on_item_selected"))

func _on_action(inv,item):
	if $"écrans".visible == false :
		$"écrans".visible = true
		
	else:
		$"écrans".visible = false
	pass


func _on_button_annuler_quitter() -> void:
	$"écrans".visible = false
	pass

func _physics_process(delta: float) -> void:
	ecran = $"écrans".visible

	emit_signal("ecran_actif",ecran)
	
func _on_item_selected(ITEM):
	$"écrans".visible = false
	emit_signal("item_choisi",ITEM)
	pass
