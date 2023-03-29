extends Piece
class_name Rook

var legalMoves : Array = [Vector2(0, 1), Vector2(1, 0), Vector2(0, -1), Vector2(-1, 0)]

func getValidMoves() -> Array:
	var tile = get_parent()
	var validMoves : Array = Array()
	for move in legalMoves:
		var staticMove = move
		while true:
			var endTile = tile.location + move
			if tile.board.boardState.has(endTile):
				var piece = tile.board.boardState[endTile].piece
				if piece:
					if piece.player == player:
						break
					else:
						validMoves.append(endTile)
						break
				else:
					validMoves.append(endTile)
					move += staticMove
			else:
				break
	return validMoves

func _ready():
	pass

func _init():
	pass
