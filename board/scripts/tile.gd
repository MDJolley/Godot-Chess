extends Panel
class_name Tile

@onready var background = $Background

@export var darkColor : Color:
	set(color):
		darkColor = color
	get:
		return darkColor
@export var lightColor : Color:
	set(color):
		lightColor = color
	get:
		return lightColor
@export var isDark : bool:
	set(dark): isDark = dark
	get: return isDark

signal pieceUpdated

var piece : Piece = null:
	set(p): 
		piece = p
		emit_signal("pieceUpdated", p)
	get: return piece
var location : Vector2:
	set(loc):
		location = loc
	get:
		return location
var board : Board:
	set(b): board = b
	get: return board

func _ready():
	updateColor()

func updateColor() -> void:
	var sum : int = location.x + location.y
	isDark = true if (sum % 2 != 0) else false
	background.color = darkColor if isDark else lightColor



func _on_piece_updated(newPiece):
	var existingPiece = get_node_or_null("Piece")
	if not existingPiece: add_child(newPiece)
	else: 
		existingPiece.queue_free()
		print("Adding newPiece")
		add_child(newPiece)
#	print(existingPiece)
