extends Control
@export var game_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	$end_line.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	get_tree().change_scene_to_packed(game_scene)
