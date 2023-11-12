extends Node

signal _minigame_started()

signal _minigame_ended()

var starters 

# Called when the node enters the scene tree for the first time.
func _ready():
	# Subscribe to all _hero_entered and _hero_exited signals
	starters = get_tree().get_nodes_in_group("minigameStarter")
	for i in range(0, starters.size()):
		starters[i]._start_minigame.connect(Callable(_startMinigame))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	#print(starters)
	pass


func _startMinigame(minigame):
	minigame.start()
