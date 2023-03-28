extends Piece
class_name Knight

var legalMoves : Array = [Vector2(-1, -2), Vector2(1, -2), Vector2(2, -1), Vector2(2, 1),
						Vector2(1, 2), Vector2(-1, 2), Vector2(-2, 1), Vector2(-2, -1)]


func _ready():
	super._ready()

func _init():
	pass

func getValidMoves() -> Array:
	var validMoves : Array
	for move in legalMoves:
		var endTile : Vector2 = move + location
		if Global.gameState.has(endTile):
			if Global.gameState[endTile].piece:
				if Global.gameState[endTile].piece.owner != self.owner:
					validMoves.append(endTile)
			else: validMoves.append(endTile)
	return validMoves
