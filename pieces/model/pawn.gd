extends Piece
class_name Pawn

var legalMoves : Array = [Vector2(0, 1), Vector2(1, 1), Vector2(-1, 1)]

func getValidMoves() -> Array:
	var tile = get_parent()
	var validMoves : Array
	var blackOffset = Vector2(0, 0)
	if not hasMoved:
		legalMoves.append(Vector2(0, 2))
	if player == Global.Player.DARK:
		blackOffset = Vector2(0, -2)
	for move in legalMoves:
		var endTile = move + tile.location + blackOffset
		if tile.board.boardState.has(endTile):
			if tile.board.boardState[endTile].piece:
				if tile.board.boardState[endTile].piece.player != self.player:
					validMoves.append(endTile)
			elif(tile.board.boardState[endTile].location.y == tile.location.y):
				validMoves.append(endTile)
	return validMoves

func _ready():
	super._ready()
	#Changing moves based on color
	# if player == Global.Player.LIGHT:
	# 	var newMoves : Array = Array()
	# 	for move in legalMoves:
	# 		newMoves.append(Vector2(move.x, move.y - 2*move.y))
	# 	legalMoves = newMoves
	# 	var newAttacks : Array = Array()
	# 	for move in attackMoves:
	# 		newAttacks.append(Vector2(move.x, move.y - 2*move.y))
	# 	attackMoves = newAttacks

func _init():
	pass
