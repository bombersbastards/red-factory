extends Area2D

var texture = preload("res://image/machines/etagere/ecran_selection/icone.png")
var texture_hover = preload("res://image/machines/etagere/ecran_selection/icone_hover.png")
@onready var sprite = $icone_item_fer


func _on_mouse_entered() -> void:
	sprite.texture = texture_hover
	pass 


func _on_mouse_exited() -> void:
	sprite.texture = texture
	pass
	
