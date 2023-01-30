extends Button

var menu_path = "res://scenes/MainMenu.tscn"

func add_hover_effect(back_button: Button):
	back_button.modulate.a = 0.5
	
func remove_hover_effect(back_button: Button):
	back_button.modulate.a = 1.0
	
func _ready():
	var button = get_node("%BackButton")
	button.grab_focus()
	button.connect("pressed",self, "on_button_pressed")
	button.connect("mouse_entered",self, "add_hover_effect",[button])
	button.connect("mouse_exited",self, "remove_hover_effect",[button])
	button.connect("focus_entered",self, "add_hover_effect",[button])
	button.connect("focus_exited",self, "remove_hover_effect",[button])

func on_button_pressed():
	var _changed_success = get_tree().change_scene(menu_path)
	
