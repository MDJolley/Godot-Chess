extends Piece
class_name Knight

var legalMoves : Array = [Vector2(-1, -2), Vector2(1, -2), Vector2(2, -1), Vector2(2, 1),
						Vector2(1, 2), Vector2(-1, 2), Vector2(-2, 1), Vector2(-2, -1)]


func _ready():
	super._ready()

func _init():
	pass

func getValidMoves() -> Array:
	var tile = get_parent()
	var validMoves : Array
	for move in legalMoves:
		var endTile : Vector2 = move + tile.location
		if tile.board.boardState.has(endTile):
			if tile.board.boardState[endTile].piece:
				if tile.board.boardState[endTile].piece.player != self.player:
					validMoves.append(endTile)
			else: validMoves.append(endTile)
	return validMoves
