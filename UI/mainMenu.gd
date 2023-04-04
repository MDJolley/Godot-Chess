extends Control
var board = preload("res://board/scenes/board.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	get_tree().change_scene_to_packed(board)


func _on_exit_button_pressed():
	get_tree().quit()
