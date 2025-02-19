extends Area2D

var texture_normale = preload("res://image/hud_craft/icone.png")
var texture_hover = preload("res://image/hud_craft/icone_hover.png")
@onready var sprite = $icone_item_fer


func _on_mouse_entered() -> void:
	sprite.texture = texture_hover
	pass 


func _on_mouse_exited() -> void:
	sprite.texture = texture_normale
	pass
	
