extends Node

@export var croc_bag_path : NodePath
var croc_bag
@export var down_limit : int = 1080


# Called when the node enters the scene tree for the first time.
func _ready():
	croc_bag = get_node(croc_bag_path)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var to_remove = []
	for child in $"../CrocchettaBag/Crocs".get_children():
		if child.global_position.y > down_limit:
			to_remove.append(child)
			
	for rem in to_remove:
		rem.queue_free()
		
