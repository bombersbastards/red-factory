extends Area2D


var texture_normale = preload("res://image/hud_craft/icone_validation.png")
var texture_hover = preload("res://image/hud_craft/icone_hover_validation.png")
@onready var sprite = $IconeValidation



func _on_mouse_entered() -> void:
	sprite.texture = texture_hover
	pass 


func _on_mouse_exited() -> void:
	sprite.texture = texture_normale
	pass
	
