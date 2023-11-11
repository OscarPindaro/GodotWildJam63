extends Sprite2D
#####################################################################
var StartPoint = Vector2(0,0)
var EndPoint = Vector2(0,0)
var FatherSize = Vector2(0,0)
var Area:float =  0.0
var Vertical
###################################################################################
func _ready():
	pass
func _process(delta):
	pass
func _grabData1(startPoint, endPoint, fatherSize):
	StartPoint = startPoint
	EndPoint = endPoint
	FatherSize = fatherSize	
#######################################################################
func _doAll():
	_setSize(FatherSize,_relativeSize(StartPoint, EndPoint))
	_setPosition(StartPoint, EndPoint,self)
	pass

func _relativeSize(startPoint, endPoint):
	var res = {"width":0,"height":0}
	
	res["width"] = abs(endPoint.x - startPoint.x)
	res["height"] = abs(endPoint.y - startPoint.y)
	Area = res["width"] * res["height"]
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
	
func _setPosition(startPoint, endPoint, pad):
	var temp = Vector2(startPoint.x,startPoint.y)
	pad.set_position(temp)
	var AC = abs(endPoint.x - startPoint.x)
	var BC =  abs(endPoint.y - startPoint.y)	
	var a = atan(BC/AC)
	var degrees = a * (180 / PI)
	pad.rotate(degrees)
	pass

	
	
