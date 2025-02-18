extends Area2D

var button = load("res://image/écran_terminale/ressource_fenetre/icone_fer.png")
var hover = load("res://image/écran_terminale/ressource_fenetre/icone_fer_hover.png")
signal item(ITEM:String)
func _ready() -> void:
	pass 



func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	$SpriteIconeFer.texture = hover
	pass 


func _on_mouse_exited() -> void:
	$SpriteIconeFer.texture = button
	pass 


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("item","fer")
