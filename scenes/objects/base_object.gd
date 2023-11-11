extends Node2D
class_name BaseObject

signal _player_entered(area)

signal _player_exited(area)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_area_body_entered(body):
	if body.is_in_group("player"):
		_player_entered.emit(self)
	
	pass # Replace with function body.


func _on_area_body_exited(body):
	if body.is_in_group("player"):
		_player_exited.emit(self)
		
	pass # Replace with function body.


func _player_interact(player):
	
	pass


func connect_to_characters():
		
	var players = get_tree().get_nodes_in_group("player")
	for i in range(0, players.size()):
		players[i].connect_runtime_interactable(self)
