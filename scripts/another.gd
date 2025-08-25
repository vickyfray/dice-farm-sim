extends Button

# Preload the scene you want to instance
@onready var plant_pot_scene: PackedScene = preload("res://scenes/plant_pot.tscn")

func _on_pressed() -> void:
	# Instance the plant pot
	var plant_pot = plant_pot_scene.instantiate()

	# Get the HBoxContainer
	var hbox = get_parent().get_node("ScrollContainer/MarginContainer/HBoxContainer")

	# Add plant pot as a child
	hbox.add_child(plant_pot)
