extends TextureButton

signal state_changed(new_number: int)

var stages: Array = [] # { number = int, texture = Texture2D }
var current_index: int = 0

func _ready() -> void:
	stages = [
		{ "number": 1, "texture": load("res://assets/images/plant-d1.png") },
		{ "number": 4, "texture": load("res://assets/images/plant-d4.png") },
		{ "number": 8, "texture": load("res://assets/images/plant-d8.png") },
		{ "number": 20, "texture": load("res://assets/images/plant-d20.png") },
	]

	current_index = 0  # default it to the first stage (number = 1)
	update_texture()

func _on_pressed() -> void:
	current_index = (current_index + 1) % stages.size()
	update_texture()

func update_texture() -> void:
	var stage = stages[current_index]
	texture_normal = stage.texture
	size = stage.texture.get_size()
	emit_signal("state_changed", stage.number)

func get_state_number() -> int:
	return stages[current_index].number

func set_state(value: int) -> void:
	for i in stages.size():
		if stages[i].number == value:
			current_index = i
			update_texture()
			return
