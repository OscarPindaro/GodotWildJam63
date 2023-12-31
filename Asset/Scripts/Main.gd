extends Node2D
#load
var Pad  = preload("res://scenes/minigames/scratch/taglio.tscn")
#var Line = preload("res://scenes/minigames/Line.tscn")
#var scratchPad = preload()
#??
var CC = Sprite2D
var PT = Label
var SE = AudioStreamPlayer2D
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

#signals
signal score(points)

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
	var nodePath3:NodePath = "./SE"
	SE = AudioStreamPlayer2D.new()
	SE = get_node(nodePath3)
	pass

func _process(delta):
	pass
	
func _input(event):
	if block == false:
		if event is InputEventMouseButton and isPressed == false:
			if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
				isPressed = true
				startPoint = CC._returnMousePos()
				#start sound
				SE.play()
		if event is InputEventMouseButton and isPressed == true:
			if  (event.button_index == MOUSE_BUTTON_LEFT and event.is_released()):
				timer = 0
				endPoint = CC._returnMousePos()
				_spawnSquare()
				isPressed = false
				SE.stop()
###################################
func _spawnSquare():
	#spawn square
	var sprite = Pad.instantiate()
	sprite.name = "pad" + str(spawned)
	sprite._grabData1(startPoint, endPoint, father)
	CC.add_child(sprite)
	sprite._doAll()
	var deltaPoint =  sprite.Area / 100
	totalPoint = totalPoint + deltaPoint
	totalPoint = int(round(totalPoint))
	emit_signal("score",deltaPoint)
	PT._grabData(totalPoint)

func _drawLine():
	#var line = Line.instantiate()
	#line._drawLine()	
	pass
	
func _on_minigame_timer_timeout():
	block = true


func _on_announcer_player_finished():
	block = false
