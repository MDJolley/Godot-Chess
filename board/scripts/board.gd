extends GridContainer
class_name Board

const tilePath = preload("res://board/scenes/tile.tscn")
var boardState = {}

func _ready():
	drawBoard()

func drawBoard():
	for rank in 8:
		for file in 8:
			var tileLocation = Vector2(file, rank)
			var tile = tilePath.instantiate()
			tile.location = tileLocation
			tile.board = self
			
			
			self.add_child(tile)
			boardState[tileLocation] = tile
			
			var piece = Global.initiatePiece(Piece.Type.PAWN, Global.Player.LIGHT)
			setPiece(piece, tileLocation)

#Initiate new pieces and place them in their starting locations
func setupBoard():
	
	pass

#Used only for setting up board.  Once piece already is placed, use movePiece.
func setPiece(piece, loc):
	var tile = boardState[loc]
	tile.piece = piece


func movePiece(startingLoc, endingLoc) -> bool:
	var startTile = boardState[startingLoc]
	var endTile = boardState[endingLoc]
	var piece = startTile.piece
	#If piece at starting location is null, return false.
	if not piece: return false
	#We need to decouple the piece from its original parent
	startTile.remove_child(piece)
	endTile.piece = piece
	#For now we just return true if we didn't catch an issue early on.
	return true
	

#This should only be used for clearing the board.
func removePiece(loc):
	var tile = boardState[loc]
	tile.piece = null
