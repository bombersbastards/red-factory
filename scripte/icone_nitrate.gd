extends Area2D

var button = load("res://image/écran_terminale/ressource_fenetre/icone_nitrate.png")
var hover = load("res://image/écran_terminale/ressource_fenetre/icone_nitrate_hover.png")
signal item(ITEM:String)

func _ready() -> void:
	pass 



func _process(delta: float) -> void:
	pass


func _on_mouse_entered() -> void:
	$SpriteIconeNitrate.texture = hover
	pass 


func _on_mouse_exited() -> void:
	$SpriteIconeNitrate.texture = button
	pass 


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("item","nitrate")
