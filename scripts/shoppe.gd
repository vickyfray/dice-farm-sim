extends Node2D

@onready var plant_pot_scene: PackedScene = preload("res://scenes/plant_pot.tscn")
var pot_price = 30
var seed_upgrade_price = 50

var shop_pos = 0
var pot_num_purchased = 0
var seed_upgrade_purchased = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	shop_pos = self.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	priceupdates()
	
	var main = self.get_parent()
	var hbox = main.get_node("MarginContainer/HBoxContainer") 



func _on_buy_item_1_pressed():
	plantpotpurchase()
	purchasethanks()

func _on_buy_item_2_pressed():
	if Globals.currency >= seed_upgrade_price:
		Globals.currency -= seed_upgrade_price
		seed_upgrade_purchased +=1
		Globals.dice_modifier +=1
		purchasethanks()


func purchasethanks():
	$ShopContainer/TitleContents_VBox/LilShopKeep.play("thanks")

func priceupdates():
	pot_price = 30 + (pot_num_purchased*10)
	$ShopContainer/TitleContents_VBox/ContentsContainer/ShopContents_Vbox/ItemsScrollContainer/ContentsContainer_Vbox/DropDownMenu/CollapseControl/ListContainer/HBoxContainer/Label2.text = (str(pot_price)+"gp")
	seed_upgrade_price = 50*(1+seed_upgrade_purchased)
	$ShopContainer/TitleContents_VBox/ContentsContainer/ShopContents_Vbox/ItemsScrollContainer/ContentsContainer_Vbox/DropDownMenu/CollapseControl2/ListContainer/HBoxContainer/Label2.text = (str(seed_upgrade_price)+"gp")


func plantpotpurchase():
	var main = self.get_parent()
	var hbox = main.get_node("MarginContainer/HBoxContainer")
	var plant_pot = plant_pot_scene.instantiate()

	if hbox.get_child_count() < 6:
		# Add plant pot as a child
		if Globals.currency >= pot_price:
			Globals.currency -= pot_price
			hbox.add_child(plant_pot)

	pot_num_purchased = hbox.get_child_count()-1

func _on_texture_button_pressed():
	print("shop should close")
	if Globals.shop_open == true:
		print("shop closed")
		var tween := create_tween()
		tween.set_trans(Tween.TRANS_CUBIC)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(
		self, "global_position", shop_pos,1.0)
		Globals.shop_open = false
		$BG/HideShopButton.visible = false
		Globals.shop_open = false
	elif Globals.shop_open == false:
		Globals.shop_open = true


func _on_lil_shop_keep_animation_looped():
	print($ShopContainer/TitleContents_VBox/LilShopKeep.animation)
	if $ShopContainer/TitleContents_VBox/LilShopKeep.animation == "thanks":
		$ShopContainer/TitleContents_VBox/LilShopKeep.play("default")
