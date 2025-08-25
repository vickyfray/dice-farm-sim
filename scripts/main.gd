extends Node2D

var shopopen = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_shop_button_toggled(toggled_on):
	if toggled_on:
		print("shopopened")
		$Camera2D.position = Vector2(1050,360)
		shopopen = true
	if !toggled_on:
		print("shop closed")
		$Camera2D.position = Vector2(580,360)
		shopopen  = false
