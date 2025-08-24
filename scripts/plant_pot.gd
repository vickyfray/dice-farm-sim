@tool
extends TextureRect

@export var plant_texture: Texture2D:
	set(value):
		plant_texture = value
		if plant:
			plant.texture_normal = value
@onready var plant = $PlantButton

func _ready():
	if plant and plant_texture:
		plant.texture_normal = plant_texture
