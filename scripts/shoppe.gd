extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	pass # Replace with function body.


func _on_buy_item_1_pressed():
	if Globals.currency >=10:
		Globals.currency -=10
		$MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/ShopContents/ScrollContainer/HBoxContainer/VBoxContainer/Items/BuyItem1.disabled = true
		$MarginContainer/VBoxContainer/MarginContainer/VBoxContainer/ShopContents/ScrollContainer/HBoxContainer/VBoxContainer/Items/BuyItem1.text = "Owned"
		print("you bought the thing")
	else:
		print("you can't afford this")
