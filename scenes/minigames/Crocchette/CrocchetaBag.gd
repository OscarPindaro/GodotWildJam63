extends Area2D

var mouse_inside : bool = false
var mouse_active: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseButton:
		# print("Mouse Click/Unclick at: ", event.position)
		if event.pressed and mouse_inside:
			mouse_active = true
		else:
			mouse_active = false
			# else if not event.pressed and mouse_inside:
			# 	mouse_active = 
			# print(event)
	

func _process(delta):
	if mouse_active:
		position = get_viewport().get_mouse_position()

func _on_mouse_entered():
	mouse_inside = true


func _on_mouse_exited():
	mouse_inside = false
