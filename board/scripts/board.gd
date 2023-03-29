extends GridContainer
class_name Board

const tilePath = preload("res://board/scenes/tile.tscn")
var boardState = {}
var selectedTile : Tile


func _ready():
	Global.board = self
	drawBoard()
	setupBoard()

func drawBoard():
	for rank in 8:
		for file in 8:
			var tileLocation = Vector2(file, rank)
			var tile = tilePath.instantiate()
			tile.location = tileLocation
			tile.board = self
			
			self.add_child(tile)
			boardState[tileLocation] = tile

#Initiate new pieces and place them in their starting locations
func setupBoard():
	#Pawns setup
	for file in 8:
		var pawn = Global.initiatePiece(Piece.Type.PAWN, Global.Player.DARK)
		setPiece(pawn, Vector2(file, 1))
		pawn = Global.initiatePiece(Piece.Type.PAWN, Global.Player.LIGHT)
		setPiece(pawn, Vector2(file, 6))
	#Rooks setup
	for file in 2:
		var rook = Global.initiatePiece(Piece.Type.ROOK, Global.Player.DARK)
		setPiece(rook, Vector2(file * 7, 0))
		rook = Global.initiatePiece(Piece.Type.ROOK, Global.Player.LIGHT)
		setPiece(rook, Vector2(file * 7, 7))
	#Knights setup
	setPiece(Global.initiatePiece(Piece.Type.KNIGHT, Global.Player.DARK), Vector2(1, 0))
	setPiece(Global.initiatePiece(Piece.Type.KNIGHT, Global.Player.DARK), Vector2(6, 0))
	setPiece(Global.initiatePiece(Piece.Type.KNIGHT, Global.Player.LIGHT), Vector2(1, 7))
	setPiece(Global.initiatePiece(Piece.Type.KNIGHT, Global.Player.LIGHT), Vector2(6, 7))
	#Bishops setup
	setPiece(Global.initiatePiece(Piece.Type.BISHOP, Global.Player.DARK), Vector2(2, 0))
	setPiece(Global.initiatePiece(Piece.Type.BISHOP, Global.Player.DARK), Vector2(5, 0))
	setPiece(Global.initiatePiece(Piece.Type.BISHOP, Global.Player.LIGHT), Vector2(2, 7))
	setPiece(Global.initiatePiece(Piece.Type.BISHOP, Global.Player.LIGHT), Vector2(5, 7))
	#Kings setup
	setPiece(Global.initiatePiece(Piece.Type.KING, Global.Player.DARK), Vector2(4, 0))
	setPiece(Global.initiatePiece(Piece.Type.KING, Global.Player.LIGHT), Vector2(4, 7))
	#Queens setup
	setPiece(Global.initiatePiece(Piece.Type.QUEEN, Global.Player.DARK), Vector2(3, 0))
	setPiece(Global.initiatePiece(Piece.Type.QUEEN, Global.Player.LIGHT), Vector2(3, 7))

func highlightTiles(tiles):
	for tile in boardState:
		boardState[tile].removeHighlight()
	if tiles:
		for tile in tiles:
			boardState[tile].highlight()

#Used only for setting up board.  Once piece already is placed, use movePiece.
func setPiece(piece, loc):
	var tile = boardState[loc]
	tile.piece = piece

func movePiece(endTile) -> bool:
	var piece = selectedTile.piece
	#If piece at starting location is null, return false.
	if not piece: return false
	#We need to decouple the piece from its original parent
	selectedTile.remove_child(piece)
	endTile.piece = piece
	endTurn()
	#For now we just return true if we didn't catch an issue early on.
	return true

func endTurn():
	selectedTile = null
	highlightTiles(null)
	Global.validMoves = Array()
	Global.nextPlayer()

#This should only be used for clearing the board.
func removePiece(loc):
	var tile = boardState[loc]
	tile.piece = null
