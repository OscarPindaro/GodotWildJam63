extends Node2D
#load
var Pad  = preload("res://scenes/minigames/scratch/taglio.tscn")
#var Line = preload("res://scenes/minigames/Line.tscn")
#var scratchPad = preload()
#??
var CC = Sprite2D
var PT = Label
#var
var curentComplition = 0
var maxComplition = 100
var spawned = 0
var isPressed = false
var startPoint = Vector2(0,0)
var endPoint = Vector2(0,0)
var father = Vector2(0,0)
var totalPoint = 0
var timer = 0
var block = true
##################################
func _ready():
	#get couch casting size dimesion
	var nodePath:NodePath = "./CC"
	CC = Sprite2D.new()
	CC = get_node(nodePath)
	father = CC.texture.get_size()
	var nodePath2:NodePath = "./PT"
	PT = Label.new()
	PT = get_node(nodePath2)
	pass

func _process(delta):
	pass
	
func _input(event):
	if block == false:
		if event is InputEventMouseButton and isPressed == false:
			if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
				isPressed = true
				startPoint = CC._returnMousePos()
		if event is InputEventMouseButton and isPressed == true:
			if  (event.button_index == MOUSE_BUTTON_LEFT and event.is_released()):
				timer = 0
				endPoint = CC._returnMousePos()
				_spawnSquare()
				isPressed = false
###################################
func _spawnSquare():
	#spawn square
	var sprite = Pad.instantiate()
	sprite.name = "pad" + str(spawned)
	sprite._grabData1(startPoint, endPoint, father)
	CC.add_child(sprite)
	sprite._doAll()
	totalPoint = totalPoint + sprite.Area / 100
	totalPoint = int(round(totalPoint))
	PT._grabData(totalPoint)

func _drawLine():
	#var line = Line.instantiate()
	#line._drawLine()	
	pass
	
func _on_minigame_timer_timeout():
	block = true


func _on_announcer_player_finished():
	block = false
