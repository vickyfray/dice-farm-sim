extends Node
var timer_on = false
var game_active = false
var currency = 0
var game_time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer_on == false:
		if game_active == true:
			$tickTimer.start()
			timer_on = true

func _on_tick_timer_timeout():
	game_time +=1
