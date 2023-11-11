extends Sprite2D
#####################################################################
var StartPoint = Vector2(0,0)
var EndPoint = Vector2(0,0)
var FatherSize = Vector2(0,0)
var Area:float =  0.0
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
	if startPoint.x > endPoint.x:
		res["width"] = startPoint.x - endPoint.x
	else:
		res["width"] = endPoint.x - startPoint.x
	if startPoint.y > endPoint.y:
		res["height"] = startPoint.y - endPoint.y
	else:
		res["height"] = endPoint.y - startPoint.y
	Area = res["width"] * res["height"]
	return res
	
func _setSize(fatherSize,relativeSize):
	var xZ = fatherSize.x
	var yZ = fatherSize.y
	
	var xC = relativeSize.width
	var yC = relativeSize.height
	
	var Fx = (xC * 100)/xZ
	var Fy = (yC * 100)/xZ
	self.scale.x = Fx/100
	self.scale.y = Fy/100
	
func _setPosition(startPoint, endPoint, pad):
	var temp = Vector2(startPoint.x,startPoint.y)
	pad.set_position(temp)
