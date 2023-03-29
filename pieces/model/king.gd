extends Piece
class_name King

var legalMoves : Array = [Vector2(-1, -1), Vector2(-1, 0), Vector2(-1, 1), Vector2(0, -1),
 Vector2(0, 1), Vector2(1, -1), Vector2(1, 0), Vector2(1, 1)]
var castleLeft : Array = [Vector2(-3, 0)]
var castleRight : Array = [Vector2(2, 0)]

func _ready():
	super._ready()

func _init():
	pass

func getValidMoves() -> Array:
	var tile = get_parent()
	var validMoves : Array
	var location = tile.location
	if(not hasMoved and not tile.board.boardState[Vector2(-4, 0) + location].piece.hasMoved):
		if(tile.board.boardState[Vector2(-1, 0) + location].piece == null and tile.board.boardState[Vector2(-2, 0) + location].piece == null and tile.board.boardState[Vector2(-3, 0) + location].piece == null):
			legalMoves += castleLeft
	if(not hasMoved and not tile.board.boardState[Vector2(3, 0) + location].piece.hasMoved):
		if(tile.board.boardState[Vector2(1, 0) + location].piece == null and tile.board.boardState[Vector2(2, 0) + location].piece == null):
			legalMoves += castleRight

	for move in legalMoves:
		var endTile : Vector2 = move + tile.location
		if tile.board.boardState.has(endTile):
			if tile.board.boardState[endTile].piece:
				if tile.board.boardState[endTile].piece.player != self.player:
					validMoves.append(endTile)
			else: validMoves.append(endTile)
	return validMoves
