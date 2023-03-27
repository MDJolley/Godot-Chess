extends Node

var pawnPath = preload("res://pieces/repo/pawn.tscn")
var rookPath = preload("res://pieces/repo/rook.tscn")
var knightPath = preload("res://pieces/repo/knight.tscn")
var bishopPath = preload("res://pieces/repo/bishop.tscn")
var kingPath = preload("res://pieces/repo/king.tscn")
var queenPath = preload("res://pieces/repo/queen.tscn")

enum Player {DARK, LIGHT}
enum Sequence {IDLE, MOVING}
var darkColor : Color = Color.DARK_SLATE_BLUE
var lightColor : Color = Color.LIGHT_SKY_BLUE
var currentPlayer = Player.LIGHT
var sequence = Sequence.IDLE
var gameState = {}
var board : Board:
	set(b): 
		board = b
		board.boardStateChanged.connect(updateGameState.bind())
var validMoves : Array


func _ready():
	pass

func initiatePiece(type, player) -> Piece:
	var piece : Piece
	match type:
		Piece.Type.PAWN:
			piece = pawnPath.instantiate()
		Piece.Type.ROOK:
			piece = rookPath.instantiate()
		Piece.Type.KNIGHT:
			piece = knightPath.instantiate()
		Piece.Type.BISHOP:
			piece = bishopPath.instantiate()
		Piece.Type.KING:
			piece = kingPath.instantiate()
		Piece.Type.QUEEN:
			piece = queenPath.instantiate()
	piece.player = player
	return piece

func updateGameState(boardState):
	gameState = boardState



