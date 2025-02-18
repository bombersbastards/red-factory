extends Area2D


var texture = preload("res://image/machines/etagere/ecran_selection/icone_validation.png")
var texture_hover = preload("res://image/machines/etagere/ecran_selection/icone_hover_validation.png")

@onready var sprite = $IconeValidation



func _on_mouse_entered() -> void:
	sprite.texture = texture_hover
	pass 


func _on_mouse_exited() -> void:
	sprite.texture = texture
	pass
	
