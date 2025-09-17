extends Node2D

var shop_pos := Vector2.ZERO
var shopopen = false

func _ready():
	shop_pos = $Shoppe.position
	Globals.game_active = true
	print(Globals.game_active)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/TopBar/CoinCount.text = str(Globals.currency)
	timercheck()
	if Globals.shop_open == false:
		shop_close()

func _on_give_money_pressed():
	Globals.currency +=10

func _on_shop_button_pressed():
	if Globals.shop_open == false:
		Globals.shop_open = true
		print("open the shop")
		shop_open()
		
	elif Globals.shop_open == true:
		Globals.shop_open = false
		shop_close()
		print("the shop closes")

func shop_open():
	if shopopen == false:
		print("shop opened")
		var tween := create_tween()
		tween.set_trans(Tween.TRANS_CUBIC)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(
		$Shoppe, "global_position", Vector2(650,51),1.0)
		shopopen = true
		Globals.shop_open = true
		print("Shopopen:"+str(shopopen))
		$Shoppe/BG/TextureButton.visible = true
		
func shop_close():
	if shopopen == true:
		print("shop closed")
		var tween := create_tween()
		tween.set_trans(Tween.TRANS_CUBIC)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(
		$Shoppe, "global_position", shop_pos,1.0)
		shopopen  = false
		Globals.shop_open = false
		print("Shopopen:"+str(shopopen))
		$Shoppe/BG/TextureButton.visible = false

func timercheck():
	$CanvasLayer/TopBar/DayCount.text = str(Globals.game_time)
	$CanvasLayer/TopBar/TextureProgressBar.value = Globals.game_time
	$CanvasLayer/TopBar/TextureProgressBar/SunLoading.position = Vector2(6.5*($CanvasLayer/TopBar/TextureProgressBar.value),0)
