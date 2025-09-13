extends Node2D

var shopopen = false
# Called when the node enters the scene tree for the first time.
func _ready():
	Globals.game_active = true
	print(Globals.game_active)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/TopBar/CoinCount.text = str(Globals.currency)
	timercheck()


func _on_shop_button_toggled(toggled_on):
	if toggled_on:
		print("shopopened")
		$Camera2D.position = Vector2(1050,360)
		shopopen = true
	if !toggled_on:
		print("shop closed")
		$Camera2D.position = Vector2(580,360)
		shopopen  = false


func _on_give_money_pressed():
	Globals.currency +=10


func timercheck():
	$CanvasLayer/TopBar/DayCount.text = str(Globals.game_time)
	$CanvasLayer/TopBar/TextureProgressBar.value = Globals.game_time
	$CanvasLayer/TopBar/TextureProgressBar/SunLoading.position = Vector2(6.5*($CanvasLayer/TopBar/TextureProgressBar.value),0)
