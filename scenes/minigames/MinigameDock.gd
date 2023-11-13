extends Node

signal _minigame_started()

signal _minigame_ended()

var starters = []

var score = 0
@onready var score_label = $ScoreLabel
@onready var music_player = $InGameMusic

@export var game_scene : PackedScene
@export var max_minigames = 0
var played_minigames = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	# Subscribe to all _hero_entered and _hero_exited signals
	music_player.play()
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
	music_player.stop()
	_minigame_started.emit()
	var instance = minigame.instantiate(0)
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
	played_minigames += 1
	if played_minigames >= max_minigames:
		get_tree().change_scene_to_packed(game_scene)
	music_player.play()
	pass

