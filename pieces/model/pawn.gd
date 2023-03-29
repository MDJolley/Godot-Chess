extends Piece
class_name Pawn

var legalMoves : Array = [Vector2(0, 1)]
var attackMoves : Array = []

func getValidMoves() -> Array:
	var tile = get_parent()
	var validMoves : Array = Array()
	var actualMoves : Array = legalMoves
	if not hasMoved:
		actualMoves.append(legalMoves[0]*2)
	for move in actualMoves:
		var endTile = move + tile.location
		if tile.board.boardState.has(endTile):
			
			validMoves.append(endTile)
	return validMoves

func _ready():
	#Changing moves based on color
	if player == Global.Player.LIGHT:
		var newMoves : Array = Array()
		for move in legalMoves:
			newMoves.append(Vector2(move.x, move.y - 2*move.y))
		legalMoves = newMoves
		var newAttacks : Array = Array()
		for move in attackMoves:
			newAttacks.append(Vector2(move.x, move.y - 2*move.y))
		attackMoves = newAttacks

func _init():
	pass
