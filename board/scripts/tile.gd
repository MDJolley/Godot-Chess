extends Panel
class_name Tile

signal pieceUpdated
signal tileSelected

@onready var background = $Background
@onready var highlightSprite = $Highlight

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
	highlightSprite.set_modulate(Color.BLUE)

func updateColor() -> void:
	var sum : int = location.x + location.y
	isDark = true if (sum % 2 != 0) else false
	background.color = darkColor if isDark else lightColor



func _on_piece_updated(newPiece):
	var existingPiece = get_node_or_null("Piece")
	if not existingPiece: add_child(newPiece)
	else: 
		existingPiece.queue_free()
		add_child(newPiece)


func _on_background_gui_input(event):
	if (event is InputEventMouseButton 
	and event.is_pressed() 
	and event.button_index == MOUSE_BUTTON_LEFT):
		#Check game sequence to know how click should be handled. 
		if Global.sequence == Global.Sequence.IDLE:
			_handle_idle_click()
		if Global.sequence == Global.Sequence.MOVING:
			_handle_moving_click()

func _handle_moving_click():
	pass

func _handle_idle_click():
	#Clicked empty tile
	if not piece or piece.player != Global.currentPlayer: 
		Global.validMoves = Array()
		board.highlightTiles(null)
	#Clicked piece player doesn't own
#	elif piece.player != Global.currentPlayer:
#		board.highlightTiles(null)
	#Clicked tile that current player could move
	else:
		var moves = piece.getValidMoves()
		Global.validMoves = moves
		board.highlightTiles(moves)

func highlight():
	highlightSprite.visible = true

func removeHighlight():
	highlightSprite.visible = false

