extends TextureButton

var cursor_plant = preload("res://assets/images/cursor-plant.png")

func _on_mouse_entered() -> void:
	Input.set_custom_mouse_cursor(cursor_plant, Input.CURSOR_ARROW, Vector2(54,54))

func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(null)
