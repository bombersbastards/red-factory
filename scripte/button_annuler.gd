extends Area2D

var button = load("res://image/écran_terminale/icone_quitter.png")
var hover = load("res://image/écran_terminale/icone_quitter_hover.png")

signal quitter ()
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	
	pass


func _on_mouse_entered() -> void:
	$Sprite_button_annuler.texture = hover
	pass 

func _on_mouse_exited() -> void:
	$Sprite_button_annuler.texture = button
	pass 


func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		emit_signal("quitter")
