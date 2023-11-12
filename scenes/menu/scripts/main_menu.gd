extends Control

@export var game_scene : PackedScene


func _ready():
	$title_theme.play()

func _on_play_button_pressed():
	get_tree().change_scene_to_packed(game_scene)


func _on_first_finished():
	$Loop.play()
