extends Node2D
#load
##glasees
@onready var Glass1 = $Control/Node2D
@onready var Glass2 = $Control/Node2D2
@onready var Glass3 = $Control/Node2D3
@onready var Glass4 = $Control/Node2D4
@onready var Glass5 = $Control/Node2D5

var LTimer = Label
var LPoint = Label

var Table = Sprite2D
var TableArea = Area2D

var Player = Sprite2D
var PlayerArea = Area2D

var spawned = 0
var block = true
var GlassesCreate = []
var totalPoint = 0

#signals
signal score(points)

##################################
func _ready():
	var nodePath:NodePath = "./TablePadre"
	Table = Sprite2D.new()
	Table = get_node(nodePath)
	var nodePath2:NodePath = "./PlayerPadre"
	Player = Sprite2D.new()
	Player = get_node(nodePath2)
	#var DCS = Table.get_child(1).shape.extents
	Player._unBet(self)
	Player._nowMakeSense(Glass1,Glass2,Glass3,Glass4,Glass5)
	var nodePath5:NodePath = "./Point"
	LPoint = Sprite2D.new()
	LPoint = get_node(nodePath5)
	var nodePath6:NodePath = "./Timer"
	LTimer = Sprite2D.new()
	LTimer = get_node(nodePath6)
	
func _process(delta):
	LTimer._grabData(Player._returnTimer())
	
func _input(event):
	pass
###################################

func _getRandomValidLocation(DCS):
	var res = Vector2(0,0)
	#prendi due numeri random che all'interno della shape
	var randomX = randi_range(100, DCS.x-100)
	var randomY = randi_range(100, DCS.y-100)
	#controllo che non sono vicino a niente
	res.x = randomX
	res.y = randomY
	
	#quando istanzio, devo salvare il v2 con la size della collision dunque un dizionario con due v2 
	#per il check devo calcolarare le aree non disponibili per lo spawn 
	
	
	
#	for q in GlassesCreate:
#		if abs((q["cords"].x - randomX)) < 10:
#			pass

	

	
	return res

func PushOut():
	var deltaPoint = (10 * Player._returnTimer())
	totalPoint = totalPoint + deltaPoint
	emit_signal("score", deltaPoint)
	LPoint._grabData(totalPoint)
