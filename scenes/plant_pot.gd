extends TextureRect

signal watered_changed(watered: bool)
var time_last_watered: int = -1
var watered: bool = false:
	set(value):
		if watered != value:
			watered = value
			watered_changed.emit(value)

signal stage_changed(planted: int)
@export var stage: int  = 0:
	set(value):
		if stage != value:
			stage = value
			stage_changed.emit(value)

signal fully_grown_changed(watered: bool)
var fully_grown: bool = false:
	set(value):
		if fully_grown != value:
			fully_grown = value
			fully_grown_changed.emit(value)
