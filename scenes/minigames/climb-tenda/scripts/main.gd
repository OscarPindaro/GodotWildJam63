extends Node
@export var letter_scene: PackedScene
@onready var cat = $cat
var start_pos = 0
var score = 0
	
func _on_letter_timer_timeout():
	var letter = letter_scene.instantiate()
	add_child(letter)
	$cat.hit.connect(letter._on_cat_hit)
	if start_pos == 0:
		letter.position = $position1.position
		start_pos = 1
	else:
		letter.position = $position2.position
		start_pos = 0


func _on_cat_scored():
	score += 10


func _on_announcer_player_finished():
	$letter_timer.start()




func _on_minigame_timer_timeout():
	$letter_timer.stop()
	var children = self.get_children()
	for c in children:
		if c.is_in_group('letterGroup'):
			remove_child(c)
	
