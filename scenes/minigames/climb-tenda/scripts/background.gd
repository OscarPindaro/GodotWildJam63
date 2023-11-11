extends Sprite2D
@export var speed = 400
var hit = 0
var velocity = Vector2()  
var start_vel = 0

func _ready():
	pass



func _process(delta):
	velocity.y += 1
	if hit == 1:
		start_vel = start_vel * 0.95
		position += velocity.normalized() * start_vel
	if start_vel <= 10:
		start_vel = speed
		hit = 0


func _on_cat_hit(area):
	start_vel = speed
	hit = 1

