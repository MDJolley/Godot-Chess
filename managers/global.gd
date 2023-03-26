extends Node

var pawnPath = preload("res://pieces/repo/pawn.tscn")

enum Player {DARK, LIGHT}
var darkColor : Color = Color.DARK_SLATE_BLUE
var lightColor : Color = Color.LIGHT_SKY_BLUE

func initiatePiece(type, player) -> Piece:
	var piece : Piece
	match type:
		Piece.Type.PAWN:
			piece = pawnPath.instantiate()
	piece.player = player
	return piece



