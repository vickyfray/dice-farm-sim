extends Node2D

var shop_pos := Vector2.ZERO
var shopopen = false
# Called when the node enters the scene tree for the first time.
func _ready():
	shop_pos = $Shoppe.position


	Globals.game_active = true
	print(Globals.game_active)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/TopBar/CoinCount.text = str(Globals.currency)
	timercheck()


func _on_shop_button_toggled(toggled_on):

# move the shop position
	if toggled_on:
		print("shopopened")
		var tween := create_tween()
		tween.set_trans(Tween.TRANS_CUBIC)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(
		$Shoppe, "global_position", Vector2(650,51),1.0)
		shopopen = true
		$Shoppe/BG/TextureRect.visible = true
	if !toggled_on:
		print("shop closed")
		var tween := create_tween()
		tween.set_trans(Tween.TRANS_CUBIC)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(
		$Shoppe, "global_position", shop_pos,1.0)
		shopopen  = false
		$Shoppe/BG/TextureRect.visible = false

func _on_give_money_pressed():
	Globals.currency +=100


func timercheck():
	$CanvasLayer/TopBar/DayCount.text = str(Globals.game_time)
	$CanvasLayer/TopBar/TextureProgressBar.value = Globals.game_time
	$CanvasLayer/TopBar/TextureProgressBar/SunLoading.position = Vector2(6.5*($CanvasLayer/TopBar/TextureProgressBar.value),0)
