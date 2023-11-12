extends Node2D

var World: Node2D

var G1: Area2D
var G2: Area2D
var G3: Area2D
var G4: Area2D
var G5: Area2D

@onready var collision_shape = $CollisionShape2D


var speed = 300
var deltaM 

var bG1 = false
var bG2 = false
var bG3 = false
var bG4 = false
var bG5 = false
var cheatCode = false
var bMUp = true
var bMLeft = true
var bMRight = true
var bMDown = true
var bDone = false
var block = false

var totalPoint = 0
var timer = 50
var ASACHI = 0
func _ready():
	bDone = true

func _process(delta):
	if bDone == true:
		timer -= delta
		deltaM = delta
		
			
	
func _input(event):
	if block == false:
		print("x: ", global_position.x, "  y: ", global_position.y)
		if bMUp == true and event is InputEventKey and event.as_text_keycode() == "W":	
			self.global_position.y -= speed * deltaM
		if bMLeft == true and event is InputEventKey and event.as_text_keycode() == "A":
			self.global_position.x -= speed * deltaM
		if bMDown == true and event is InputEventKey and event.as_text_keycode() == "S":
			self.global_position.y += speed * deltaM
		if bMLeft == true and event is InputEventKey and event.as_text_keycode() == "D":
			self.global_position.x += speed * deltaM
		if bG1 == true or bG2 == true or bG3 == true or bG4 == true or bG5 == true :
			if event is InputEventKey and event.as_text_keycode() == "P":
				if bG1 == true:
					G1._yameteeeEEEEEEE(self.global_position)
				if bG2 == true:
					G2._yameteeeEEEEEEE(self.global_position)
				if bG3 == true:
					G3._yameteeeEEEEEEE(self.global_position)
				if bG4 == true:
					G4._yameteeeEEEEEEE(self.global_position)
				if bG5 == true:
					G5._yameteeeEEEEEEE(self.global_position)
		if cheatCode == true and event is InputEventKey and event.as_text_keycode() == "P":
			ORIEGETON()
		
func _on_node_2d_area_entered(area):
		bG1 = true

func _on_node_2d_2_area_entered(area):
		bG2 = true
	
func _on_node_2d_3_area_entered(area):
		bG3 = true
	
func _on_node_2d_4_area_entered(area):
		bG4 = true
	
func _on_node_2d_5_area_entered(area):
		bG5 = true


func _on_node_2d_area_exited(area):
	bG1 = false
	
func _on_node_2d_2_area_exited(area):
	bG2 = false

func _on_node_2d_3_area_exited(area):
	bG3 = false

func _on_node_2d_4_area_exited(area):
	bG4 = false

func _on_node_2d_5_area_exited(area):
	bG5 = false
	
func _nowMakeSense(g1,g2,g3,g4,g5):
	G1 = g1
	G2 = g2
	G3 = g3
	G4 = g4
	G5 = g5
	G1._iMOBMB(self)
	G2._iMOBMB(self)
	G3._iMOBMB(self)
	G4._iMOBMB(self)
	G5._iMOBMB(self)
	
func _unBet(world):
	World = world

func _returnTimer():
	return timer

func GlassOutGimePoint():
	World.PushOut()

func ORIEGETON():
	#estendimi l'area
	collision_shape.shape.radius = collision_shape.shape.radius * 3
	#aumenta la velocità dei glass
	G1.speed = 100
	G2.speed = 100
	G3.speed = 100
	G4.speed = 100
	G5.speed = 100
	#esegui
	if bG1 == true or bG2 == true or bG3 == true or bG4 == true or bG5 == true :
		if bG1 == true:
			G1._yameteeeEEEEEEE(self.global_position)
		if bG2 == true:
			G2._yameteeeEEEEEEE(self.global_position)
		if bG3 == true:
			G3._yameteeeEEEEEEE(self.global_position)
		if bG4 == true:
			G4._yameteeeEEEEEEE(self.global_position)
		if bG5 == true:
			G5._yameteeeEEEEEEE(self.global_position)	
	pass
