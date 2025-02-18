extends Area2D

var button = load("res://image/écran_terminale/ressource_fenetre/icone_charbon.png")
var hover = load("res://image/écran_terminale/ressource_fenetre/icone_charbon_hover.png")
signal item(ITEM:String)
func _ready() -> void:
	pass 



func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	$SpriteIconeCharbon.texture = hover
	pass 


func _on_mouse_exited() -> void:
	$SpriteIconeCharbon.texture = button
	pass 
	
func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("item","charbon")
