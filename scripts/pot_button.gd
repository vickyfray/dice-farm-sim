extends TextureButton

var pot_dry_image = preload("res://assets/images/pot.png")
var pot_wet_image = preload("res://assets/images/pot_hover.png")

# manage the cursor stuff
var cursor_plant = preload("res://assets/images/cursor-plant.png")
var cursor_watering = preload("res://assets/images/cursor-watering.png")
func _on_mouse_entered() -> void:
	print('get_parent().stage ', get_parent().stage)
	var planted = get_parent().stage > 0
	var watered = get_parent().watered
	print('planted? ', planted)
	if !get_parent().fully_grown:
		if !planted:
			Input.set_custom_mouse_cursor(cursor_plant, Input.CURSOR_ARROW, Vector2(54,54))
		elif !watered:
			Input.set_custom_mouse_cursor(cursor_watering, Input.CURSOR_ARROW, Vector2(54,54))
func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(null)

# manage clicks
func _on_pressed() -> void:
	var planted = get_parent().stage > 0
	var watered = get_parent().watered
	if !get_parent().fully_grown:
		if !planted:
			get_parent().stage = 1
			Input.set_custom_mouse_cursor(cursor_watering, Input.CURSOR_ARROW, Vector2(54,54))
		elif !watered:
			get_parent().watered = true
			Input.set_custom_mouse_cursor(null)

# update asset when state changes
func _on_plant_pot_watered_changed(watered: bool) -> void:
	if watered:
		texture_normal = pot_wet_image
	else:
		texture_normal = pot_dry_image
