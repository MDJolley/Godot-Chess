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

@onready var sprite = $Sprite
var hasMoved = false

func applyColor():
	if player == Global.Player.DARK: 
		$Sprite.set_modulate(Color.SLATE_GRAY)

func _ready():
	pass

func getValidMoves() -> Array:
	return Array()
