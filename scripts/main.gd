extends Node2D

var shop_pos := Vector2.ZERO
var shopopen = false
# Called when the node enters the scene tree for the first time.
func _ready():
	shop_pos = $Shoppe.position
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$CanvasLayer/CoinCount.text = str(Globals.currency)


func _on_shop_button_toggled(toggled_on):

	#Slide Menu pushing game over
	#if toggled_on:
		#print("shopopened")
		#var tween := create_tween()
		#tween.set_trans(Tween.TRANS_CUBIC)
		#tween.set_ease(Tween.EASE_OUT)
		#tween.tween_property(
		#$Camera2D, "global_position", Vector2(1050,360),1.0)
		#shopopen = true
	#if !toggled_on:
		#print("shop closed")
		#var tween := create_tween()
		#tween.set_trans(Tween.TRANS_CUBIC)
		#tween.set_ease(Tween.EASE_OUT)
		#tween.tween_property(
		#$Camera2D, "global_position", Vector2(580,360),1.0)
		#shopopen  = false

# move the shop position
	if toggled_on:
		print("shopopened")
		var tween := create_tween()
		tween.set_trans(Tween.TRANS_CUBIC)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(
		$Shoppe, "global_position", Vector2(650,51),1.0)
		shopopen = true
	if !toggled_on:
		print("shop closed")
		var tween := create_tween()
		tween.set_trans(Tween.TRANS_CUBIC)
		tween.set_ease(Tween.EASE_OUT)
		tween.tween_property(
		$Shoppe, "global_position", shop_pos,1.0)
		shopopen  = false

func _on_give_money_pressed():
	Globals.currency +=10
