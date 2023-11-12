extends BaseObject

signal _start_minigame(minigame) 
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _player_interact(player):
	var minigame = $minigame
	print(minigame)
	_start_minigame.emit(minigame)
	pass


func _on_area_2d_area_entered(area):

	pass # Replace with function body.


func _on_area_2d_area_exited(area):
	pass # Replace with function body.
