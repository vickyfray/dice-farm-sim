extends Node2D

@onready var plant_pot_scene: PackedScene = preload("res://scenes/plant_pot.tscn")
var pot_price = 30
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/ShopContents/ScrollContainer/HBoxContainer/VBoxContainer/Items/Label2.text = (str(pot_price)+"gp")
	var main = self.get_parent()
	var hbox = main.get_node("MarginContainer/HBoxContainer") 
	pot_price = 30 + ((hbox.get_child_count()-1)*10)

func _on_button_pressed():
	pass # Replace with function body.


func _on_buy_item_1_pressed():
	plantpotpurchase()

func plantpotpurchase():
	var main = self.get_parent()
	var hbox = main.get_node("MarginContainer/HBoxContainer")
	var plant_pot = plant_pot_scene.instantiate()

	if hbox.get_child_count() < 6:
		# Add plant pot as a child
		if Globals.currency >= pot_price:
			Globals.currency -= pot_price
			hbox.add_child(plant_pot)

func _on_texture_button_pressed():
	if Globals.shop_open == true:
		Globals.shop_open = false
	elif Globals.shop_open == false:
		Globals.shop_open = true
