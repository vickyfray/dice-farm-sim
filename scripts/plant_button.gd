extends TextureButton

# preload the dice scene
@onready var dice: PackedScene = preload("res://scenes/dice.tscn")

# manage the cursor 
var cursor_shears = preload("res://assets/images/cursor-shears.png")
func _on_mouse_entered() -> void:
	if get_parent().stage > 1:
		Input.set_custom_mouse_cursor(cursor_shears, Input.CURSOR_ARROW, Vector2(3,0))
func _on_mouse_exited() -> void:
	Input.set_custom_mouse_cursor(null)

var stages = [
		{ "number": 0, "texture": load("res://assets/images/plant-d0.png"), "timetogrow":0 },
		{ "number": 1, "texture": load("res://assets/images/plant-d1.png"), "timetogrow":4 },
		{ "number": 4, "texture": load("res://assets/images/plant-d4.png"), "timetogrow":3 },
		{ "number": 8, "texture": load("res://assets/images/plant-d8.png"), "timetogrow":8 },
		{ "number": 20, "texture": load("res://assets/images/plant-d20.png"), "timetogrow":0 },
	]

func _on_pressed() -> void:
	harvest()
	
func harvest() -> void:
	if get_parent().stage > 1:
		roll_dice()
		get_parent().fully_grown = false
		get_parent().stage = 0
	
func roll_dice() -> void:
	print('roll a d', stages[get_parent().stage].number)
	# instanciate the dice as a new child scene
	var new_dice = dice.instantiate()
	$DiceMarker.add_child(new_dice)
	new_dice.max_val = stages[get_parent().stage].number
	new_dice.start_roll()
	
func grow() -> void:
	if(get_parent().watered):
		get_parent().stage = (get_parent().stage + 1) % stages.size()
		if get_parent().stage == stages.size()-1:
			get_parent().fully_grown = true
		get_parent().watered = false
		get_parent().time_last_watered = -1
		
func _process(delta):
	if(get_parent().time_last_watered > -1):
		var time_since_last_watered = Globals.game_time - get_parent().time_last_watered
		if(time_since_last_watered >= stages[get_parent().stage].timetogrow): # if it takes 3 days to grow
			print("plant took:" + str(time_since_last_watered) + " days to grow")
			grow()

func update_texture() -> void:
	var stage = stages[get_parent().stage]
	texture_normal = stage.texture
	size = stage.texture.get_size()

func set_state(value: int) -> void:
	for i in stages.size():
		if stages[i].number == value:
			get_parent().stage = i
			update_texture()
			return

func _on_plant_pot_stage_changed(planted: int) -> void:
	update_texture()

# temporary grow button
func _on_button_pressed() -> void:
	if get_parent().fully_grown:
		print('fully grown, harvest the plant!')
	else:
		if get_parent().stage > 0:
			grow()
		else: 
			print('plant a seed first!')
