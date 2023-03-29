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

var location : Vector2:
	set(loc):
		location = loc
	get:
		return location
var board : Board:
	set(b): board = b
	get: return board
var piece : Piece:
	set(p):
		if piece:
			self.remove_child(piece)
		self.add_child(p)
	get:
		return get_node_or_null("Piece")

func _ready():
	updateColor()
	highlightSprite.set_modulate(Color.BLUE)

func updateColor() -> void:
	var sum : int = location.x + location.y
	isDark = true if (sum % 2 != 0) else false
	background.color = darkColor if isDark else lightColor

func _on_background_gui_input(event):
	if (event is InputEventMouseButton 
	and event.is_pressed() 
	and event.button_index == MOUSE_BUTTON_LEFT):
		if Global.validMoves.has(self.location):
			_handle_moving_click(self)
		else: _handle_idle_click()

func _handle_moving_click(originalTile):
	board.movePiece(self)


func _handle_idle_click():
	
	#Clicked empty tile or player doesn't own piece
	if not piece or piece.player != Global.currentPlayer: 
		Global.validMoves = Array()
		board.highlightTiles(null)
	#Clicked tile that current player could move
	else:
		print(self.piece)
		var moves = piece.getValidMoves()
		board.selectedTile = self
		Global.validMoves = moves
		board.highlightTiles(moves)

func highlight():
	highlightSprite.visible = true

func removeHighlight():
	highlightSprite.visible = false

