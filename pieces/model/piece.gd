extends Node2D
class_name Piece

enum Type {PAWN, ROOK, KNIGHT, BISHOP, KING, QUEEN}

@export var player : Global.Player:
	set(p): 
		player = p
		applyColor()
	get: return player
@export var type : Type:
	set(t): type = t
	get: return type

@onready var tile : Tile = self.get_parent()
@onready var location : Vector2 = tile.location
@onready var sprite = $Sprite



func applyColor():
	if player == Global.Player.DARK: 
		$Sprite.set_modulate(Color.SLATE_GRAY)

func _ready():
#	tile.connect("tileSelected", )
	pass

func getValidMoves() -> Array:
	assert(false, "Child must implement")
	return Array()
