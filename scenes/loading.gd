extends Node2D

var dice_total = 0
var dice_roll = 0
var next_scene = "res://scenes/main.tscn"
var dice_rolling = false

@onready var dice: PackedScene = preload("res://scenes/dice.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	dice_total = 0
	ResourceLoader.load_threaded_request(next_scene)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var progress = []
	ResourceLoader.load_threaded_get_status(next_scene, progress)
	if ResourceLoader.load_threaded_get_status(next_scene, progress) > (dice_total/100):
		if dice_rolling == false:
			roll_dice()
			$ProgressBar.value = dice_total
	

func roll_dice():
	dice_rolling = true
	if dice_total <=100:
		randomize()
		dice_roll = randi_range(1,20)
		$Dice/RollLabel.text = str(dice_roll)
		$ValueAdded.text = "+"+ str(dice_roll)
		$AnimationPlayer.play("valueadded")
		print("you rolled "+str(dice_roll))
		dice_total += dice_roll
		print("total loaded"+str(dice_total))

func _on_animation_player_animation_finished(anim_name):
	dice_rolling = false
