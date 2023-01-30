extends Control

var scene_folder_path = "res://scenes/"

func add_hover_effect(button: Button):
	button.modulate.a = 0.5
	
func remove_hover_effect(button: Button):
	button.modulate.a = 1.0
	
func _ready():
	get_node("%Continue").grab_focus()
	for button in get_tree().get_nodes_in_group("menu_buttons"):
		button.connect("pressed",self, "on_button_pressed",[button])
		button.connect("mouse_entered",self, "add_hover_effect",[button])
		button.connect("mouse_exited",self, "remove_hover_effect",[button])
		button.connect("focus_entered",self, "add_hover_effect",[button])
		button.connect("focus_exited",self, "remove_hover_effect",[button])


func change_scene(scene_name: String):	
	var _success = get_tree().change_scene(scene_folder_path + scene_name)

func on_button_pressed(button: Button):
	change_scene(button.name + ".tscn")
