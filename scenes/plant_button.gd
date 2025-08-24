extends TextureButton

@onready var states := [
	preload("res://assets/images/plant-stage1.png"),
	preload("res://assets/images/plant-stage2.png"),
	# preload("res://assets/images/plant-stage3.png"),
	preload("res://assets/images/plant-stage4.png"),
	# preload("res://assets/images/plant-stage5.png"),
	# preload("res://assets/images/plant-stage6.png"),
	preload("res://assets/images/plant-stage7.png"),
]

var current_state := 0

func _ready() -> void:
	texture_normal = states[current_state]

func _on_pressed() -> void:
	current_state = (current_state + 1) % states.size()
	texture_normal = states[current_state]
