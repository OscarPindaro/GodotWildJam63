extends Node2D

var currentPos

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	currentPos = get_local_mouse_position()

func _returnMousePos():
	return currentPos

