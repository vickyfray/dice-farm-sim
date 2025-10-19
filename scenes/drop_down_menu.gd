extends Control

@onready var button: Button = $Button
@onready var chevron: TextureRect = $Button/MarginContainer/Chevron
@onready var collapse_control: Control = $CollapseControl
@onready var list_container: MarginContainer = $CollapseControl/ListContainer
var expanded: bool = false

func _ready() -> void:
	print(str(chevron))
	chevron.pivot_offset = chevron.size / 2
	custom_minimum_size.y = button.size.y
	call_deferred("reset_panel")


func reset_panel():
	collapse_control.size.y = 0

func _update_chevron(expanded: bool):
	var target_angle = 90 if expanded else 0
	var tween = create_tween()
	tween.tween_property(chevron, "rotation_degrees", target_angle, 0.25)


func _on_button_toggled(toggled_on: bool) -> void:
	var chevron = $ShopContainer/TitleContents_VBox/ContentsContainer/ShopContents_Vbox/ItemsScrollContainer/ContentsContainer_Vbox/DropDownMenu/Button/MarginContainer/Chevron
	_update_chevron(toggled_on)
	if !toggled_on:
		var tween = create_tween()
		tween.tween_property(collapse_control, "custom_minimum_size:y", 0, 0.25)
	else:
		var tween = create_tween()
		tween.tween_property(collapse_control, "custom_minimum_size:y", list_container.size.y, 0.25)


func _on_panel_container_minimum_size_changed() -> void:
			custom_minimum_size = collapse_control.get_combined_minimum_size() + button.size


func _on_button_2_toggled(toggled_on):
	var chevron = $ShopContainer/TitleContents_VBox/ContentsContainer/ShopContents_Vbox/ItemsScrollContainer/ContentsContainer_Vbox/DropDownMenu/Button2/MarginContainer/Chevron
	_update_chevron(toggled_on)
	
	if !toggled_on:
		var tween = create_tween()
		tween.tween_property($CollapseControl2, "custom_minimum_size:y", 0, 0.25)
	else:
		var tween = create_tween()
		tween.tween_property($CollapseControl2, "custom_minimum_size:y", list_container.size.y, 0.25)
