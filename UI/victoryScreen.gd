extends Control

const mainMenu = preload("res://UI/mainMenu.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_return_to_menu_button_pressed():
	get_tree().change_scene_to_packed(mainMenu)
