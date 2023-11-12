extends Area2D

var speed = 50
var deltaT = 0.0
var bMove = false
var bUp = true
var bRight = true

var Player 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if bMove == true:
		deltaT += delta
		if bRight == true:
			position.x -= speed * delta
		else:
			position.x += speed * delta
		if bUp == true:
			position.y -= speed * delta
		else:
			position.y += speed * delta
	if deltaT > 1.5:
		deltaT = 0
		bUp = false
		bRight = false
		bMove = false
func _doAll(v2Cord):
	#_setSize(FatherSize,_relativeSize())
	_setPosition(v2Cord)
	pass

func _relativeSize():
	var res = {"width":0,"height":0}
	
	return res
	
func _setSize(fatherSize,relativeSize):
	var xZ = fatherSize.x
	var yZ = fatherSize.y
	
	var xC = relativeSize.width
	var yC = relativeSize.height
	
	var Fx = (xC * 100)/xZ
	var Fy = (yC * 100)/xZ
	
	self.scale.x = Fx/30
	self.scale.y = Fy/30
	
func _setPosition(v2Cords):
	#var temp = Vector2(startPoint.x,startPoint.y)
	self.set_position(v2Cords)
	
	
	#var AC = abs(endPoint.x - startPoint.x)
	#var BC =  abs(endPoint.y - startPoint.y)	
	
	#var a = atan(BC/AC)
	#var degrees = a * (180 / PI)
	
	#pad.rotate(degrees)
	
	pass

func _yameteeeEEEEEEE(posCat):
	var catX = abs(posCat.x)
	var catY = abs(posCat.y)
	
	var glaX = abs(self.global_position.x)
	var glaY = abs(self.global_position.y)
	
	if catX < glaX:
		bRight = false
	if catY < glaY:
		bUp = false
	bMove = true
		
func _iMOBMB(player):
	Player = player
	
func _on_area_2d_area_entered(area):
	if area.is_in_group("bicchieri"):
		area.hide()# Replace with function body.
		Player.GlassOutGimePoint()
		
func _on_area_2d_2_area_entered(area):
	if area.is_in_group("bicchieri"):
		area.hide()# Replace with function body.
		Player.GlassOutGimePoint()
		
func _on_area_2d_3_area_entered(area):
	if area.is_in_group("bicchieri"):
		area.hide()# Replace with function body.
		Player.GlassOutGimePoint()
		
func _on_area_2d_4_area_entered(area):
	if area.is_in_group("bicchieri"):
		area.hide()# Replace with function body.
		Player.GlassOutGimePoint()
