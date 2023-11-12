extends Node

signal _minigame_started()

signal _minigame_ended()

var starters = []

var score = 0
@onready var score_label = $ScoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	# Subscribe to all _hero_entered and _hero_exited signals
	starters = get_tree().get_nodes_in_group("minigameStarter")
	for i in range(0, starters.size()):
		starters[i]._start_minigame.connect(Callable(_startMinigame))
	score_label.text = '0'
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	#print(starters)
	pass


func _startMinigame(minigame):
	#var instance = load(minigamePath).instantiate() 
	_minigame_started.emit()
	var instance = minigame.instantiate() 
	#print(minigamePath)
	#var instance = new()
	add_child(instance)
	instance._minigame_ending.connect(Callable(_endMinigame))
	pass
	
func _endMinigame(minigame):
	score += minigame.current_score
	minigame.queue_free()
	_minigame_ended.emit()
	score_label.text = str(score)
	global.score = score
	pass
