extends Label

var rolling := false
var last_number: int = -1 
var max_val := 8

func _ready() -> void:
	mouse_filter = Control.MOUSE_FILTER_STOP # makes the label clickable
	# WIP make the label show the current max_val when the scene starts
	text = str(max_val)

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if not rolling:
			start_roll()

func start_roll() -> void:
	rolling = true
	var steps := 30
	var base_delay := 0.05

	for i in range(steps):
		# make it pick a number that's not the same as the previous one
		var num := _roll_non_repeating(max_val)
		last_number = num
		text = str(num)

		# ease-out the speed of the dice ticking over so it looks more liek a dice roll
		var t: float = float(i) / float(steps - 1)
		var delay: float = lerp(base_delay, 0.3, t * t)
		await get_tree().create_timer(delay).timeout

	# roll result 
	var final_num := _roll_non_repeating(max_val)
	text = str(final_num)
	last_number = final_num
	rolling = false

func _roll_non_repeating(max_val: int) -> int:
	var num: int = randi_range(1, max_val)
	while num == last_number and max_val > 1: # avoid an infinite loop if max_val is accidentally set to be 1!
		num = randi_range(1, max_val)
	return num

func _on_plant_button_state_changed(new_number: int) -> void:
	# grab the new state number from the button and set the new max_val in the dice scene
	max_val = new_number
	text = str(max_val)  # also update label to reflect new max
